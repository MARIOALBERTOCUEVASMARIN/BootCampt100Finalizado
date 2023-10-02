using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OperacionesAritmeticas
{
    internal struct Resultado
    {
        public Resultado(decimal suma, decimal resta, decimal division, decimal multiplicacion, decimal modulo)
        {
            this.suma = suma;
            this.resta = resta;
            this.division = division;
            this.multiplicacion = multiplicacion;
            this.modulo = modulo;
        }

        public decimal suma { get; set; }
        public decimal resta { get; set; }
        public decimal multiplicacion { get; set; }
        public decimal division { get; set; }
        public decimal modulo { get; set; }
        
    }
}
