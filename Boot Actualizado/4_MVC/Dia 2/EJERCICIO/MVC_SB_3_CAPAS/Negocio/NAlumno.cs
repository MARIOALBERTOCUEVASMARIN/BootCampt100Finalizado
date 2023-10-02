using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;
using Negocio.ServiceReference1;

namespace Negocio
{
    public class NAlumno
    {

        private InstitutoTichEntities _DbContext = new InstitutoTichEntities();
        // Método para consultar todos los alumnos
        public List<Alumnos> Consultar()
        {
            {
                return _DbContext.Alumnos.ToList();
            }
        }

        // Método para consultar un alumno por su ID
        public Alumnos Consultar(int id)
        {
            using (var contexto = new InstitutoTichEntities()) 
            {
                return contexto.Alumnos.Find(id);
            }
        }

        // Método para agregar un alumno
        public void Agregar(Alumnos alumno)
        {
            using (var contexto = new InstitutoTichEntities()) 
            {
                contexto.Alumnos.Add(alumno);
                contexto.SaveChanges();
            }
        }

        // Método para actualizar un alumno
        public void Actualizar(Alumnos alumno)
        {
            using (var contexto = new InstitutoTichEntities()) 
            {
                contexto.Entry(alumno).State = (System.Data.Entity.EntityState)EntityState.Modified;
                contexto.SaveChanges();
            }
        }

        // Método para eliminar un alumno por su ID
        public void Eliminar(int id)
        {
            using (var contexto = new InstitutoTichEntities()) 
            {
                var alumno = contexto.Alumnos.Find(id);
                if (alumno != null)
                {
                    contexto.Alumnos.Remove(alumno);
                    contexto.SaveChanges();
                }
            }
        }


        public Negocio.ServiceReference1.AportacionesIMSS CalcularIMSS(int id)
        {
            ServiceReference1.AlumnosWCFClient alum = new ServiceReference1.AlumnosWCFClient();
            return alum.CalcularIMSS(id);

        }



        public Negocio.ServiceReference1.ItemTablaISR CalcularISR(int id)
        {
            ServiceReference1.AlumnosWCFClient alum = new ServiceReference1.AlumnosWCFClient();
            return alum.ItemTablaISR(id);

        }



    }
}
