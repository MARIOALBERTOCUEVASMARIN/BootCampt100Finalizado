using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace Entidades
{
    [MetadataType(typeof(AlumnosDataAnnotations))]
    public partial class Alumnos
    {

    }
    internal class AlumnosDataAnnotations
    {
        [DisplayName("Nombre")]
        [RegularExpression("^[A-Za-znÑ\\s]+$", ErrorMessage = "El campo {0} solo puede contener letras y espacios.")]
        [Required(ErrorMessage = "El campo {0} es obligatorio.")]
        public string nombre { get; set; }


        [DisplayName("Primer Apellido")]
        [RegularExpression("^[A-Za-znÑ\\s]+$", ErrorMessage = "El campo {0} solo puede contener letras y espacios.")]
        [Required(ErrorMessage = "El  campo {0} es obligatorio.")]
        public string primerApellido { get; set; }


        [DisplayName("Segundo Apellido")]
        [RegularExpression("^[A-Za-znÑ\\s]+$", ErrorMessage = "El campo {0} solo puede contener letras y espacios.")]
        public string segundoApellido { get; set; }


        [DisplayName("Correo")]
        [EmailAddress(ErrorMessage = "Formato incorrecto, el formato es example@example")]
        [Required(ErrorMessage = "El campo {0} es obligatorio.")]
        public string correo { get; set; }


        [DisplayName("Telefono")]
        [RegularExpression("[0-9]+$", ErrorMessage = "El campo {0} solo acepta numeros y en 10 digitos.")]
        public string telefono { get; set; }


        [RangeDateAtrtibute ("01/01/1990", "31/12/2000", ErrorMessage = "El {0} debe de estar entre {1} y {2}")]
        public DateTime fechaNacimiento { get; set; }


        [DisplayName("CURP")]
        [Required(ErrorMessage = "El campo {0} es obligatorio.")]
        [RegularExpression("^([A-Z][AEIOUX][A-Z]{2}\\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\\d])(\\d)+$", ErrorMessage = "Los valores proporcionados en el campo {0} no tienen el formato correcto.")]
        public string curp { get; set; }



        [DisplayName("Sueldo")]
        [Range(10000, 40000, ErrorMessage = "El {0} debe ser entre ${1} y ${2} pesos.")]
        public Nullable<decimal> sueldo { get; set; }

    }
}














  