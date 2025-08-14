using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProjetoOlimpiadas.Data;
using ProjetoOlimpiadas.Models;

namespace ProjetoOlimpiadas.Controllers
{
    public class ResultadosAtletasController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        private readonly Database db = new Database();

        public IActionResult Criar()
        {
            ViewBag.Atletas = GetAtletas();
            ViewBag.Provas = GetProvas();
            ViewBag.Edicoes = GetEdicoes();
            return View();
        }

        [HttpPost]
        public IActionResult Criar(ResultadosAtletas resultadosAtletas)
        {
            using (var conn = db.GetConnection())
            {
                var sql = @"insert into ResultadosAtletas (codAtleta, codProva, codEdicao, resultado, medalha) 
                     values (@atleta, @prova, @edicao, @resultado, @medalha);";
                var cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@atleta", resultadosAtletas.CodAtleta);
                cmd.Parameters.AddWithValue("@prova", resultadosAtletas.CodProva);
                cmd.Parameters.AddWithValue("@edicao", resultadosAtletas.CodEdicao);
                cmd.Parameters.AddWithValue("@resultado", resultadosAtletas.Resultado);
                cmd.Parameters.AddWithValue("@medalha", resultadosAtletas.Medalha);
                cmd.ExecuteNonQuery();
            }
            return RedirectToAction("Index");
        }

        private List<Atletas> GetAtletas()
        {
            List<Atletas> atletas = new List<Atletas>();
            using (var conn = db.GetConnection())
            {
                var sql = "select distinct * from Atletas order by nomeAtleta";
                var cmd = new MySqlCommand(sql, conn);
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    atletas.Add(new Atletas
                    {
                        CodAtleta = reader.GetInt32("codAtleta"),
                        NomeAtleta = reader.GetString("nomeAtleta"),
                        DataNascimento = reader.GetString("dataNascimento"),
                        Sexo = reader.GetChar("sexo"),                        
                        CodCidade = reader.GetInt32("codCidade")
                    });
                }
            }
            return atletas;
        }
        private List<Provas> GetProvas()
        {
            List<Provas> provas = new List<Provas>();
            using (var conn = db.GetConnection())
            {
                var sql = "select distinct * from Provas order by nomeProva";
                var cmd = new MySqlCommand(sql, conn);
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    provas.Add(new Provas
                    {
                        CodProva = reader.GetInt32("codProva"),
                        NomeProva = reader.GetString("nomeProva"),
                        CodModalidade = reader.GetInt32("codModalidade")
                    });
                }
            }
            return provas;
        }
        private List<Edicoes> GetEdicoes()
        {
            List<Edicoes> edicoes = new List<Edicoes>();
            using (var conn = db.GetConnection())
            {
                var sql = "select distinct * from Edicoes order by ano";
                var cmd = new MySqlCommand(sql, conn);
                var reader = cmd.ExecuteReader();
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
            return edicoes;
        }
    }
}
