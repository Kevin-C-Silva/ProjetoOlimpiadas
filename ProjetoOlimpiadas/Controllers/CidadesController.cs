using Microsoft.AspNetCore.Mvc;

namespace ProjetoOlimpiadas.Controllers
{
    public class CidadesController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
