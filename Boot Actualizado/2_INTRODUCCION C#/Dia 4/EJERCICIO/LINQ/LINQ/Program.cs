﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LINQ
{
    internal class Program
    {
        static void Main(string[] args)
        {
            OperacionesLINQ ObjoperacionesLINQ = new OperacionesLINQ();
            ObjoperacionesLINQ.CargarLists();

            ObjoperacionesLINQ.Consultas();
        }
    }
}
