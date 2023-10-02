using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDEstados
{
    class Estado
    {
        public int Id { get; set; }
        public string Nombre { get; set; }

        public Estado(int id, string nombre)
        {
            Id = id;
            Nombre = nombre;
        }
    }
}
