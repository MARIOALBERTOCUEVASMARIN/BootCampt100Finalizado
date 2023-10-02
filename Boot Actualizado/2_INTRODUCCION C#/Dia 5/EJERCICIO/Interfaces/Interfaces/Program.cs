using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interfaces
{
    internal class Program
    {
        static void Main(string[] args)
        {
            IFigura[] FIGURAS = new IFigura[2];
            FIGURAS[0] = new Cuadrado(5);
            FIGURAS[1] = new Triangulo(6,4);

            foreach (var figura in FIGURAS)
            {
                double area = figura.Area();
                double perimetroc = figura.Perimetro();
                Console.WriteLine("Area y perimetro del cuadrado");
                Console.WriteLine($"Area: {area},\nPerimetro: {perimetroc}");
                Console.ReadKey();
                double areat = FIGURAS[1].Area();
                double perimetro = FIGURAS[1].Perimetro();
                Console.WriteLine("Area y perimetro del triangulo");
                Console.WriteLine($"Area: {areat},\nPerimetro: {perimetro}");
                Console.ReadKey();


            }
        }
    }
}
