using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hola_mundo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string nombre;

            Console.WriteLine("¿cual es tu nombre?");
            nombre=Console.ReadLine();

            // Console.WriteLine("Hola, ¿como estas " + nombre + "?");

            string stringRetorno = saludo.SaludarEstatico(nombre);

            Console.WriteLine(stringRetorno);

            Console.ReadKey();


            //metodo no estatico

            saludo objSaludo = new saludo();

            Console.WriteLine(objSaludo.Saludar(nombre));

            Console.ReadKey();



        }
    }
}
