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
    internal interface ICRUDEEstatus
    {
        List<Estatus> Consultar();
        Estatus Consultar(int id);
        int Agregar(Estatus estatus);
        void Actualizar(Estatus estatus);
        void Eliminar(int id);
    }
}
