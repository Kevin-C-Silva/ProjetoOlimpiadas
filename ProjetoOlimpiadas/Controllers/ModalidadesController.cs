using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProjetoOlimpiadas.Data;
using ProjetoOlimpiadas.Models;

namespace ProjetoOlimpiadas.Controllers
{
    public class ModalidadesController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        private readonly Database db = new Database();

        public IActionResult Criar()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Criar(Modalidades modalidades)
        {
            using (var conn = db.GetConnection())
            {
                var sql = @"insert into modalidades (nomeModalidade)
                     values (@nome);";
                var cmd = new MySqlCommand(sql, conn);                
                cmd.Parameters.AddWithValue("@nome", modalidades.NomeModalidade);
                cmd.ExecuteNonQuery();
            }
            return RedirectToAction("Index");
        }
    }
}