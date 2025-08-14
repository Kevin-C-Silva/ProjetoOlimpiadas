using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProjetoOlimpiadas.Data;
using ProjetoOlimpiadas.Models;
using System.Collections.Generic;

namespace ProjetoOlimpiadas.Controllers
{
    public class AtletasController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        private readonly Database db = new Database();

        public IActionResult Criar()
        {
            ViewBag.Cidades = GetCidades(); 
            return View();
        }

        [HttpPost]
        public IActionResult Criar(Atletas atletas)
        {
            using (var conn = db.GetConnection())
            {
                var sql = @"insert into atletas (nomeAtleta, dataNascimento, sexo, altura, peso, codCidade) 
                     values (@nome, @data, @sexo, @altura, @peso, @cidade);";
                var cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@nome", atletas.NomeAtleta);
                cmd.Parameters.AddWithValue("@data", atletas.DataNascimento);
                cmd.Parameters.AddWithValue("@sexo", atletas.Sexo);
                cmd.Parameters.AddWithValue("@altura", atletas.Altura);
                cmd.Parameters.AddWithValue("@peso", atletas.Peso);
                cmd.Parameters.AddWithValue("@cidade", atletas.CodCidade);
                cmd.ExecuteNonQuery();
            }
            return RedirectToAction("Index");
        }

        private List<Cidades> GetCidades()
        {
            List<Cidades> cidades = new List<Cidades>();
            using (var conn = db.GetConnection())
            {
                var sql = "select distinct * from Cidades order by nomeCidade";
                var cmd = new MySqlCommand(sql, conn);
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    cidades.Add(new Cidades
                    {
                        CodCidade = reader.GetInt32("codCidade"),
                        NomeCidade = reader.GetString("nomeCidade"),
                        CodEstado = reader.GetInt32("codEstado")
                    });
                }                
            }
            return cidades;
        }
    }
}
