using MenuGeneral;
using System;

class Program
{
    static void Main(string[] args)
     
    {
        
        char opcion;
        
        do
        {
            
            Console.WriteLine("                        1.- HolaMundo");
            Console.WriteLine("                        2.- ConversionTipoOracion");
            Console.WriteLine("                        3.- Opción 3");
            Console.WriteLine("                        4.- Adquiere tu Poliza");
            Console.WriteLine("                        5.- Leer archivos TXT o SCV");
            Console.WriteLine("                        6.- Escribir en Archivos");
            Console.WriteLine("                        7.- Cuanto ISR debo pagar?");
            Console.WriteLine("                        8.- Opción 8");
            Console.WriteLine("                        F.- Termina");
            Console.ReadKey     ();
            Console.Write("                     Seleccione una opción: ");

            opcion = Console.ReadKey().KeyChar;
            Console.WriteLine();
            switch (opcion)
            {
                case '1':
                    Console.WriteLine("                  Usted seleccionó la opción 1");
                    Arreglos.Cadenas(); 
                    break;
                case '2':
                    Console.WriteLine("                  Usted seleccionó la opción 2");
                    Arreglos.Enteros(); 
                    break;
                case '3':
                    Console.WriteLine("                  Usted seleccionó la opción 3");
                    Console.Write("             Ingrese una cadena: ");
                    string input = Console.ReadLine();
                    string resultado = Arreglos.ConvierteATipoOracion(input); 
                    Console.WriteLine($"                  Resultado: {resultado}");
                    break;
                case '4':
                    Console.WriteLine("                  Usted seleccionó la opción 4");
                    Poliza.Presentacion();
                    break;
                case '5':
                    Console.WriteLine("                  Usted seleccionó la opción 5");
                    Archivotxt.Presentacion();
                    break;
                case '6':
                    Console.WriteLine("                  Ingresa la ruta del archivo");
                    string ruta = Console.ReadLine();
                    Console.WriteLine("                  ¿El archivo ya existe o se va a crear? \n 1.- Existe \n 2.- Se va a crear");
                    byte est = Convert.ToByte(Console.ReadLine());
                    bool estatus;
                    if (est == 1)
                    {
                        estatus = true;
                        Archivotxt.EscribirTxt(ruta, estatus);
                    }
                    else
                    {
                        estatus = false;
                        Console.WriteLine("                  Elige el tipo de codificación \n 1.- UTF7 \n 2.- UTF8 \n 3.- Unicode \n 4.- UTF32 \n 5.- ASCII");
                        byte codificacion = Convert.ToByte(Console.ReadLine());
                        Archivotxt.EscribirTxt(ruta, estatus, codificacion);
                    }
                    break;
                case '7':
                    Console.WriteLine("                  Usted seleccionó la opción 5");
                    ISR.Presentacion();
                    break;

                case 'F':
                case 'f':
                    Console.WriteLine("                                            Terminando la aplicación.");
                    break;
                default:
                    Console.WriteLine("                            Opción no válida. Por favor, seleccione una opción válida.");
                    break;
            }

        } while (opcion != 'F' && opcion != 'f');
    }
}
