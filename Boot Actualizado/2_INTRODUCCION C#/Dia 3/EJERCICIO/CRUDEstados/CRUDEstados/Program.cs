using System;

class Program
{
    static void Main(string[] args)
    {
        CRUD_Estado estadoManager = new CRUD_Estado();

        Console.WriteLine("Bienvenido a CRUDEstados");


        Console.WriteLine("***************************************************");
        Console.WriteLine("*            Bienvenido a CRUDEstados             *");
        Console.WriteLine("***************************************************");

        while (true)
        {
            Console.WriteLine("\nSeleccione una opción:");
            Console.WriteLine("1. Consultar Todos");
            Console.WriteLine("2. Consultar Solo uno");
            Console.WriteLine("3. Agregar");
            Console.WriteLine("4. Actualizar");
            Console.WriteLine("5. Eliminar");
            Console.WriteLine("6. Terminar");

            Console.Write("\nIngrese el número de la opción deseada: ");
            string opcion = Console.ReadLine();

            switch (opcion)
            {
                case "1":
                    Console.Clear();
                    Console.WriteLine("***************************************************");
                    Console.WriteLine("*               Consultar Todos                    *");
                    Console.WriteLine("***************************************************");
                    estadoManager.ConsultarTodos();
                    break;
                case "2":
                    Console.Clear();
                    Console.WriteLine("***************************************************");
                    Console.WriteLine("*            Consultar Solo uno                   *");
                    Console.WriteLine("***************************************************");
                    estadoManager.ConsultarUno();
                    break;
                case "3":
                    Console.Clear();
                    Console.WriteLine("***************************************************");
                    Console.WriteLine("*                 Agregar                         *");
                    Console.WriteLine("***************************************************");
                    estadoManager.Agregar();
                    break;
                case "4":
                    Console.Clear();
                    Console.WriteLine("***************************************************");
                    Console.WriteLine("*               Actualizar                         *");
                    Console.WriteLine("***************************************************");
                    estadoManager.Actualizar();
                    break;
                case "5":
                    Console.Clear();
                    Console.WriteLine("***************************************************");
                    Console.WriteLine("*                Eliminar                         *");
                    Console.WriteLine("***************************************************");
                    estadoManager.Eliminar();
                    break;
                case "6":
                    Console.WriteLine("Saliendo de la aplicación.");
                    Console.ReadKey();
                    return;
                default:
                    Console.WriteLine("Opción no válida. Por favor, seleccione una opción válida.");
                    break;
            }
        }
    }
}
