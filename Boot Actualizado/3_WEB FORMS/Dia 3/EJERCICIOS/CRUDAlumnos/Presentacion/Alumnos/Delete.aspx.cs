﻿using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion.Alumnos
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int idConsulta = Convert.ToInt32(Request.QueryString["id"]);

            NAlumno nAlumno = new NAlumno();
            NEstado nEstado = new NEstado();
            NEstatusAlumno nStatus = new NEstatusAlumno();
            Alumno objAlumno = new Alumno();

            objAlumno = nAlumno.Consultar(idConsulta);
            lblidR.Text = idConsulta.ToString();
            lblNombreR.Text = objAlumno.nombre;
            lblPAR.Text = objAlumno.primerApellido;
            lblSAR.Text = objAlumno.segundoaPellido;
            lblFechaN.Text = objAlumno.fechaNacimiento.ToString("yyyy-MM-dd");
            lblCorreoR.Text = objAlumno.correo;
            lblCURPR.Text = objAlumno.curp;
            lblTelR.Text = objAlumno.telefono;
            lblSMR.Text = objAlumno.sueldo.ToString();
            lblEstadoR.Text = nEstado.Consultar(objAlumno.idEstadoOrigen).nombre;
            lblEstatusR.Text = nStatus.Consultar(objAlumno.idEstatus).nombre;

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int idConsulta = Convert.ToInt32(Request.QueryString["id"]);
            NAlumno nAlumno = new NAlumno();
            nAlumno.Eliminar(idConsulta);
            Response.Redirect("Index.aspx");
        }
    }
}