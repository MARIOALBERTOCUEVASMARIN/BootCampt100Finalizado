using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Datos
{
    public class DEstatusAlumno
    {

        string _cnnString = ConfigurationManager.ConnectionStrings["InstitutoConnection"].ConnectionString;
        string _query;
        SqlCommand _comando;
        List<EstatusAlumno> _lstEstatus = new List<EstatusAlumno>();
        EstatusAlumno es = new EstatusAlumno();

        public List<EstatusAlumno> Consultar()
        {
            _query = "[dbo].[consultarEAlumnos]";
            using (SqlConnection conn = new SqlConnection(_cnnString))
            {
                _comando = new SqlCommand(_query, conn);
                _comando.CommandType = CommandType.StoredProcedure;
                _comando.Parameters.AddWithValue("id", - 1);
                conn.Open();
                SqlDataReader reader = _comando.ExecuteReader();
                while (reader.Read())
                {
                    _lstEstatus.Add(
                        new EstatusAlumno()
                        {
                            id = Convert.ToInt32(reader["id"]),
                            nombre = reader["nombre"].ToString(),
                           // clave = reader["clave"].ToString()
                        }
                        );
                }
            }
            return _lstEstatus;
        }

        public EstatusAlumno Consultar(int id)
        {
            _query = "[dbo].[consultarEAlumnos]";
            using (SqlConnection con = new SqlConnection(_cnnString))
            {
                _comando = new SqlCommand(_query, con);
                _comando.CommandType = CommandType.StoredProcedure;
                _comando.Parameters.AddWithValue("id", -1);
                con.Open();
                SqlDataReader reader = _comando.ExecuteReader();
                reader.Read();
                es = new EstatusAlumno()
                {
                    id = Convert.ToInt32(reader["id"]),
                    nombre = reader["nombre"].ToString(),
                    clave = reader["clave"].ToString()
                };
            }
            return es;
        }

    }
}
