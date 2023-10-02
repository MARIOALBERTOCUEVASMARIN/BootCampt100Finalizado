namespace HolaMundoWF
{
    partial class Estados
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lestados = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.dgvEstados = new System.Windows.Forms.DataGridView();
            this.button1 = new System.Windows.Forms.Button();
            this.CBEstados = new System.Windows.Forms.ComboBox();
            this.lblid = new System.Windows.Forms.Label();
            this.lblNombre = new System.Windows.Forms.Label();
            this.lblClave = new System.Windows.Forms.Label();
            this.txtid = new System.Windows.Forms.TextBox();
            this.txtclave = new System.Windows.Forms.TextBox();
            this.txtnombre = new System.Windows.Forms.TextBox();
            this.cbDetalles = new System.Windows.Forms.CheckBox();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEstados)).BeginInit();
            this.SuspendLayout();
            // 
            // lestados
            // 
            this.lestados.AutoSize = true;
            this.lestados.Location = new System.Drawing.Point(75, 31);
            this.lestados.Name = "lestados";
            this.lestados.Size = new System.Drawing.Size(45, 13);
            this.lestados.TabIndex = 0;
            this.lestados.Text = "Estados";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.txtnombre);
            this.panel1.Controls.Add(this.txtclave);
            this.panel1.Controls.Add(this.txtid);
            this.panel1.Controls.Add(this.lblClave);
            this.panel1.Controls.Add(this.lblNombre);
            this.panel1.Controls.Add(this.lblid);
            this.panel1.Location = new System.Drawing.Point(97, 262);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(240, 143);
            this.panel1.TabIndex = 1;
            // 
            // dgvEstados
            // 
            this.dgvEstados.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvEstados.Location = new System.Drawing.Point(97, 71);
            this.dgvEstados.Name = "dgvEstados";
            this.dgvEstados.Size = new System.Drawing.Size(240, 150);
            this.dgvEstados.TabIndex = 2;
            this.dgvEstados.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(165, 227);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 3;
            this.button1.Text = "Consultar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // CBEstados
            // 
            this.CBEstados.FormattingEnabled = true;
            this.CBEstados.Location = new System.Drawing.Point(126, 31);
            this.CBEstados.Name = "CBEstados";
            this.CBEstados.Size = new System.Drawing.Size(121, 21);
            this.CBEstados.TabIndex = 4;
            // 
            // lblid
            // 
            this.lblid.AutoSize = true;
            this.lblid.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblid.Location = new System.Drawing.Point(14, 14);
            this.lblid.Name = "lblid";
            this.lblid.Size = new System.Drawing.Size(23, 15);
            this.lblid.TabIndex = 0;
            this.lblid.Text = "ID:";
            // 
            // lblNombre
            // 
            this.lblNombre.AutoSize = true;
            this.lblNombre.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblNombre.Location = new System.Drawing.Point(14, 92);
            this.lblNombre.Name = "lblNombre";
            this.lblNombre.Size = new System.Drawing.Size(49, 15);
            this.lblNombre.TabIndex = 1;
            this.lblNombre.Text = "Nombre:";
            // 
            // lblClave
            // 
            this.lblClave.AutoSize = true;
            this.lblClave.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblClave.Location = new System.Drawing.Point(14, 53);
            this.lblClave.Name = "lblClave";
            this.lblClave.Size = new System.Drawing.Size(39, 15);
            this.lblClave.TabIndex = 2;
            this.lblClave.Text = "Clave:";
            // 
            // txtid
            // 
            this.txtid.Location = new System.Drawing.Point(97, 14);
            this.txtid.Name = "txtid";
            this.txtid.Size = new System.Drawing.Size(100, 20);
            this.txtid.TabIndex = 5;
            // 
            // txtclave
            // 
            this.txtclave.Location = new System.Drawing.Point(97, 50);
            this.txtclave.Name = "txtclave";
            this.txtclave.Size = new System.Drawing.Size(100, 20);
            this.txtclave.TabIndex = 6;
            // 
            // txtnombre
            // 
            this.txtnombre.Location = new System.Drawing.Point(97, 87);
            this.txtnombre.Name = "txtnombre";
            this.txtnombre.Size = new System.Drawing.Size(100, 20);
            this.txtnombre.TabIndex = 7;
            // 
            // cbDetalles
            // 
            this.cbDetalles.AutoSize = true;
            this.cbDetalles.Location = new System.Drawing.Point(257, 33);
            this.cbDetalles.Name = "cbDetalles";
            this.cbDetalles.Size = new System.Drawing.Size(64, 17);
            this.cbDetalles.TabIndex = 5;
            this.cbDetalles.Text = "Detalles";
            this.cbDetalles.UseVisualStyleBackColor = true;
            this.cbDetalles.CheckedChanged += new System.EventHandler(this.cbDetalles_CheckedChanged);
            // 
            // Estados
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.cbDetalles);
            this.Controls.Add(this.CBEstados);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.dgvEstados);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.lestados);
            this.Name = "Estados";
            this.Text = "Estados";
            this.Load += new System.EventHandler(this.Estados_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEstados)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lestados;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.DataGridView dgvEstados;
        private System.Windows.Forms.Label lblClave;
        private System.Windows.Forms.Label lblNombre;
        private System.Windows.Forms.Label lblid;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.ComboBox CBEstados;
        private System.Windows.Forms.TextBox txtnombre;
        private System.Windows.Forms.TextBox txtclave;
        private System.Windows.Forms.TextBox txtid;
        private System.Windows.Forms.CheckBox cbDetalles;
    }
}