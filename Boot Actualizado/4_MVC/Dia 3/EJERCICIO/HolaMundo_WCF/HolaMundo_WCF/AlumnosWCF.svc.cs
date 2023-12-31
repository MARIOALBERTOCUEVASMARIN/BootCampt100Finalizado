﻿using Negocio;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace HolaMundo_WCF
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "AlumnosWCF" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione AlumnosWCF.svc o AlumnosWCF.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class AlumnosWCF : IAlumnosWCF
    {
        NAlumno _oAlumnos = new NAlumno();

        public AportacionesIMSS CalcularIMSS(int id)
        {
            Entidades.AportacionesIMSS imss = _oAlumnos.CalcularIMSS(id);
            string json = JsonConvert.SerializeObject(imss);
            AportacionesIMSS aportacion = JsonConvert.DeserializeObject<AportacionesIMSS>(json);
            return aportacion;
        }

        public ItemTablaISR ItemTablaISR(int id)
        {
            Entidades.ItemTablaISR isr = _oAlumnos.CalcularISR(id);
            string json = JsonConvert.SerializeObject(isr);
            ItemTablaISR item = JsonConvert.DeserializeObject<ItemTablaISR>(json);
            return item;
        }
    }
}
