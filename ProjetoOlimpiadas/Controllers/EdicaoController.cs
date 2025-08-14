using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProjetoOlimpiadas.Data;
using ProjetoOlimpiadas.Models;
using System.Collections.Generic;


namespace ProjetoOlimpiadas.Controllers
{
    public class EdicaoController : Controller
    {
        private readonly Database db = new Database();

        public IActionResult Index()
        {
            List<Edicoes> edicoes = new List<Edicoes>();
            using (MySqlConnection conn = db.GetConnection())
            {
                string sql = "select * from edicoes";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        edicoes.Add(new Edicoes
                        {
                            CodEdicao = reader.GetInt32("codEdicao"),
                            Ano = reader.GetInt32("ano"),
                            Sede = reader.GetString("sede")
                        });
                    }
                }
            }
            return View(edicoes);
        }

        public IActionResult Atletas(int id)
        {
            List<Atletas> atletas = new List<Atletas>();
            string nomeEdicao = "";
            int totalAtletas = 0;
            using (MySqlConnection conn = db.GetConnection())
            {
                string query = @"select distinct 
                                a.codAtleta, 
                                a.nomeAtleta, 
                                a.dataNascimento, 
                                a.sexo, 
                                a.codCidade,
                                m.codModalidade, 
                                m.nomeModalidade
                                from resultadosatletas r
                                join provas p on p.codProva = r.codProva
                                join atletas a on a.codAtleta = r.codAtleta
                                left join modalidades m on m.codModalidade = p.codModalidade
                                where r.codEdicao = @id";

                MySqlCommand cmd = new MySqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", id);
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        atletas.Add(new Atletas
                        {
                            CodAtleta = reader.GetInt32(reader.GetOrdinal("codAtleta")),

                            NomeAtleta = reader.IsDBNull(reader.GetOrdinal("nomeAtleta")) ? null : reader.GetString(reader.GetOrdinal("nomeAtleta")),

                            DataNascimento = reader.IsDBNull(reader.GetOrdinal("dataNascimento")) ? null
                                : reader.GetString(reader.GetOrdinal("dataNascimento")),

                            Sexo = reader.IsDBNull(reader.GetOrdinal("sexo"))
                                ? '\0'  // valor padrão para char
                                : reader.GetChar(reader.GetOrdinal("sexo")),

                            CodCidade = reader.IsDBNull(reader.GetOrdinal("codCidade"))
                                ? 0  // ou (int?)null se for Nullable<int>
                                : reader.GetInt32(reader.GetOrdinal("codCidade")),

                            CodModalidade = reader.IsDBNull(reader.GetOrdinal("codModalidade"))
                                ? 0  // ou (int?)null se sua propriedade for Nullable
                                : reader.GetInt32(reader.GetOrdinal("codModalidade")),

                            Modalidade = reader.IsDBNull(reader.GetOrdinal("nomeModalidade"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("nomeModalidade"))
                        });
                    }
                }
                totalAtletas = atletas.Count;
            }
            ViewBag.EdicaoId = id;
            ViewBag.TotalAtletas = totalAtletas;
            return View(atletas);
        }

        public IActionResult Detalhes(int id)
        {
            Atletas atleta = null;
            List<(string Prova, string Edicao, string Resultado, string Medalha)> participacoes = new();

            using (var conn = db.GetConnection())
            {
                string query = @"
                                select 
                                a.codAtleta,a.nomeAtleta,a.dataNascimento,a.sexo,c.codCidade, c.nomeCidade,e.nomeEstado,
                                m.codModalidade, m.nomeModalidade,p.nomeProva,r.resultado,r.medalha 
                                from atletas a
                                join cidades c on c.codCidade = a.codCidade
                                join estados e on e.codEstado = c.codEstado
                                join resultadosatletas r on r.codAtleta = a.codAtleta
                                join provas p on p.codProva = r.codProva
                                join modalidades m on m.codModalidade = p.codModalidade
                                where a.codAtleta = @id";

                var cmd = new MySqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", id);

                using (var reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        atleta = new Atletas
                        {
                            CodAtleta = reader.GetInt32("codAtleta"),
                            NomeAtleta = reader.GetString("nomeAtleta"),
                            DataNascimento = reader.GetString("dataNascimento"),
                            Sexo = reader.GetChar("sexo"),
                            CidadeNascimento = reader.GetString("nomeCidade"),
                            CodModalidade = reader.GetInt32("codModalidade"),
                            Modalidade = reader.GetString("nomeModalidade"),
                            EstadoNascimento = reader.GetString("nomeEstado"),
                            CodCidade = reader.GetInt32("codCidade")
                        };
                    }
                }

                // Buscar participações
                string participacaoQuery = @"
                                            select p.nomeProva, e.ano, e.sede, r.resultado, r.medalha
                                            from resultadosatletas r
                                            join provas p on p.codProva = r.codProva
                                            join edicoes e on e.codEdicao = r.codEdicao
                                            where r.codAtleta = @id";

                var cmd2 = new MySqlCommand(participacaoQuery, conn);
                cmd2.Parameters.AddWithValue("@id", id);
                using (var reader = cmd2.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        participacoes.Add((
                            reader.IsDBNull(reader.GetOrdinal("nomeProva"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("nomeProva")),

                            $"{(reader.IsDBNull(reader.GetOrdinal("ano"))
                                ? "?"
                                : reader.GetInt32(reader.GetOrdinal("ano")).ToString())} - {(reader.IsDBNull(reader.GetOrdinal("sede"))
                                ? "?"
                                : reader.GetString(reader.GetOrdinal("sede")))}",

                            reader.IsDBNull(reader.GetOrdinal("resultado"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("resultado")),

                            reader.IsDBNull(reader.GetOrdinal("medalha"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("medalha"))
                        ));
                    }

                }
            }
            ViewBag.Participacoes = participacoes;
            return View(atleta);
        }

    }
}