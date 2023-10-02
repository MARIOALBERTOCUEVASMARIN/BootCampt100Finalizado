using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HolaMundoMVC.Controllers
{
    public class HolaMundoController : Controller
    {
        // GET: HolaMundo
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Ciclos()
        {
            return View();
        }

    }
}