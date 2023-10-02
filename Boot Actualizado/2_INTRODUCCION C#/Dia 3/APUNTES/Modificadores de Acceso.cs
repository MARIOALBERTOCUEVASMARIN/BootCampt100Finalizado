using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntroduccionCS
{
    public class Empleado
    {
        private string _nombre;
        private DateTime _fechaNacimiento;
         /// <summary>
        /// Propiedad de lectura y escritura
        /// </summary>
        public string nombre
        {
            //La clase invocadora solicita el valor de la propiedad.
            get
            {
                return _nombre;
            }
            //La clase externa coloca un valor a la propiedad.
            set
            {
                _nombre = value;
            }
        }
        /// <summary>
        /// Propiedad de lectura y escritura
        /// </summary>
        public DateTime fechaNacimiento
        {
            get
            {
                return _fechaNacimiento;
            }
            set
            {
                _fechaNacimiento = value;
            }
        }
        /// <summary>
        /// Propiedad de lectura y escritura
        /// </summary>
        public string apellidos { get; set; }
        /// <summary>
        /// Propiedad de lectura y escritura
        /// </summary>
        public int idEstado { get; set; }
        /// <summary>
        /// Propiedad de lectura y escritura
        /// </summary>
        public decimal sueldoMensual { get; set; }
        /// <summary>
        /// Propiedad de sólo lectura
        /// </summary>
        /// 
        public int edad
        {
            get
            {
                DateTime hoy = DateTime.Now;
                int edad = hoy.Year - _fechaNacimiento.Year;
                return edad;
            }
          
        }
        // int edad = ceclia.edad;
        // cecilia.edad = 24;
        /// <summary>
        /// Método constructor
        /// El método constructor se llama igual que la clase y no regresa dato
        /// Constructor que no requiere argumentos.
        /// </summary>
        public Empleado()
        {
        }
        /// <summary>
        /// Es el metodo contructor
        /// </summary>
        /// <param name="nombre"> El nombre </param>
        /// <param name="apellidos"></param>
        /// <param name="fechaNacimiento"></param>
        public Empleado(string nombre, string apellidos, DateTime fechaNacimiento)
        {
            _nombre = nombre;
            this.apellidos = apellidos;
            _fechaNacimiento = fechaNacimiento;
        }
        // Empleado jorge = new Empleado();
        // Empleado jorge = new Empleado("Jorge","Valdivia Rosas","1958-01-26");
        public Empleado(string nombre, string apellidos)
        {
            _nombre = nombre;
            this.apellidos = apellidos;
        }
        //Modificadores de acceso
        //---------------------
        //public : se puede acceder al tipo o miembro mediante cualquier
        //otro código en el mismo ensamblado u otro ensamblado que haga referencia a él.
        public  decimal Aguinaldo(DateTime fechaContratacion)      
        {
            decimal aguinaldo;
            aguinaldo = sueldoMensual / 24 * (diasLaborados(fechaContratacion)/365);
            return aguinaldo;
        }
        //privado : Solo se puede acceder al tipo
        //o miembro mediante el código en el mismo class o struct.
        private int diasLaborados(DateTime fechaContratacion)
        {
            
            DateTime hoy = DateTime.Now;
            DateTime fechaInicio = fechaContratacion.Year < hoy.Year ? new DateTime(hoy.Year, 01, 01) : fechaContratacion;
            DateTime fechaFinal = new DateTime(hoy.Year, 12, 31);
            TimeSpan fechaDiff = fechaFinal.Subtract(fechaInicio);
            return fechaDiff.Days;
        }
        //protected : Se puede acceder al tipo o miembro solo por código en el misma class,
        //o en un clase derivada de esa clase.
        protected decimal AguinaldoProtegido(DateTime fechaContratacion)
        {
            decimal aguinaldo;
            aguinaldo = sueldoMensual / 24 * (diasLaborados(fechaContratacion) / 365);
            return aguinaldo;
        }
        //internal : se puede acceder al tipo o miembro mediante cualquier código
        //en el mismo ensamblado, pero no desde otro ensamblado.
        internal decimal AguinaldoInterno(DateTime fechaContratacion)
        {
            decimal aguinaldo;
            aguinaldo = sueldoMensual / 24 * (diasLaborados(fechaContratacion) / 365);
            return aguinaldo;
        }
        //protected internal : se puede acceder al tipo o miembro mediante cualquier código
        //en el ensamblado en el que está declarado, o desde dentro de un clase derivada
        // en otro ensamblado.
        protected internal decimal AguinaldoProtegidoInterno(DateTime fechaContratacion)
        {
            decimal aguinaldo;
            aguinaldo = sueldoMensual / 24 * (diasLaborados(fechaContratacion) / 365);
            return aguinaldo;
        }
        //privado protegido : Se puede acceder al tipo o miembro solo dentro de su ensamblado
        //declarante, por código en el misma clase o en un tipo derivado de ese class.
        private protected decimal AguinaldoPrivadoProtegido(DateTime fechaContratacion)
        {
            decimal aguinaldo;
            aguinaldo = sueldoMensual / 24 * (diasLaborados(fechaContratacion) / 365);
            return aguinaldo;
        }

       //Con el modificador static se declara un miembro estático, que pertenece al propio tipo(clase) en lugar de a un objeto específico.
       //Un método estático puede llamarse sin tener que crear un objeto de dicha clase.
        public static int diasLaboradosEstaticos(DateTime fechaContratacion)
        {
            // Resta una fecha
            DateTime hoy = DateTime.Now;
            DateTime fechaInicio = fechaContratacion.Year < hoy.Year ? new DateTime(hoy.Year, 01, 01) : fechaContratacion;
            DateTime fechaFinal = new DateTime(hoy.Year, 12, 31);
            TimeSpan fechaDiff = fechaFinal.Subtract(fechaInicio);
            return fechaDiff.Days;
        }

    }
}
