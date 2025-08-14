using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProjetoOlimpiadas.Data;
using ProjetoOlimpiadas.Models;

namespace ProjetoOlimpiadas.Controllers
{
    public class CidadesController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        private readonly Database db = new Database();

        public IActionResult Criar()
        {
            ViewBag.EstadosPaises = GetEstadosPaises();
            return View();
        }

        [HttpPost]
        public IActionResult Criar(Cidades cidades)
        {
            using (var conn = db.GetConnection())
            {
                var sql = @"insert into cidades (nomeCidade, codEstado) 
                     values (@nome, @estado);";
                var cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@nome", cidades.NomeCidade);
                cmd.Parameters.AddWithValue("@estado", cidades.CodEstado);                
                cmd.ExecuteNonQuery();
            }
            return RedirectToAction("Index");
        }

        private List<EstadosPaises> GetEstadosPaises()
        {
            List<EstadosPaises> estadosPaises = new List<EstadosPaises>();
            using (var conn = db.GetConnection())
            {
                var sql = "select distinct * from Estados order by nomeEstado";
                var cmd = new MySqlCommand(sql, conn);
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    estadosPaises.Add(new EstadosPaises
                    {                        
                        CodEstado = reader.GetInt32("codEstado"),
                        NomeEstado = reader.GetString("nomeEstado")
                    });
                }
            }
            return estadosPaises;
        }
    }
}
