using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProjetoOlimpiadas.Data;
using ProjetoOlimpiadas.Models;

namespace ProjetoOlimpiadas.Controllers
{
    public class ProvasController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        private readonly Database db = new Database();

        public IActionResult Criar()
        {
            ViewBag.Modalidades = GetModalidades();
            return View();
        }

        [HttpPost]
        public IActionResult Criar(Provas provas)
        {
            using (var conn = db.GetConnection())
            {
                var sql = @"insert into atletas (nomeProva, codModalidade) 
                     values (@nome, @modalidade);";
                var cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@nome", provas.NomeProva);
                cmd.Parameters.AddWithValue("@modalidade", provas.CodModalidade);
                cmd.ExecuteNonQuery();
            }
            return RedirectToAction("Index");
        }

        private List<Modalidades> GetModalidades()
        {
            List<Modalidades> modalidades = new List<Modalidades>();
            using (var conn = db.GetConnection())
            {
                var sql = "select distinct * from Modalidades order by nomeModalidade";
                var cmd = new MySqlCommand(sql, conn);
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    modalidades.Add(new Modalidades
                    {
                        CodModalidade = reader.GetInt32("codModalidade"),
                        NomeModalidade = reader.GetString("nomeModalidade")
                    });
                }
            }
            return modalidades;
        }
    }
}
