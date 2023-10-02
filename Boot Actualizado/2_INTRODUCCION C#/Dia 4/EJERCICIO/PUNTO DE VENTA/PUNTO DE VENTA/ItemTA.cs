﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PuntoVenta
{
    internal class ItemTA : ItemBase
    {
        public ItemTA(Articulo art, int cantidad) : base(art, cantidad)
        {
        }

        public string _Telefono { get; set; }
        public string _Compania { get; set; }
        public decimal _Comision { get; set; }

        public override decimal Total()
        {
            return _precio * _cantidad + _Comision;
        }

        public override string Imprimir()
        {
            return $"{_id} {_nombre} Precio: {_precio}\nCantidad: {_cantidad}\nSubtotal: {SubTotal().ToString("C")}\n" +
                $"Teléfono: {_Telefono}\nCompañia: {_Compania}\nComisión: {_Comision}\n" +
                $"Total: {Total().ToString("C")}\n";
        }
    }
}

