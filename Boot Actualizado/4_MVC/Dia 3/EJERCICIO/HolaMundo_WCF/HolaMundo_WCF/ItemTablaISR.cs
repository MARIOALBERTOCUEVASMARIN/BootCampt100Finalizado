using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace HolaMundo_WCF
{
    [DataContract]
    public class ItemTablaISR
    {
        [DataMember]
        public decimal LimInferior { get; set; }

        [DataMember]
        public decimal LimSuperior { get; set; }

        [DataMember]
        public decimal CuotaFija { get; set; }

        [DataMember]
        public decimal Excedente { get; set; }
        [DataMember]
        public decimal Subsidio { get; set; }

        [DataMember]
        public decimal Impuesto { get; set; }



    }
}