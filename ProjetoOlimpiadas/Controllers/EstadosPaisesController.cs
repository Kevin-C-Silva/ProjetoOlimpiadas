using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProjetoOlimpiadas.Data;
using ProjetoOlimpiadas.Models;

namespace ProjetoOlimpiadas.Controllers
{
    public class EstadosPaisesController : Controller
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
        public IActionResult Criar(EstadosPaises estadosPaises)
        {
            using (var conn = db.GetConnection())
            {
                var sql = @"insert into estados (nomeEstado) 
                     values (@nome);";
                var cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@nome", estadosPaises.NomeEstado);                
                cmd.ExecuteNonQuery();
            }
            return RedirectToAction("Index");
        }
    }
}
