using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HolaMundoWebForms.Estados
{
    public partial class Details : System.Web.UI.Page
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
            int id = Convert.ToInt16(Request.QueryString["id"]);

            Estado estado=listEstados.Find(x=>x.id==id);

            lblClavedef.Text = estado.clave;
            lblIddef.Text = estado.id.ToString();
            lblNombredef.Text = estado.nombre;  
        }
    }
}