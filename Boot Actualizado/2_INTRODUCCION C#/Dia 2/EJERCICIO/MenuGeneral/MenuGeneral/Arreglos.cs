using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MenuGeneral
{
    public class Arreglos
    {
        public static void Cadenas()
        {
            Console.WriteLine("                  Proporciona tu nombre completo:");
            string nombreCompleto = Console.ReadLine();

            Console.WriteLine("Hola");

            string[] palabras = nombreCompleto.Split(' ');

            foreach (string palabra in palabras)
            {
                Console.WriteLine(palabra);
            }

            Console.WriteLine("Apellido Vertical");

            foreach (char letra in palabras[palabras.Length - 1])
            {
                Console.WriteLine(letra);
            }
        }

        public static void Enteros()
        {
            int[] numeros = new int[5];
            int maximo = int.MinValue;

            for (int i = 0; i < 5; i++)
            {
                Console.Write($"                       Ingrese el número {i + 1}: ");
                if (int.TryParse(Console.ReadLine(), out numeros[i]))
                {
                    if (numeros[i] > maximo)
                    {
                        maximo = numeros[i];
                    }
                }
                else
                {
                    Console.WriteLine("             Entrada no válida. Por favor, ingrese un número entero.");
                    i--;
                }
            }

            Console.WriteLine($"                        El número máximo es: {maximo}");
        }

        public static string ConvierteATipoOracion(string input)
        {
            string[] palabras = input.Split(' ');
            for (int i = 0; i < palabras.Length; i++)
            {
                if (!string.IsNullOrEmpty(palabras[i]))
                {
                    palabras[i] = char.ToUpper(palabras[i][0]) + palabras[i].Substring(1);
                }
            }

            return string.Join(" ", palabras);
        }
    }
}

