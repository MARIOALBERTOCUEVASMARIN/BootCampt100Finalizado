using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.NetworkInformation;
using ADOWebForms.Entidades;

namespace ADOWebForms.ADO
{
    internal interface ICRUD
    {
        List<EstatusAlumno> Consultar();
        EstatusAlumno Consultar(int id);
        int Agregar(EstatusAlumno estatus);
        void Actualizar(EstatusAlumno estatus);
        void Eliminar(int id);

    }
}
