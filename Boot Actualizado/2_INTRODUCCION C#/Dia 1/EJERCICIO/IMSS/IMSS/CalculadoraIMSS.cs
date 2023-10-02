using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMSS
{
    public class CalculadoraIMSS
    {
        public static Aportaciones Calcular(decimal salarioBaseCotizacion, decimal uma, bool esPatron)
        {
            Aportaciones aportaciones = new Aportaciones();

            decimal limiteEnfermedadMaternidad = salarioBaseCotizacion - (3 * uma);
            decimal limiteInvalidezVida = salarioBaseCotizacion;

            aportaciones.EnfermedadMaternidad = esPatron ? 0.011m * limiteEnfermedadMaternidad : 0.004m * limiteEnfermedadMaternidad;
            aportaciones.InvalidezVida = esPatron ? 0.0175m * limiteInvalidezVida : 0.00625m * limiteInvalidezVida;
            aportaciones.Retiro = esPatron ? 0.02m * salarioBaseCotizacion : 0;
            aportaciones.Cesantia = esPatron ? 0.0315m * salarioBaseCotizacion : 0.01125m * salarioBaseCotizacion;
            aportaciones.Infonavit = esPatron ? 0.05m * salarioBaseCotizacion :0 ;

            return aportaciones;
        }

        public static void Presentacion()
        {
            Console.WriteLine("Calculadora IMSS");
            Console.Write("Ingrese el Salario Base de Cotización: ");
            decimal salarioBase = decimal.Parse(Console.ReadLine());

            Console.Write("Ingrese la Unidad de Medida de Actualización (UMA): ");
            decimal uma = decimal.Parse(Console.ReadLine());

            Console.Write("¿Es el cálculo para el Patrón o para el Trabajador? (P/T): ");
            string tipo = Console.ReadLine().ToUpper();

            bool esPatron = tipo == "P";

            Aportaciones aportaciones = CalculadoraIMSS.Calcular(salarioBase, uma, esPatron);

            Console.WriteLine("Resultados de Aportaciones:");
            Console.ReadKey();

            Console.WriteLine($"Enfermedad y Maternidad: {aportaciones.EnfermedadMaternidad:C}");
            Console.WriteLine($"Invalidez y Vida: {aportaciones.InvalidezVida:C}");
            Console.WriteLine($"Retiro: {aportaciones.Retiro:C}");
            Console.WriteLine($"Cesantía: {aportaciones.Cesantia:C}");
            Console.WriteLine($"Crédito Infonavit: {aportaciones.Infonavit:C}");

            decimal totalAportaciones = aportaciones.EnfermedadMaternidad + 
                                        aportaciones.InvalidezVida + 
                                        aportaciones.Retiro + 
                                        aportaciones.Cesantia + 
                                        aportaciones.Infonavit;

            Console.WriteLine($"Total de Aportaciones: {totalAportaciones:C}");
        }

    }
}
