using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace System.ComponentModel.DataAnnotations
{
    [AttributeUsage(AttributeTargets.Property | AttributeTargets.Field | AttributeTargets.Parameter, AllowMultiple = false)]
    internal class RangeDateAtrtibute : ValidationAttribute
    {
        public RangeDateAtrtibute(string fMinimum, string fMaximum)
        {
            this.fMinimum=DateTime.Parse(fMinimum);
            this.fMaximum=DateTime.Parse(fMaximum);
        }

        public DateTime fMinimum { get; set; }
        public DateTime fMaximum { get; set; }

        public override string FormatErrorMessage(string name)
        {
            return string.Format(ErrorMessage,name,fMinimum.ToString("dd-MM-yyyy"), fMaximum.ToString("dd-MM-yyyy"));
        }

        public override bool IsValid(object value)
        {
            DateTime fecha = (DateTime)value;
            return fecha >= fMinimum && fecha <= fMaximum? true:false;
           
        }
    }
}
