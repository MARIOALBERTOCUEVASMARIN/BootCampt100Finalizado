using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Datos;
using Negocio;
using Entidades;

namespace MVC_Razor_ADO.Controllers
{
    public class AlumnoController : Controller
    {
        // GET: Alumno
        NAlumno nAlumno = new NAlumno();
        NEstado nEstado = new NEstado();
        NEstatusAlumno nEAlumno = new NEstatusAlumno();

        // GET: Alumnos
        public ActionResult Index()
        {
            List<Alumno> lstAlumnos = nAlumno.Consultar();
            ViewBag.Estado = nEstado.Consultar(); // Obtener la lista de estados
            ViewBag.Estatus = nEAlumno.Consultar(); // Obtener la lista de estatus de alumno
            return View(lstAlumnos);
        }

        // GET: Alumnos/Details/5
        public ActionResult Details(int id)
        {
            Alumno alumno = nAlumno.Consultar(id);
            if (alumno == null)
            {
                return HttpNotFound();
            }
            return View(alumno);
        }

        // GET: Alumnos/Delete/5
        public ActionResult Delete(int id)
        {
            Alumno alumno = nAlumno.Consultar(id);
            if (alumno == null)
            {
                return HttpNotFound();
            }
            return View(alumno);
        }

        // POST: Alumnos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id) //pendiente
        {
            nAlumno.Eliminar(id);
            return RedirectToAction("Index");
        }

        // GET: Alumnos/Create
        public ActionResult Create()
        {
            ViewBag.Estado = nEstado.Consultar();
            ViewBag.Estatus = nEAlumno.Consultar(); 
            return View();
        }

        // POST: Alumnos/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Alumno alumno) //pendiete
        {
            if (ModelState.IsValid)
            {
                nAlumno.Agregar(alumno);
                return RedirectToAction("Index");
            }

            ViewBag.Estado = nEstado.Consultar(); 
            ViewBag.Estatus = nEAlumno.Consultar(); 
            return View(alumno);
        }

        // GET: Alumnos/Edit/5
        public ActionResult Edit(int id)
        {
            Alumno alumno = nAlumno.Consultar(id);
            if (alumno == null)
            {
                return HttpNotFound();
            }
            ViewBag.Estado = nEstado.Consultar();
            ViewBag.Estatus = nEAlumno.Consultar(); 
            return View(alumno);
        }

        // POST: Alumnos/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Alumno alumno) //pendiente
        {
            if (ModelState.IsValid)
            {
                nAlumno.Actualizar(alumno);
                return RedirectToAction("Index");
            }

            ViewBag.Estado = nEstado.Consultar(); // Obtener la lista de estados
            ViewBag.Estatus = nEAlumno.Consultar(); // Obtener la lista de estatus de alumno
            return View(alumno);
        }
    }
}

