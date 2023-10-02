using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCDataAnnotations.Models
{
    [MetadataType(typeof(InstructorDataAnnotations))]
    public partial class Instructor
    {
    }

      public class InstructorDataAnnotations
    {
        [Required(ErrorMessage = "El {0} es obligatorio")]
        public int id { get; set; }
        [Required(ErrorMessage = "El {0} es obligatorio")]
        [StringLength(60, MinimumLength = 3, ErrorMessage = "El {0} debe tener mínmo {2} y máximo {1} caracteres")]
        [DataType(DataType.Text)]       
        public string nombre { get; set; }
        [MaxLength(60, ErrorMessage = "La longitud max del {0} es {1}")]
        [MinLength(3, ErrorMessage = "La longitud min del {0} es {1}")]
        [Display(Name = "Apellido Paterno")]
        public string primerApellido { get; set; }
        [DisplayName("Apellido Materno")]
        public string segundoApellido { get; set; }
        [DataType(DataType.EmailAddress, ErrorMessage = "formato incorrecto")]
        public string correo { get; set; }
        public string telefono { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public System.DateTime fechaNacimiento { get; set; }
        [RegularExpression("^[A-Z]{1}[AEIOU]{1}[A-Z]{2}$", ErrorMessage = "El {0} no tiene el formato")]
        public string curp { get; set; }
        [CreditCard(ErrorMessage = "formato incorrecto")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dddd-dddd-dddd-dddd}")]

        public string tarjetaCredito { get; set; }
        [Range(1, 50, ErrorMessage = "El valor debe estar entre el {1} y el {2}")]

        public int? idPuesto { get; set; }
      

    }
}