using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion.Alumnos
{
    public partial class Details : System.Web.UI.Page
    {
        NAlumno nAlumno = new NAlumno();
        NEstado nEstado = new NEstado();
        NEstatusAlumno nStatus = new NEstatusAlumno();
        Alumno objAlumno = new Alumno();
        protected void Page_Load(object sender, EventArgs e)
        {
            int idConsulta = Convert.ToInt32(Request.QueryString["id"]);
            objAlumno = nAlumno.Consultar(idConsulta);


            lblidR.Text = idConsulta.ToString();
            lblNombreR.Text = objAlumno.nombre;
            lblPAR.Text = objAlumno.primerApellido;
            lblSAR.Text = objAlumno.segundoaPellido;
            lblFechaN.Text = objAlumno.fechaNacimiento.ToString("yyyy-MM-dd");
            lblCURPR.Text = objAlumno.curp;
            lblCorreoR.Text = objAlumno.correo;
            lblTelR.Text = objAlumno.telefono;
            lblSMR.Text = objAlumno.sueldo.ToString();

            lblEstadoR.Text = nEstado.Consultar(objAlumno.idEstadoOrigen).nombre;

            lblEstatusR.Text = nStatus.Consultar(objAlumno.idEstatus).nombre;
        }

        protected void btnISR_Click(object sender, EventArgs e)
        {
            ItemTablaISR objisr = new ItemTablaISR();

            objisr = nAlumno.CalcularISR(Convert.ToInt16(lblidR.Text));
            string script = @"<script type = 'text/javascript'>
                                $(function (){
                                    $('#MiModalISR').modal('show')
                                 })</script>";
            ScriptManager.RegisterStartupScript(this, GetType(), "MuestraModal", script, false);

            lbllS.Text = objisr.LimiteSuperior.ToString();
            lblLI.Text = objisr.LimiteInferior.ToString();
            lblCF.Text = objisr.CuotaFija.ToString();
            lblE.Text = objisr.Excedente.ToString();
            lblS.Text = objisr.Subsidio.ToString();
            lblISR.Text = objisr.ISR.ToString();





            //se comento para poder usar el modal 
            /* int id = Convert.ToInt16(Request.QueryString["id"]);
             objisr = nAlumno.CalcularISR(id);
             lblCalcularISR.Text = $"LimiteInferior{objisr.LimiteInferior} " +
                                   $"LimieteSuprior{objisr.LimiteSuperior} " +
                                   $"CuotaFija{objisr.CuotaFija} " +
                                   $"Excedente{objisr.Excedente} " +
                                   $"Subsidio{objisr.Subsidio} " +
                                   $"ISR{objisr.ISR}";
            */
        }

        protected void btnIMSS_Click(object sender, EventArgs e)
        {
            AportacionesIMSS objimss = new AportacionesIMSS();
            int id = Convert.ToInt16(Request.QueryString["id"]);
            objimss = nAlumno.CalcularIMSS(id);
            lblCalcularIMSS.Text = $"Enfermedad Maternidad {objimss.EnfermedadMaternidad} " +
                           $"Invalidez Vida {objimss.InvalidezVida}" +
                           $"Retiro {objimss.Retiro}" +
                           $"Cesantia {objimss.Cesantia}" +
                           $"Infonavit {objimss.Infonavit}";
        }
    }
}