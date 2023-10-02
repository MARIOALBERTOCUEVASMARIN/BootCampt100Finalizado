using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;
using System.Data.Entity;

namespace Negocio
{
    public class NEstatus
    {
        private InstitutoTichEntities _DbContext = new InstitutoTichEntities();

        public List<EstatusAlumnos> Consultar()
        {
            return _DbContext.EstatusAlumnos.ToList();
        }

        public EstatusAlumnos Consultar(int id)
        {
            return _DbContext.EstatusAlumnos.Find(id);
        }

        public void Agregar(EstatusAlumnos estatus)
        {
            _DbContext.EstatusAlumnos.Add(estatus);
            _DbContext.SaveChanges();
        }

        public void Actualizar(EstatusAlumnos estatus)
        {
            _DbContext.Entry(estatus).State = EntityState.Modified;
            _DbContext.SaveChanges();
        }

        public void Eliminar(int id)
        {
            var estatus = _DbContext.EstatusAlumnos.Find(id);
            if (estatus != null)
            {
                _DbContext.EstatusAlumnos.Remove(estatus);
                _DbContext.SaveChanges();
            }
        }
    }
}
