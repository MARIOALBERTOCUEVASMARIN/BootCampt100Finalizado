using System.Collections.Generic;

namespace ADOWinForms.ADO
{
    internal interface ICRUD1
    {
        void Actualizar(ADOEstatusAlumno estatus);
        int Agregar(ADOEstatusAlumno estatus);
        List<ADOEstatusAlumno> Consultar();
        ADOEstatusAlumno Consultar(int id);
        void Eliminar(int id);
    }
}