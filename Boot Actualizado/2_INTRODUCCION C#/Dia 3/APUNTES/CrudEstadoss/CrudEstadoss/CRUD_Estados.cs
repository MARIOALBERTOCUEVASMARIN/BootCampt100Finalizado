using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CrudEstadoss
{
    public class CRUD_Estados
    {
        Dictionary<int, Estado> _listEstados = new Dictionary<int, Estado>();
        public Dictionary<int, Estado> ConsultarTodos()
        {
            return _listEstados;    
        }
        public Estado ConsultarSoloUno(int id)
        {
            return _listEstados[id];
        }
        public void Agregar(Estado estado)
        {
            _listEstados.Add(estado.id,estado);
        }
        public void Actualizar(Estado estado)
        {
            _listEstados[estado.id] = estado;   
        }
        public void Eliminar(int id)
        {
            _listEstados.Remove(id);    
        }
    }
}
