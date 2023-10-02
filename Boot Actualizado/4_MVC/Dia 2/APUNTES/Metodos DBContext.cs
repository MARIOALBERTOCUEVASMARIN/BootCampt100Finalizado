using EF_DBContext.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EF_DBContext.Controllers
{
    public class HomeController : Controller
    {
        private InstitutoTichEntities1 _DBContext = new InstitutoTichEntities1();
        private List<Cursos> _lstCursos;
        private Cursos _oCurso;
        private CatCursos _oCatCurso;

        public ActionResult Index()
        {

    
            return View();
        }

        public ActionResult ConsultaLista()
        {
            // Carga perezosa
            //Deshabilitada la carga perezosa = false --Indica que solo cargara los datos de la tabla que se esta solicitando. 
            _DBContext.Configuration.LazyLoadingEnabled = false;
            _lstCursos = _DBContext.Cursos.ToList();

            return View(_lstCursos);
        }

        public ActionResult ConsultaListaInclude()
        {
            _DBContext.Configuration.LazyLoadingEnabled = false;

            //Include
            _lstCursos = _DBContext.Cursos.Include(curso => curso.CatCursos).ToList();

            //Carga perezosa habilitada = true ---Indica que cargara la tabla que estamos seleccionando más todas las tablas relacionadas.
            _DBContext.Configuration.LazyLoadingEnabled = true;

            _lstCursos = _DBContext.Cursos.ToList();

            return View("ConsultaLista", _lstCursos);
        }
        public ActionResult ConsultaElemento()
        {
            _DBContext.Configuration.LazyLoadingEnabled = false;
            _oCurso = _DBContext.Cursos.Find(1);

            return View(_oCurso);
        }

        public ActionResult ConsultaElementoInclude()
        {
            _DBContext.Configuration.LazyLoadingEnabled = false;
            //Include
            _oCurso = _DBContext.Cursos.Include(x => x.CatCursos).Where(x => x.id==1).FirstOrDefault();
           
            _oCatCurso = _DBContext.CatCursos.Find(_oCurso.idCatCurso);


            
            _DBContext.Configuration.LazyLoadingEnabled = true;

            _oCurso = _DBContext.Cursos.Find(1);

            return View("ConsultaElemento", _oCurso);
        }
        public ActionResult Agregar()
        {
            //_DBContext.Configuration.LazyLoadingEnabled = true;
            //_oCurso = _DBContext.Cursos.Find(1);
            // Agregar
            Cursos nuevoCurso = new Cursos()
            {
                idCatCurso = 1,
                fechaInicio = new DateTime(2021, 09, 13),
                fechaTermino = new DateTime(2021, 10, 13),
                activo = true
            };
            _DBContext.Cursos.Add(nuevoCurso);
            _DBContext.SaveChanges();
 
            _oCurso = _DBContext.Cursos.Find(nuevoCurso.id);

            return View("ConsultaElemento", _oCurso);
        }

        public ActionResult Modificar(int? id)
        {

            _oCurso = _DBContext.Cursos.Find(id ?? 8);
            _oCurso.fechaInicio = new DateTime(2022, 02, 07);
            _oCurso.fechaTermino = new DateTime(2022, 03, 04);
            _DBContext.SaveChanges();

            return View("ConsultaElemento", _oCurso);
        }

        public ActionResult ModificarEntry(int? id)
        {
            Cursos oCurso = new Cursos()
            {
                id = (short)(id ?? 8),
                idCatCurso = 1,
                fechaInicio = new DateTime(2021, 09, 15),
                fechaTermino = new DateTime(2021, 10, 18),
                activo = true
            };
            //var entrada = _DBContext.Entry(oCurso);
            //entrada.State = EntityState.Modified;
            _DBContext.Entry(oCurso).State = EntityState.Modified;
            _DBContext.SaveChanges();

            _oCurso = _DBContext.Cursos.Find(id ?? 8);

            return View("ConsultaElemento", _oCurso);
        }
        public ActionResult Eliminar(int? id)
        {
            _oCurso = _DBContext.Cursos.Find(id);
            //_DBContext.Entry(_oCurso).State = EntityState.Deleted;
            _DBContext.Cursos.Remove(_oCurso);
            _DBContext.SaveChanges();
            return RedirectToAction("Index");
        }


        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}