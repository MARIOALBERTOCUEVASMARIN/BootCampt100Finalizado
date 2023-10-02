using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AjaxINTRO
{
    public partial class LLamadasAjaxINTRO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblID.Text = "01";
            lblNombre.Text = "Jorge";
            lblEdad.Text = "40";
            lblEstado.Text = "CDMX";
        }
        //Agregar los using
        //using System.Web.UI;
        //using System.Web.UI.WebControls;
        //El método debe ser estático
        //Cambiar en el RouteConfig.cs el siguiente parámetro al valor indicado
        //settings.AutoRedirectMode = RedirectMode.Off;
        [WebMethod]
        public static string PaseID(int id)
        {
            string mensaje;

            try
            {

                mensaje = "Exito";
            }
            catch (Exception ex)
            {
                mensaje = $"Error al Recibir Parametros alumno  id : {id} : {ex.Message}";
            }
            string respuesta;

            respuesta = JsonConvert.SerializeObject(
            new
            {
                Mensaje = mensaje
            }

           );

            return respuesta;
        }
        [WebMethod]
        public static string PaseParametros(int id, string nombre, int edad, string estado)
        {
            string mensaje;

            try
            {

                mensaje = "Exito";
            }
            catch (Exception ex)
            {
                mensaje = $"Error al Recibir Parametros alumno  id : {id} : {ex.Message}";
            }
            string respuesta;

            respuesta = JsonConvert.SerializeObject(
            new
            {
                Mensaje = mensaje
            }

           );

            return respuesta;
        }

        [WebMethod]
        public static string PaseObjeto(Alumno alumno)
        {
            string mensaje;

            try
            {
                mensaje = "Exito";
            }
            catch (Exception ex)
            {
                mensaje = $"Error al Recibir Objeto alumno id : {alumno.id} : {ex.Message}";
            }
            string respuesta;

            respuesta = JsonConvert.SerializeObject(
            new
            {
                Mensaje = mensaje
            }

           );

            return respuesta;
        }
        [WebMethod]
        public static string PaseString(string alumno)
        {
            string mensaje;
            Alumno oAlumno = new Alumno();
            try
            {
                oAlumno = JsonConvert.DeserializeObject<Alumno>(alumno);

                mensaje = "Exito";
            }
            catch (Exception ex)
            {
                mensaje = $"Error al Recibir Objeto alumno id : {oAlumno.id} : {ex.Message}";
            }
            string respuesta;

            respuesta = JsonConvert.SerializeObject(
            new
            {
                Mensaje = mensaje
            }

           );

            return respuesta;
        }

        [WebMethod]
        public static Alumno RegresaObjeto(int id)
        {
            string mensaje;
            Alumno alumno = new Alumno();
            try
            {
                alumno = new Alumno { id = id, nombre = "Xavier", edad = 25, estado = "Puebla" };
            }
            catch (Exception ex)
            {
                mensaje = $"Error al Recibir Parametros alumno  id : {id} : {ex.Message}";
            }

            return alumno;
        }
    }
}