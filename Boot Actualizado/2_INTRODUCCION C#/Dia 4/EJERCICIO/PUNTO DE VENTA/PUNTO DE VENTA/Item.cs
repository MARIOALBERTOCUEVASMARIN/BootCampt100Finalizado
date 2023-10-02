using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PuntoVenta
{
    public class Item : ItemBase
    {
        public Item(Articulo art, int cantidad) : base(art, cantidad)
        {
        }
        public override string Imprimir()
        {
            return $"{_id} {_nombre} Precio: {_precio}\nCantidad: {_cantidad}\nSubtotal: {SubTotal().ToString("C")}\n" +
                $"Total: {Total().ToString("C")}\n";
        }
    }
}
