using ADOWinForms.ADO;
using ADOWinForms.Entidades;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ADOWinForms
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        ADOEstatusAlumno ado = new ADOEstatusAlumno();

        private void Form1_Load(object sender, EventArgs e)
        {
            comboBox1.DataSource = ado.Consultar();
            comboBox1.DisplayMember = "nombre";
            comboBox1.ValueMember = "id";
            dataGridView1.DataSource = ado.Consultar();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            panel1.Visible = true;
            button1.Enabled = false;
            button2.Enabled = false;
            button3.Enabled = false;
            button4.Text = "Grabar";
        }



        private void btnCancelar_Click(object sender, EventArgs e)
        {
            label1.Text = string.Empty;
            label2.Text = string.Empty;
            panel1.Visible = false;
            button1.Enabled = true;
            button2.Enabled = true;
            button3.Enabled = true;
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            int id = (int)comboBox1.SelectedValue;
            panel1.Visible = true;
            button1.Enabled = false;
            button2.Enabled = false;
            button3.Enabled = false;
            button4.Text = "Guardar";
            label1.Text = ado.Consultar(id).nombre;
            label2.Text = ado.Consultar(id).clave;
        }

        private void button3_Click_1(object sender, EventArgs e)
        {
            int id = (int)comboBox1.SelectedValue;
            panel1.Visible = true;
            button1.Enabled = false;
            button2.Enabled = false;
            button3.Enabled = false;
            button4.Text = "Eliminar";
            label1.Text = ado.Consultar(id).nombre;
            label2.Text = ado.Consultar(id).clave;
            label1.Enabled = false;
            label2.Enabled = false;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int id = (int)comboBox1.SelectedValue;
            if (button4.Text == "Grabar")
            {
                EstatusAlumno eAgregar = new EstatusAlumno();
                eAgregar.clave = label2.Text;
                eAgregar.nombre = label1.Text;
                ado.Agregar(eAgregar);
            }
            else if (button4.Text == "Guardar")
            {
                EstatusAlumno estatusU = new EstatusAlumno();
                estatusU.id = id;
                estatusU.nombre = label1.Text;
                estatusU.clave = label2.Text;
                ado.Actualizar(estatusU);
            }
            else if (button4.Text == "Eliminar")
            {
                ado.Eliminar(id);
            }

            comboBox1.DataSource = ado.Consultar();
            comboBox1.DisplayMember = "nombre";
            comboBox1.ValueMember = "id";
            dataGridView1.DataSource = ado.Consultar();
            panel1.Visible = false;
            button1.Enabled = true;
            button2.Enabled = true;
            button3.Enabled = true;
        }
    }
}
