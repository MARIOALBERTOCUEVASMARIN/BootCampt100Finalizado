using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CrudEstadoss
{
    internal class Program
    {
        static void Main(string[] args)
        {
            CRUD_Estados objCRUD_Estados = new CRUD_Estados();
            Dictionary<int, Estado> listEstados = new Dictionary<int, Estado>();
            do
            {
                Console.WriteLine("1. Consultar Todos\r\n2. Consultar Solo uno\r\n3. Agregar\r\n4. Actualizar\r\n5. Eliminar\r\n6. Terminar");
                Console.WriteLine("Selecciona una Opción");
                string opcion=Console.ReadLine();
                switch (opcion)
                {
                    case "1":
                        listEstados= objCRUD_Estados.ConsultarTodos();

                        foreach (KeyValuePair<int,Estado> kvp in listEstados)
                        {
                            Console.WriteLine($"key:{kvp.Key} Value: {kvp.Value.nombre}");
                        }
                        break;
                    case "2":
                        Console.WriteLine("Ingresa el id del elemento a Consultar");
                        int id= int.Parse(Console.ReadLine());
                        Estado estado = objCRUD_Estados.ConsultarSoloUno(id);

                        Console.WriteLine($"key:{estado.id} Value: {estado.nombre}");
                        break;
                    case "3":
                        Estado estadoAct = new Estado();
                        Console.WriteLine("Ingresa el id del estado");
                        estadoAct.id = int.Parse(Console.ReadLine());
                        Console.WriteLine("Ingresa el nombre del estado");
                        estadoAct.nombre= Console.ReadLine();
                         objCRUD_Estados.Agregar(estadoAct);
                        break;
                        case "4":
                        estadoAct = new Estado();
                        Console.WriteLine("Ingresa el id del estado a Actualizar");
                        estadoAct.id = int.Parse(Console.ReadLine());
                        Console.WriteLine("Ingresa el nombre Actualizado");
                        estadoAct.nombre = Console.ReadLine();
                        objCRUD_Estados.Actualizar(estadoAct);
                        break;
                        case "5":
                        Console.WriteLine("Ingresa el id del elemento a eliminar");
                         id = int.Parse(Console.ReadLine());
                        objCRUD_Estados.Eliminar(id);

                        
                        break; 


                }
            } while (true);
           
        }
    }
}
