﻿using Entidades;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DEstado
    {
        string _cnnString = ConfigurationManager.ConnectionStrings["InstitutoConnection"].ConnectionString;
        string _query;
        SqlCommand _comando;
        List<Estado> _lstEstado = new List<Estado>();
        Estado es = new Estado();

        //Consultar todos
        public List<Estado> Consultar()
        {
            _query = "[dbo].[consultarEstados]";
            
            using (SqlConnection con = new SqlConnection(_cnnString))
            {
                _comando = new SqlCommand(_query, con);
                _comando.CommandType = CommandType.StoredProcedure;
                _comando.Parameters.AddWithValue("id", -1);
                con.Open();
                SqlDataReader reader = _comando.ExecuteReader();
                while (reader.Read())
                {
                    _lstEstado.Add(
                        new Estado()
                        {
                            id = Convert.ToInt32(reader["id"]),
                            nombre = reader["nombre"].ToString(),
                          //  curp = reader["curp"].ToString()
                        });
                }
                con.Close();
            }
            return _lstEstado;
        }

        //Consultar 1
        public Estado Consultar(int id)
        {
            _query = "[dbo].[consultarEstados]";
            using (SqlConnection conn = new SqlConnection(_cnnString))
            {
                _comando = new SqlCommand(_query, conn);
                _comando.CommandType = CommandType.StoredProcedure;
                _comando.Parameters.AddWithValue("id", id);
                conn.Open();
                SqlDataReader r = _comando.ExecuteReader();
                r.Read();
                es = new Estado()
                {
                    id = Convert.ToInt32(r["id"]),
                    nombre = r["nombre"].ToString(),
                   // curp = r["curp"].ToString()
                };
                conn.Close();
            }
            return es;
        }
    }
}
