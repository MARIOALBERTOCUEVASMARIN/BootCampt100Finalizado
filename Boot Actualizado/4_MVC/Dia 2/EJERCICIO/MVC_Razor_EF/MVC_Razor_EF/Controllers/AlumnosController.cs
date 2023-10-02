using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MVC_Razor_EF.Models;

namespace MVC_Razor_EF.Controllers
{

    public class AlumnosController : Controller
    {
        InstitutoTichEntities  _DbContext = new InstitutoTichEntities();
        List<Alumnos> ListAl = new List<Alumnos>();


        // GET: Alumnos
        public ActionResult Index()
        {
            ListAl = _DbContext.Alumnos.ToList();
            return View(ListAl);
        }





        // GET: Alumnos/Details/5
        public ActionResult Details(int id)
        {
            return View(_DbContext.Alumnos.Find(id));
        }







        // GET: Alumnos/Create
        public ActionResult Create()
        {
            ViewBag.IdEstadoOrigen = new SelectList(_DbContext.Estados, "id", "nombre");
            ViewBag.IdEstatus = new SelectList(_DbContext.EstatusAlumnos, "id", "nombre");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,nombre,primerApellido,segundoApellido,correo,telefono,fechaNacimiento,curp,sueldo,idEstadoOrigen,idEstatus")] Alumnos alumno)
        {
            if (ModelState.IsValid)
            {
                _DbContext.Alumnos.Add(alumno);
                _DbContext.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdEstadoOrigen = new SelectList(_DbContext.Estados, "id", "nombre", alumno.idEstadoOrigen);
            ViewBag.IdEstatus = new SelectList(_DbContext.EstatusAlumnos, "id", "nombre", alumno.idEstatus);
            return View(alumno);
        }







        // GET: Alumnos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Alumnos alumno = _DbContext.Alumnos.Find(id);
            if (alumno == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdEstadoOrigen = new SelectList(_DbContext.Estados, "Id", "Nombre", alumno.idEstadoOrigen);
            ViewBag.IdEstatus = new SelectList(_DbContext.EstatusAlumnos, "Id", "Nombre", alumno.idEstatus);
            return View(alumno);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Nombre,PrimerApellido,SegundoApellido,Correo,Telefono,FechaNacimiento,CURP,Sueldo,IdEstadoOrigen,IdEstatus")] Alumnos alumno)
        {
            if (ModelState.IsValid)
            {
                _DbContext.Entry(alumno).State = EntityState.Modified;
                _DbContext.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdEstadoOrigen = new SelectList(_DbContext.Estados, "Id", "Nombre", alumno.idEstadoOrigen);
            ViewBag.IdEstatus = new SelectList(_DbContext.EstatusAlumnos, "Id", "Nombre", alumno.idEstatus);
            return View(alumno);
        }








        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Alumnos alumno = _DbContext.Alumnos.Find(id);
            if (alumno == null)
            {
                return HttpNotFound();
            }
            return View(alumno);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Alumnos alumno = _DbContext.Alumnos.Find(id);
            _DbContext.Alumnos.Remove(alumno);
            _DbContext.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}
