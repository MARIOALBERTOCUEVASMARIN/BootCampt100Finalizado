using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Negocio;
using Entidades;

namespace HolaMundoASMX
{
    /// <summary>
    /// Descripción breve de swAlumnos
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class swAlumnos : System.Web.Services.WebService
    {
        NAlumno objNalumno = new NAlumno();

        [WebMethod]
        public AportacionesIMSS calcularIMSS(int id)
        {
            return objNalumno.CalcularIMSS(id);
        }

        [WebMethod]
        public ItemTablaISR itemTablaISR(int id) 
        {
           ItemTablaISR iSR =objNalumno.CalcularISR(id);
            return iSR;
        }



    }
}
