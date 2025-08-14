using Microsoft.AspNetCore.Mvc;

namespace ProjetoOlimpiadas.Controllers
{
    public class ProvasController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
