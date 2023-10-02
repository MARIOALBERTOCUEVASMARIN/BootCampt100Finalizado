using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MenuGeneral
{
    internal class Poliza
    {
        public static PolizaResultado Calcular(DateTime fechaInicio, string periodo, int cantidadPeriodos, decimal sumaAsegurada, DateTime fechaNacimiento, string genero)
        {
            PolizaResultado poliza = new PolizaResultado();
            decimal[,] factor =

            /*    Edad Género Factor
               0 - 20 Femenino 0.05
              21 - 30 Femenino 0.1
              31 - 40 Femenino 0.4
              41 - 50 Femenino 0.5
              51 - 60 Femenino 0.65
              61 - adelante Femenino 0.85
               0 - 20 Masculino 0.05
              21 - 30 Masculino 0.1
              31 - 40 Masculino 0.4
              41 - 50 Masculino 0.55
              51 - 60 Masculino 0.7
              61 - adelante Masculino 0.9*/
            {
            { 0, 20, 0, 0.05m },
            { 21, 30, 0, 0.1m },
            { 31, 40, 0, 0.4m },
            { 41, 50, 0, 0.5m },
            { 51, 60, 0, 0.65m },
            { 61, 100, 0, 0.85m },        
            { 0, 20, 1, 0.05m },
            { 21, 30, 1, 0.1m },
            { 31, 40, 1, 0.4m },
            { 41, 50, 1, 0.55m },
            { 51, 60, 1, 0.7m },
            { 61, 100, 1, 0.9m }
        };

            int gen = (genero.ToLower() == "masculino") ? 1 : 0;
            int edad = fechaInicio.Year - fechaNacimiento.Year;

            decimal factorReal = 0;

            for (int i = 0; i < factor.GetLength(0); i++)
            {
                if ((edad >= factor[i, 0] && edad <= factor[i, 1]) && (factor[i, 2] == gen))
                {
                    factorReal = factor[i, 3];
                    break; // Salir del bucle una vez encontrado el factor
                }
            }

            decimal dias = 0;

            if (periodo == "años" || periodo == "año")
            {
                dias = cantidadPeriodos * 365; // Suponiendo 1 año = 365 días
            }
            else if (periodo == "meses" || periodo == "mes")
            {
                dias = cantidadPeriodos * 30; // Suponiendo 1 mes = 30 días
            }
            else if (periodo == "dias" || periodo == "dia")
            {
                dias = cantidadPeriodos;
            }

            poliza.prima = (sumaAsegurada * factorReal) * (dias / 360m);
            poliza.fechaTermino = fechaInicio.AddDays((int)dias);
            return poliza;
        }

        public static void Presentacion()
        {
            Console.WriteLine("Proporciona la fecha de inicio de Vigencia en formato '1800-01-01'");
            DateTime fechaInicio = Convert.ToDateTime(Console.ReadLine());

            Console.WriteLine("Proporciona por cuánto tiempo quiere la póliza pueden ser años, meses, dias ejemplo : 7 dias");
            string tiempoPoliza = Console.ReadLine();
            string[] arregloTiempoPoliza = tiempoPoliza.Split(' ');
            int cantidadPeriodo = Convert.ToInt32(arregloTiempoPoliza[0]);
            string periodo = arregloTiempoPoliza[1];

            Console.WriteLine("Proporciona la suma asegurada");
            decimal sumaAsegurada = Convert.ToDecimal(Console.ReadLine());

            Console.WriteLine("Proporciona la fecha de nacimiento en formato 'yyyy-MM-dd'");
            DateTime fechaNacimiento = Convert.ToDateTime(Console.ReadLine());

            Console.WriteLine("Proporciona tu género (Masculino o Femenino)");
            string genero = Console.ReadLine();

            PolizaResultado polizaResultado = Calcular(fechaInicio, periodo, cantidadPeriodo, sumaAsegurada, fechaNacimiento, genero);
            Console.WriteLine($"La Póliza vencerá el {polizaResultado.fechaTermino.ToString("D")} \n" +
                              $"La prima a pagar es de {Math.Round(polizaResultado.prima).ToString("C")} pesos");
        }
    }
}