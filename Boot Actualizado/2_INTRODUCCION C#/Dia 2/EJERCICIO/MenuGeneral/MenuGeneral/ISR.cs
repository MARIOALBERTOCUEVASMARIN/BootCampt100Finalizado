using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MenuGeneral
{
    internal class ISR
    {
        private static decimal[,] _TablaISR;

        public static void CargarTabla(string ruta)
        {
            var lines = File.ReadAllLines(ruta);
            _TablaISR = new decimal[lines.Length, 6]; //lee todas las líneas del archivo y las almacena en un arreglo de cadenas 

            for (int i = 0; i < lines.Length; i++)
            {
                var parts = lines[i].Split(','); //dividimos cada línea en partes utilizando
                for (int j = 0; j < parts.Length; j++)
                {
                    _TablaISR[i, j] = Convert.ToDecimal(parts[j]);
                }
            }
        }

        public static decimal Calcular(decimal sueldoMensual)
        {
            decimal sueldoQuincenal = sueldoMensual / 2;

            for (int i = 0; i < _TablaISR.GetLength(0); i++)
            {
                decimal limiteInferior = _TablaISR[i, 1];
                decimal limiteSuperior = _TablaISR[i, 2];

                if (sueldoQuincenal >= limiteInferior && sueldoQuincenal <= limiteSuperior)
                {
                    decimal excedente = sueldoQuincenal - limiteInferior;
                    decimal porcentaje = _TablaISR[i, 4] / 100;
                    decimal cuotaFija = _TablaISR[i, 3];
                    decimal subsidio = _TablaISR[i, 5];

                    return (excedente * porcentaje) + cuotaFija - subsidio;
                }
            }

            return 0; // Si no se encuentra ninguna coincidencia en la tabla, el ISR es cero.
        }

        public static void Presentacion()
        {
            Console.WriteLine("Proporciona la ruta de la tabla");
            string ruta = Console.ReadLine();

            CargarTabla(ruta);

            Console.WriteLine("Proporcione su salario mensual");
            decimal salarioMensual = Convert.ToDecimal(Console.ReadLine());

            decimal isr = Calcular(salarioMensual);
            Console.WriteLine($"ISR a pagar: {isr.ToString("C")}");
        }
    }
}

