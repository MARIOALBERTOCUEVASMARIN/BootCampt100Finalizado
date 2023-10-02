﻿using System;
using System.Collections.Generic;

namespace MiPrimerNetCore.Data.Models
{
    public partial class Estado
    {
        public Estado()
        {
            Alumnos = new HashSet<Alumno>();
        }

        public int Id { get; set; }
        public string? Nombre { get; set; }
        public string? CurpPrefixClave { get; set; }

        public virtual ICollection<Alumno> Alumnos { get; set; }
    }
}
