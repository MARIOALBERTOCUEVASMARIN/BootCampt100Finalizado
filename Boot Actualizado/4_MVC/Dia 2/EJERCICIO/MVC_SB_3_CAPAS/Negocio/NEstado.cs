using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NEstado
    {
        private InstitutoTichEntities _DbContext = new InstitutoTichEntities();

        public List<Estados> Consultar()
        {
            return _DbContext.Estados.ToList();
        }

        public Estados Consultar(int id)
        {
            return _DbContext.Estados.Find(id);
        }

        public void Agregar(Estados estado)
        {
            _DbContext.Estados.Add(estado);
            _DbContext.SaveChanges();
        }

        public void Actualizar(Estados estado)
        {
            _DbContext.Entry(estado).State = EntityState.Modified;
            _DbContext.SaveChanges();
        }

        public void Eliminar(int id)
        {
            var estado = _DbContext.Estados.Find(id);
            if (estado != null)
            {
                _DbContext.Estados.Remove(estado);
                _DbContext.SaveChanges();
            }
        }
    }
}
