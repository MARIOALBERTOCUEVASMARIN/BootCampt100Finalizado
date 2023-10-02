using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hola_mundo
{
    public class saludo
    {
        public static string SaludarEstatico(string nombre)
        {
            return "¿como estas?" + nombre + " desde un metodo estatico";
        }
        public string Saludar (string nombre)
        {
            return "¿como estas?" + nombre + " desde un metodo estatico";
        }
    }
}

