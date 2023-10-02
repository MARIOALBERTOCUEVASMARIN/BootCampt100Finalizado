using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LINQ
{
    internal class Alumno
    {
        public Alumno(int id, string nombre, int calidicacion, int idEstado, int idEstatus)
        {
            Id = id;
            Nombre = nombre;
            Calidicacion = calidicacion;
            IdEstado = idEstado;
            IdEstatus = idEstatus;
        }

        public int Id { get; set; }    
        public string Nombre { get; set; }
        public int Calidicacion { get; set; }
        public int IdEstado { get; set; }
        public int IdEstatus { get; set; }
    }
}
