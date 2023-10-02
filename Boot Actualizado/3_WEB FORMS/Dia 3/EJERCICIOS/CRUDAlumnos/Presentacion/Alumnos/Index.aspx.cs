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
    public partial class Index : System.Web.UI.Page
    {
        NAlumno CapaNAlumno = new NAlumno();

        public void Page_Load(object sender, EventArgs e)
        {
                if (!IsPostBack)
                {
                    CargarGridView();
                }
        }
        protected void gvAlumnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Page")
            {
                return;
            }
            int NumRenglon = Convert.ToInt16(e.CommandArgument);
            GridViewRow Renglon = gvAlumnos.Rows[NumRenglon];
            TableCell Celda = Renglon.Cells[0];

            int id = Convert.ToInt16(Celda.Text);

            switch (e.CommandName)
            {
                case "btnDetalles":
                    Response.Redirect($"Details.aspx?id={id}");
                    break;

                case "btnEditar":
                    Response.Redirect($"Edit.aspx?id={id}");

                    break;
                case "btnEliminar":
                    Response.Redirect($"Delete.aspx?id={id}");

                    break;
            }
        }
        protected void gvAlumnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAlumnos.PageIndex = e.NewPageIndex;
            CargarGridView();
        }
        private void CargarGridView()
        {
            List<Alumno> listAlumnos = new List<Alumno>();
            listAlumnos = CapaNAlumno.Consultar();

            gvAlumnos.DataSource = listAlumnos;
            gvAlumnos.DataBind();
        }

        protected void gvAlumnos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}