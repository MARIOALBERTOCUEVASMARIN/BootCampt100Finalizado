using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Conexiones
{
    internal class Estatus 
    {
        public int id { get; set; }

        public string clave { get; set; }

        public string nombre { get; set; }
    }
}
