using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Conexiones
{
    internal class ADOEstatus : ICRUDEEstatus
    {
        //Cadena de conexión
        string String = ConfigurationManager.ConnectionStrings["InstitutoConnection"].ConnectionString;
        string query;
        SqlCommand comando;
        List<Estatus> lstEstatus;

        //1. Consultar Todos
        public List<Estatus> Consultar()
        {
        lstEstatus = new List<Estatus>();
        query = "SELECT * FROM EstatusAlumnos";
        using (SqlConnection con = new SqlConnection(String))
          {
           comando = new SqlCommand(query, con);
           comando.CommandType = CommandType.Text;
           con.Open();
                SqlDataReader reader = comando.ExecuteReader();
                while (reader.Read())
                {
                  lstEstatus.Add(
                  new Estatus()
                  {
                    id = Convert.ToInt32(reader["id"]),
                    clave = reader["clave"].ToString(),
                    nombre = reader["nombre"].ToString(),
                  }
                  );
                }
                con.Close();
            }

            return lstEstatus;
        }

        // Consultar solo UNO 
        public Estatus Consultar(int id)
        {
            query = $"SELECT * FROM EstatusAlumnos WHERE id = {id}";
            using (SqlConnection conn = new SqlConnection(String))
            {
                comando = new SqlCommand(query, conn);
                comando.CommandType = CommandType.Text;
                conn.Open();
                SqlDataReader reader = comando.ExecuteReader();
                reader.Read();
                Estatus busqueda = new Estatus();
                busqueda.id = Convert.ToInt32(reader["id"]);
                busqueda.clave = reader["clave"].ToString();
                busqueda.nombre = reader["nombre"].ToString();

                return busqueda;
            }
        }

        
        public int Agregar(Estatus estatus)
        {
            int id = 1;
            //Agregar un registro a la tabla EstatusAlumnos
            query = "AgregarEstatusAlumnos";
            using (SqlConnection con = new SqlConnection(String))
            {
                comando = new SqlCommand(query, con);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("Clave", estatus.clave);
                comando.Parameters.AddWithValue("Nombre", estatus.nombre);
                con.Open();
                estatus.id = (Int32)comando.ExecuteScalar();
                con.Close();
            }

            return id;

        }


        //4.- Actualizar
        public void Actualizar(Estatus estatus)
        {
            query = $"UPDATE EstatusAlumnos SET clave = '{estatus.clave}' WHERE id = {estatus.id};" +
                    $"UPDATE EstatusAlumnos SET nombre = '{estatus.nombre}' WHERE id = {estatus.id}";
            using (SqlConnection con = new SqlConnection(String))
            {
                comando = new SqlCommand(query, con);
                comando.CommandType = CommandType.Text;
                con.Open();
                //ExecuteNonQuery() = Ejecuta el query que se le pasa pero no retorna ningun valor
                comando.ExecuteNonQuery();
                con.Close();
            }
        }

        //5.- Eliminar
        public void Eliminar(int id)
        {
            query = $"DELETE EstatusAlumnos WHERE id = {id}";
            using (SqlConnection con = new SqlConnection(String))
            {
                comando = new SqlCommand(query, con);
                comando.CommandType = CommandType.Text;
                con.Open();
                //ExecuteNonQuery() = Ejecuta el query que se le pasa pero no retorna ningun valor
                comando.ExecuteNonQuery();
                con.Close();
            }
        }

    }
}

