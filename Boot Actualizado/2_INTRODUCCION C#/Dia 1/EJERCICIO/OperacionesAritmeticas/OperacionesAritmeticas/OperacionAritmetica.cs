using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OperacionesAritmeticas
{
    internal struct OperacionAritmetica
    {
        public OperacionAritmetica(decimal operA, decimal operB, TipoOperacion tipoOperacion)
        {
            this.operA = operA;
            this.operB = operB;
            this.tipoOperacion = tipoOperacion;
        }

        public decimal operA { get; set; }
        public decimal operB { get; set; }

        public TipoOperacion tipoOperacion { get; set; }    
    }
}
