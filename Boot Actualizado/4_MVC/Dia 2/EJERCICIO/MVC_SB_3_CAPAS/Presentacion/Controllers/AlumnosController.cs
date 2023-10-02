using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.Mvc;
using Negocio.ServiceReference1;

namespace Presentacion.Controllers
{
    public class AlumnosController : Controller
    {


        private NAlumno _nAlumno = new NAlumno();
        private NEstado _nEstado = new NEstado();
        private NEstatus _nEstatus = new NEstatus();


        // GET: Alumnos
        public ActionResult Index()
        {
            var alumnos = _nAlumno.Consultar();
            return View(alumnos);
        }




        // GET: Alumnos/Details/5
        public ActionResult Details(int id)
        {

            var alumno = _nAlumno.Consultar(id);

            return View(alumno);
        }

        // GET: Alumnos/Create
        public ActionResult Create()
        {
            ViewBag.Estados = _nEstado.Consultar();
            ViewBag.Estatus = _nEstatus.Consultar();
            return View();
        }

        // POST: Alumnos/Create
        [HttpPost]
        public ActionResult Create(Alumnos alumno)
        {
            if (ModelState.IsValid)
            {
                _nAlumno.Agregar(alumno);
                return RedirectToAction("Index");
            }
            ViewBag.Estados = _nEstado.Consultar();
            ViewBag.Estatus = _nEstatus.Consultar();
            return View(alumno);
        }

        // GET: Alumnos/Edit/5
        public ActionResult Edit(int? id)
        {

            var alumno = _nAlumno.Consultar(id.Value);
            ViewBag.Estados = _nEstado.Consultar();
            ViewBag.Estatus = _nEstatus.Consultar();
            return View(alumno);
        }

        // POST: Alumnos/Edit/5
        [HttpPost]
        public ActionResult Edit(Alumnos alumno)
        {
            if (ModelState.IsValid)
            {
                _nAlumno.Actualizar(alumno);
                return RedirectToAction("Index");
            }
            ViewBag.Estados = _nEstado.Consultar();
            ViewBag.Estatus = _nEstatus.Consultar();
            return View(alumno);
        }

        // GET: Alumnos/Delete/5
        public ActionResult Delete(int? id)
        {
            var alumno = _nAlumno.Consultar(id.Value);

            return View(alumno);
        }

        // POST: Alumnos/Delete/5
        [HttpPost]
        public ActionResult Delete(int id)
        {
            _nAlumno.Eliminar(id);
            return RedirectToAction("Index");
        }



        public ActionResult _AportacionesIMSS(int id)
        {
            NAlumno alum = new NAlumno();
            AportacionesIMSS aportacionesIMSS = alum.CalcularIMSS(id);
           return PartialView(aportacionesIMSS);
        }

        public ActionResult _TablaISR(int id)
        {
            NAlumno alum = new NAlumno();
            ItemTablaISR itemTablaISR = alum.CalcularISR(id);
            return PartialView(itemTablaISR);
        }



    }
}
