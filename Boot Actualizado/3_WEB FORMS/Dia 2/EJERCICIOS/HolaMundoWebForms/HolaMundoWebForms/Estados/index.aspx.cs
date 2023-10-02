using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HolaMundoWebForms.Estados
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            List<Estado> listEstados = new List<Estado>
            {
                new Estado { id= 1 , clave="DF", nombre="CDMX"},
                new Estado { id= 2 ,clave="MC", nombre="Mexico"},
                new Estado { id= 3 ,clave="MN", nombre="Michoacan"},
                new Estado { id= 4 ,clave="MS", nombre="Morelos"},
                new Estado { id= 5 ,clave="PL", nombre="Puebla"}
            };

            if (!IsPostBack)
            {
                ddlEstados.DataSource = listEstados;
                ddlEstados.DataTextField = "nombre";
                ddlEstados.DataValueField = "id";
                ddlEstados.DataBind();
            }
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlEstados.SelectedValue);
            Response.Redirect($"Details.aspx?id={id}");
        }
    }
}