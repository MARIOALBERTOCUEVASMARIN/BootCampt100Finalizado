using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace PuntoVenta
{
    public class Operaciones
    {
        public static List<Articulo> _lstArticulos = new List<Articulo>();
        public static List<string> _lstCarrito = new List<string>();
        internal static void CargarArticulos()
        {
            string strRuta = File.ReadAllText(@"C:\Users\Tichs\Desktop\BootCampt\c#\dia 4\Articulos.json");
            _lstArticulos = JsonConvert.DeserializeObject<List<Articulo>>(strRuta);
        }

        internal static void Presentacion()
        {
            CargarArticulos();
            decimal totalPagar = 0;
            string respuesta = "V";
            while (respuesta != "T" && respuesta != "t")
            {
                Console.Clear();
                Console.WriteLine("***************************************************");
                Console.WriteLine("*                 Empresa Patito                  *");
                Console.WriteLine("***************************************************");
                Console.WriteLine("\n ");

                Console.WriteLine("Iniciar una nueva venta (V)\n");
                Console.WriteLine("Terminar (T)");
                respuesta = Console.ReadLine();
                if (respuesta == "V" || respuesta == "v")
                {
                    Console.Write("\n \nRegistre el ID del articulo: ");
                    int id = Convert.ToInt32(Console.ReadLine());
                    Console.Write("Cuantos articulos quiere llevar?: ");
                    int cantidad = Convert.ToInt32(Console.ReadLine());
                    Articulo artBusqueda = _lstArticulos.Find(x => x.id == id);
                    switch (artBusqueda.tipo)
                    {
                        case 1:
                            Item item = new Item(artBusqueda, cantidad);
                            _lstCarrito.Add(item.Imprimir());
                            totalPagar = totalPagar + item.Total();
                            Console.WriteLine(item.Imprimir());
                            break;
                        case 2:
                            Console.WriteLine("Porcentaje de descuento:");
                            int descuento = Convert.ToInt32(Console.ReadLine());
                            ItemDescuento itemDesc = new ItemDescuento(artBusqueda, cantidad);
                            itemDesc._descuento = descuento;
                            _lstCarrito.Add(itemDesc.Imprimir());
                            totalPagar = totalPagar + itemDesc.Total();
                            Console.WriteLine(itemDesc.Imprimir());
                            break;
                        case 3:
                            Console.Write("Cual es numero de telefono: ");
                            string telefono = Console.ReadLine();
                            Console.Write("Cual es la compañia: ");
                            string compania = Console.ReadLine();
                            Console.Write("Cuanto va a dejar de comision: ");
                            decimal comision = Convert.ToDecimal(Console.ReadLine());
                            ItemTA itemta = new ItemTA(artBusqueda, cantidad);
                            itemta._Telefono = telefono;
                            itemta._Compania = compania;
                            itemta._Comision = comision;
                            _lstCarrito.Add(itemta.Imprimir());
                            totalPagar = totalPagar + itemta.Total();
                            Console.WriteLine(itemta.Imprimir());
                            break;
                    }

                    Console.WriteLine("(TV) PARA MOSTRAR TICKET");
                    Console.WriteLine("PRESIONE (ENTER) PARA AGREGAR OTRO ARTICULO");
                    string respuesta2 = Console.ReadLine();
                    if (respuesta2 == "TV" || respuesta2 == "tv")
                    {
                        Console.Clear();
                        Console.WriteLine("***************************************************");
                        Console.WriteLine("*                     TICKET                      *");
                        Console.WriteLine("***************************************************");
                        Console.Write("                   Empresa Patito\n\n");
                         

                        foreach (var imp in _lstCarrito)
                        {
                            Console.WriteLine(imp);
                        }
                        Console.WriteLine($"\nTotal a pagar: {totalPagar.ToString("C")}");
                        Console.ReadKey();
                    }
                }
            }
        }
    }
}

