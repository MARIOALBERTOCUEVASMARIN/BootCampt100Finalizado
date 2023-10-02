using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntroduccionCS
{
    internal class Cadenas
    {
        public static void HolaMundo()
        {
            string nombre;
            string apellido;
            string apellido2;
            int edad;
            string instructor;

            Console.WriteLine("Proporciona tu nombre");
            nombre = Console.ReadLine();
            Console.WriteLine("Proporciona tu primer apellido");
            apellido = Console.ReadLine();
            Console.WriteLine("Proporciona tu segundo apellido");
            apellido2 = Console.ReadLine();
            Console.WriteLine("proporciona tu edad");
            edad = Convert.ToInt32(Console.ReadLine());
            Console.ReadKey();

            Console.WriteLine("Hola" + " " + nombre.Trim() + " " + apellido.Trim() + " " + apellido2.Trim());//CONCATENACION

            Console.ReadKey();

            Console.WriteLine("{0} {1} {2} tiene {3} años", nombre.Trim(), apellido.Trim(), apellido2.Trim(), edad);//COMPUESTO

            Console.ReadKey();

            instructor = $"Gusto en conocerte {nombre.ToUpper().Trim()} {apellido.ToUpper().Trim()} {apellido2.ToUpper().Trim()}!!!";
            Console.WriteLine(instructor); //INTERPOLACION Y MAYUSCULAS

            Console.ReadKey();

            string mensaje;
            string ruta;

                  mensaje = ("El archivo fue almacenado en : \n");
                     ruta = @"C:\Users\Tichs\Desktop\BootCampt\c#\dia 1\IntroduccionCS\IntroduccionCS";
            Console.ReadKey();
            Console.WriteLine(mensaje);
            Console.WriteLine(ruta);
            Console.ReadKey();


        }


    }
}
