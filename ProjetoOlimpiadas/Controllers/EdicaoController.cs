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
                            codEdicao = reader.GetInt32("codEdicao"),
                            ano = reader.GetInt32("ano"),
                            sede = reader.GetString("sede")
                        });
                    }
                }
            }
            return View(edicoes);
        }
    }
}
