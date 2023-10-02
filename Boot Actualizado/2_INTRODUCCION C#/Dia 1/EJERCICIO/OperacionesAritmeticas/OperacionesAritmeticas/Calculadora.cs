using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OperacionesAritmeticas
{
    internal class Calculadora
    {
        public static decimal Suma(decimal OperA, decimal OperB)
        {
            return OperA + OperB;
        }
        public static decimal Resta(decimal OperA, decimal OperB)
        {
            return OperA - OperB;
        }
                public static decimal multiplicacion (decimal OperA, decimal OperB)
        {
            return OperA * OperB;
        }
                public static decimal division (decimal OperA, decimal OperB)
        {
            return OperA / OperB;
        }
                public static decimal modulo (decimal OperA, decimal OperB)
        {
            return OperA % OperB;
        }

        public decimal Operacion(OperacionAritmetica operacionAritmetica)
        {
            decimal resultado = 0;

            if (operacionAritmetica.tipoOperacion == TipoOperacion.suma)
                resultado = Suma(operacionAritmetica.operA, operacionAritmetica.operB);
            else if (operacionAritmetica.tipoOperacion == TipoOperacion.resta)
                resultado = Resta(operacionAritmetica.operA, operacionAritmetica.operB);
            else if (operacionAritmetica.tipoOperacion == TipoOperacion.multiplicacion)
                resultado = multiplicacion(operacionAritmetica.operA, operacionAritmetica.operB);
            else if (operacionAritmetica.tipoOperacion == TipoOperacion.division)
                resultado = division(operacionAritmetica.operA, operacionAritmetica.operB);
            else if (operacionAritmetica.tipoOperacion == TipoOperacion.modulo)
            resultado = modulo(operacionAritmetica.operA, operacionAritmetica.operB);

            return resultado;
        }

        public Resultado Simultaneas(decimal num1,decimal num2)
        {
            Resultado objResultado = new Resultado();
            objResultado.suma=Suma(num1, num2);
            objResultado.resta=Resta(num1, num2);
            objResultado.multiplicacion=multiplicacion(num1, num2);
            objResultado.division=division(num1, num2);
            objResultado.modulo=modulo(num1, num2);
            return objResultado;   
        }
        public static void Presentacion()
        {
            decimal result = 0;
            OperacionAritmetica objOperacionAritmetica = new OperacionAritmetica();
            Console.WriteLine("Elije una Opción");
            Console.WriteLine("1.- Sumar\r\n2.- Restar\r\n3.- Multiplicar\r\n4.- Dividir\r\n5.- Módulo\r\n6- Todas");
            int opcion = Convert.ToInt16(Console.ReadLine());
            objOperacionAritmetica.tipoOperacion = (TipoOperacion)opcion;
            Console.WriteLine("Ingrese el primer Operando");
            objOperacionAritmetica.operA= Convert.ToDecimal(Console.ReadLine());
            Console.WriteLine("Ingrese el segundo Operando");
            objOperacionAritmetica.operB = Convert.ToDecimal(Console.ReadLine());

            Calculadora objCalculadora = new Calculadora();

           

            if (opcion>0 && opcion<6 )
            {
                result = objCalculadora.Operacion(objOperacionAritmetica);
                Console.WriteLine(result);
            }
            else if (opcion == 6)
            {
                Resultado objResultado = new Resultado();
                objResultado=objCalculadora.Simultaneas(objOperacionAritmetica.operA,objOperacionAritmetica.operB);
                Console.WriteLine($"suma={objResultado.suma}\nresta={objResultado.resta}\nmultiplicacion={objResultado.multiplicacion}\ndivision={objResultado.division}\nmodulo={objResultado.modulo}");
            }

            

        }
    }
}
