using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using Entidades;

namespace Datos
{
    public class DAlumno
    {
        string _cnnString = ConfigurationManager.ConnectionStrings["InstitutoConnection"].ConnectionString;
        string _query;
        SqlCommand _comando;
        List<Alumno> _lstEstatus = new List<Alumno>();
        List<ItemTablaISR> _lstTablISR = new List<ItemTablaISR>();

        Alumno a = new Alumno();

        public List<Alumno> Consultar()
        {
            _query = "consultarAlumnos1";
            using (SqlConnection conn = new SqlConnection(_cnnString))
            {
                _comando = new SqlCommand(_query, conn);
                _comando.CommandType = CommandType.StoredProcedure;
                _comando.Parameters.AddWithValue("IDA", -1);
                conn.Open();
                SqlDataReader reader = _comando.ExecuteReader();
                while (reader.Read())
                {
                    _lstEstatus.Add(new Alumno()
                    {
                        id = Convert.ToInt32(reader["id"]),
                        nombre = reader["nombre"].ToString(),
                        primerApellido = reader["primerApellido"].ToString(),
                        segundoaPellido = reader["segundoaPellido"].ToString(),
                        correo = reader["correo"].ToString(),
                        telefono = reader["telefono"].ToString(),
                        fechaNacimiento = Convert.ToDateTime(reader["fechaNacimiento"]),
                        curp = reader["curp"].ToString(),
                        sueldo = reader["sueldo"] == DBNull.Value ? 0 : Convert.ToDecimal(reader["sueldo"]),
                        idEstadoOrigen = Convert.ToInt32(reader["idEstadoOrigen"]),
                        idEstatus = Convert.ToInt32(reader["idEstatus"])
                    }
                    );
                }
                conn.Close();
            }
            return _lstEstatus;
        }

        public Alumno Consutar(int id)
        {
            _query = "consultarAlumnos1";
            using (SqlConnection conn = new SqlConnection(_cnnString))
            {
                _comando = new SqlCommand(_query, conn);
                _comando.CommandType = CommandType.StoredProcedure;
                _comando.Parameters.AddWithValue("IDA", id);
                conn.Open();
                SqlDataReader reader = _comando.ExecuteReader();
                reader.Read();
                a = new Alumno()
                {
                    id = Convert.ToInt32(reader["id"]),
                    nombre = reader["nombre"].ToString(),
                    primerApellido = reader["primerApellido"].ToString(),
                    segundoaPellido = reader["segundoaPellido"].ToString(),
                    correo = reader["correo"].ToString(),
                    telefono = reader["telefono"].ToString(),
                    fechaNacimiento = Convert.ToDateTime(reader["fechaNacimiento"]),
                    curp = reader["curp"].ToString(),
                    sueldo = reader["sueldo"] == DBNull.Value ? 0 : Convert.ToDecimal(reader["sueldo"]),
                    idEstadoOrigen = Convert.ToInt32(reader["idEstadoOrigen"]),
                    idEstatus = Convert.ToInt32(reader["idEstatus"])
                };
                conn.Close();
            }
            return a;
        }

        public void Agregar(Alumno alumno)
        {
            try
            {
                _query = "[dbo].[AgregarAlumno1]";
                using (SqlConnection con = new SqlConnection(_cnnString))
                {
                    _comando = new SqlCommand(_query, con);
                    _comando.CommandType = CommandType.StoredProcedure;

                    _comando.Parameters.AddWithValue("Nombre", alumno.nombre);
                    _comando.Parameters.AddWithValue("ApellidoPaterno", alumno.primerApellido);
                    _comando.Parameters.AddWithValue("ApellidoMaterno", alumno.segundoaPellido);
                    _comando.Parameters.AddWithValue("Correo", alumno.correo);
                    _comando.Parameters.AddWithValue("Telefono", alumno.telefono);
                    _comando.Parameters.AddWithValue("FechaNacimiento", alumno.fechaNacimiento);
                    _comando.Parameters.AddWithValue("curp", alumno.curp);
                    _comando.Parameters.AddWithValue("sueldo", alumno.sueldo);
                    _comando.Parameters.AddWithValue("idEstado", alumno.idEstadoOrigen);
                    _comando.Parameters.AddWithValue("idEstatus", alumno.idEstatus);

                    con.Open();
                    //alumno.id = (Int32)comando.ExecuteScalar(); //cuando se utiliza identity y scope para regresar el id
                    alumno.id = _comando.ExecuteNonQuery();
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al agregar un estatus", ex);
            }

        }

        public void Actualizar(Alumno a)
        {
            _query = "[dbo].[ActualizarAlumnos1]";
            using (SqlConnection conn = new SqlConnection(_cnnString))
            {
                _comando = new SqlCommand(_query, conn);
                _comando.CommandType = CommandType.StoredProcedure;
                _comando.Parameters.AddWithValue("ID", a.id);
                _comando.Parameters.AddWithValue("Nombre", a.nombre);
                _comando.Parameters.AddWithValue("PrimerApellido", a.primerApellido);
                _comando.Parameters.AddWithValue("SegundoApellido", a.segundoaPellido);
                _comando.Parameters.AddWithValue("Correo", a.correo);
                _comando.Parameters.AddWithValue("Telefono", a.telefono);
                _comando.Parameters.AddWithValue("FechaNacimiento", a.fechaNacimiento);
                _comando.Parameters.AddWithValue("CURP", a.curp);
                _comando.Parameters.AddWithValue("Sueldo", a.sueldo);
                _comando.Parameters.AddWithValue("IdEstadoOrigen", a.idEstadoOrigen);
                _comando.Parameters.AddWithValue("IdEstatus", a.idEstatus);
                conn.Open();
                _comando.ExecuteNonQuery();
                conn.Close();
            }
        }

        public void Eliminar(int id)
        {
            _query = "eliminarAlumno";
            using (SqlConnection conn = new SqlConnection(_cnnString))
            {
                _comando = new SqlCommand(_query, conn);
                _comando.CommandType = CommandType.StoredProcedure;
                _comando.Parameters.AddWithValue("id", id);
                conn.Open();
                _comando.ExecuteNonQuery();
                conn.Close();
            }
        }

        public List<ItemTablaISR> ConsultarTablaISR()
        {
            _query = "[dbo].[_spISR]";
            using (SqlConnection con = new SqlConnection(_cnnString))
            {
                _comando = new SqlCommand(_query, con);
                _comando.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader reader = _comando.ExecuteReader();
                while (reader.Read())
                {
                    _lstTablISR.Add(
                        new ItemTablaISR()
                        {
                            LimiteInferior = Convert.ToDecimal(reader["LimInf"]),
                            LimiteSuperior = Convert.ToDecimal(reader["LimSup"]),
                            CuotaFija = Convert.ToDecimal(reader["CuotaFija"]),
                            Excedente = Convert.ToDecimal(reader["ExedLimInf"]),
                            Subsidio = Convert.ToDecimal(reader["Subsidio"])
                        });
                }
                con.Close();
            }
            return _lstTablISR;
        }
    }

}
