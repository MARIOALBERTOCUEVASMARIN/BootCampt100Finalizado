using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interfaces
{
    internal class Triangulo : IFigura
    {
        private double baseTriangulo;
        private double altura;
        public Triangulo(double baseTriangulo, double altura)
        {
            this.baseTriangulo = baseTriangulo;
            this.altura = altura;
        }

        public double Area()
        {
            return (baseTriangulo * altura)/2;

        }
        public double Perimetro()
        {
            return 2 * (baseTriangulo / 2) + Math.Sqrt(Math.Pow(baseTriangulo / 2, 2) + Math.Pow(altura, 2));
        }
    }
}
