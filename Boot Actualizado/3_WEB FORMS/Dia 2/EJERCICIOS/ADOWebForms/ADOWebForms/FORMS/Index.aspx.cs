using ADOWebForms.ADO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;

namespace ADOWebForms.FORMS
{
    public partial class Index : System.Web.UI.Page
    {
        ADOEstatusAlumno ado = new ADOEstatusAlumno();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlEstatus.DataSource = ado.Consultar();
                ddlEstatus.DataTextField = "nombre";
                ddlEstatus.DataValueField = "id";
                ddlEstatus.DataBind();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Create.aspx");
        }

        protected void btnDetalles_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlEstatus.SelectedValue);
            Response.Redirect($"Details.aspx?id={id}");
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlEstatus.SelectedValue);
            Response.Redirect($"Edit.aspx?id={id}");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlEstatus.SelectedValue);
            Response.Redirect($"Delete.aspx?id={id}");
        }
    }
}