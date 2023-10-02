using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HolaMundoWF
{
    public partial class Estados : Form
    {
        public Estados()
        {
            InitializeComponent();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Estados_Load(object sender, EventArgs e)
        {
            List<Estado> listEstado = new List<Estado>
            {
                new Estado {id = 1, clave = "DF", nombre="CDMX" },
                new Estado {id= 2, clave = "MC", nombre = "Mexico"},
                new Estado {id=3, clave = "MN", nombre = "Michoacan"},
                new Estado {id=4,clave= "MS", nombre="Morelos"},
                new Estado {id=5,clave = "PL", nombre="Puebla"}
            };
            
            dgvEstados.DataSource = listEstado;
            
            CBEstados.DataSource= listEstado;
            CBEstados.DisplayMember = "nombre";
            CBEstados.ValueMember = "id";
           

        }

        private void button1_Click(object sender, EventArgs e)
        {
            //int id= (int)CBEstados.SelectedValue;
            Estado estado = (Estado)CBEstados.SelectedItem;

            txtid.Text = estado.id.ToString();
            txtclave.Text = estado.clave.ToString();
            txtnombre.Text = estado.nombre.ToString();
        }

        private void cbDetalles_CheckedChanged(object sender, EventArgs e)
        {
            panel1.Visible = cbDetalles.Checked ? true:false ;
        }
    }
}
