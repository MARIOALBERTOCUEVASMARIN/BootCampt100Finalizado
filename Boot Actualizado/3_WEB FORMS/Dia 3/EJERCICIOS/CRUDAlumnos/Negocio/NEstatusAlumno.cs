using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NEstatusAlumno
    {
        DEstatusAlumno est = new DEstatusAlumno();

        public List<EstatusAlumno> Consultar()
        {
            return est.Consultar();
        }

        public EstatusAlumno Consultar(int id)
        {
            return est.Consultar(id);
        }
    }
}
