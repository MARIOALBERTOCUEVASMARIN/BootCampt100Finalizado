using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntroduccionCS
{
    public class Formatos
    {
        public static void FormatosImpresion()
        {
            decimal importe = 178923.45m;
            decimal porcentaje = 0.20m;
            Console.WriteLine(importe.ToString("C2"));
            Console.WriteLine(porcentaje.ToString("P"));
            Console.WriteLine("0121234567890123456781234567890");
            Console.WriteLine("   Importe           Porcentaje");
            //  {0,-18:C2} 0 = indice de parametros; -18 = En 18 posiciones se alineara a la derecha; 10 En 10 Posiciones 
            Console.WriteLine("   {0,-18:C2}{1,10:P}", importe, porcentaje);
            Console.WriteLine($" Importe:  {importe} Porcentaje: {porcentaje}");
            Console.WriteLine($"   {importe,18:C2}{porcentaje,-10:P}");
            Console.WriteLine("Importe: " + importe.ToString("C2") + " Porcentaje: " + porcentaje.ToString("P"));

        }
    }
}
