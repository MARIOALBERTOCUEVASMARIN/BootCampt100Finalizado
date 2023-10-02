﻿using System;
using System.Collections.Generic;

namespace WebApi2.Models.Entities
{
    public partial class Estados
    {
        public Estados()
        {
            Alumnos = new HashSet<Alumnos>();
        }

        public int Id { get; set; }
        public string? Nombre { get; set; }
        public string? CurpPrefixClave { get; set; }

        public virtual ICollection<Alumnos> Alumnos { get; set; }
    }
}
