using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using MVCDataAnnotations.Models;
using System.ComponentModel;

namespace MVCDataAnnotations.Models
{
    public class DataAnotaciones
    {
        //============================================================
        [Key]
        public int NoId { get; set; }

        //============================================================
        [Required(ErrorMessage ="El {0} es obligatorio")]
        public string Nombre { get; set; }

        //============================================================
        [StringLength(60, MinimumLength = 3,ErrorMessage = "El {0} debe tener mínimo {2} y máximo {1} caracteres")]
        public string PrimerApellido { get; set; }

        //============================================================
        [MaxLength(20, ErrorMessage = "Longitud máxima de {1}")]
        public string SegundoApellido { get; set; }

        //============================================================
        [DataType(DataType.Date, ErrorMessage = "Teclea una fecha")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public System.DateTime fechaNacimiento { get; set; }

        //============================================================
        [DataType(DataType.Currency, ErrorMessage = "No es una moneda")]
        public decimal? SueldoMensual { get; set; }

        //============================================================
        //[DataType(DataType.EmailAddress, ErrorMessage = "{0} formato incorrecto")]
        [EmailAddress(ErrorMessage ="{0} formato incorrecto")]
        public string correo { get; set; }

        //============================================================
        //[DataType(DataType.CreditCard, ErrorMessage = "formato incorrecto")]
        [CreditCard(ErrorMessage = "{0} Formato Incorrecto")]
        public string tarjetaCredito { get; set; }

        //============================================================
        //[DataType(DataType.PhoneNumber, ErrorMessage = "formato incorrecto")]
        [Phone(ErrorMessage ="{0} Formato incorrecto")]
        public string telefono { get; set; }


        //============================================================
        [Display(Name = "Domicilio Actual")]
        public string domact { get; set; }

        //============================================================
        [DisplayName("Colonia")]
        public string col { get; set; }

        //============================================================
        [RegularExpression("^[A-Z]{1}[AEIOU]{1}[A-Z]{2}$", ErrorMessage = "El {0} no tiene el formato")]   
        public string curp { get; set; }

        //============================================================
        [Range(1,32, ErrorMessage ="El valor debe estar entre el {1} y el {2}")]
        public int idEstado { get; set; }
    }
}