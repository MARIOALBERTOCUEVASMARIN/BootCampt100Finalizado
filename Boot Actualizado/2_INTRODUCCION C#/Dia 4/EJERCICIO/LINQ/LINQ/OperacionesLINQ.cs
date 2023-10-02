using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LINQ
{
    internal class OperacionesLINQ
    {
        public List<Alumno> _Alumnos  = new List<Alumno>();
        public List<Estado> _Estados = new List<Estado>();   
        public List<Estatus> _Estatus = new List<Estatus>();
        public List<ItemISR> _TablaISR = new List<ItemISR>();

        public void CargarLists()
        {
            // Cargar Alumnos 
            string alumnosJson = File.ReadAllText("Alumnos.json");
            _Alumnos = JsonConvert.DeserializeObject<List<Alumno>>(alumnosJson);

            // Cargar Estados 
            string estadosJson = File.ReadAllText("Estados.json");
            _Estados = JsonConvert.DeserializeObject<List<Estado>>(estadosJson);

            // Cargar Estatus 
            string estatusJson = File.ReadAllText("Estatus.json");
            _Estatus = JsonConvert.DeserializeObject<List<Estatus>>(estatusJson);


            //ISR
            string strRutaTablaISR = @"C:\Users\Tichs\Desktop\BootCampt\c#\dia 4\LINQ\LINQ\bin\Debug\TablaISR.csv";
            StreamReader sr = new StreamReader(strRutaTablaISR);
            ItemISR isr = new ItemISR();
            string strTemp = "";
            string[] arrayS;
            while (strTemp != null)
            {
                strTemp = "";
                strTemp = sr.ReadLine();
                if (strTemp != null)
                {
                    arrayS = strTemp.Split(',');
                    isr.LimInf = Convert.ToDecimal(arrayS[1]);
                    isr.LimSup = Convert.ToDecimal(arrayS[2]);
                    isr.CuotaFija = Convert.ToDecimal(arrayS[3]);
                    isr.PorExced = Convert.ToDecimal(arrayS[4]);
                    isr.Subsidio = Convert.ToDecimal(arrayS[5]);
                    _TablaISR.Add(isr);
                }
            }
        }

        public void Consultas()
        {
            // Ejercicio 7.2.1.1: Obtener el estado con Id = 5
            var estadoId5 = _Estados.FirstOrDefault(e => e.Id == 5);
            if (estadoId5 != null)
            {
                Console.WriteLine($"Estado con Id 5: {estadoId5.Nombre}");
                Console.ReadKey();
            }

            // Ejercicio 7.2.1.2: Obtener alumnos con idEstado 29 o 13, ordenados por nombre
            var alumnosId29o13 = _Alumnos.Where(a => a.IdEstado == 29 || a.IdEstado == 13)
                                         .OrderBy(a => a.Nombre);
            Console.WriteLine("Alumnos con IdEstado 29 o 13 ordenados por nombre:");
            foreach (var alumno in alumnosId29o13)
            {
                Console.WriteLine($"{alumno.Id}: {alumno.Nombre}");
                Console.ReadKey();
            }

            // Ejercicio 7.2.1.3: Obtener alumnos con IdEstado 19 o 20 y con IdEstatus 4 o 5
            var alumnosId19o20Estatus4o5 = _Alumnos.Where(a => (a.IdEstado == 19 || a.IdEstado == 20) && (a.IdEstatus == 4 || a.IdEstatus == 5));
            Console.WriteLine("Alumnos con IdEstado 19 o 20 y con IdEstatus 4 o 5:");
            foreach (var alumno in alumnosId19o20Estatus4o5)
            {
                Console.WriteLine($"{alumno.Id}: {alumno.Nombre}");
                Console.ReadKey();
            }

            // Ejercicio 7.2.1.4: Obtener alumnos con calificación aprobatoria, ordenados por calificación (mayor a menor)
            var alumnosCalificacionAprobatoria = _Alumnos.Where(a => a.Calidicacion >= 6)
                                                         .OrderByDescending(a => a.Calidicacion);
            Console.WriteLine("Alumnos con calificación aprobatoria (mayor a menor):");
            foreach (var alumno in alumnosCalificacionAprobatoria)
            {
                Console.WriteLine($"{alumno.Id}: {alumno.Nombre}, Calificación: {alumno.Calidicacion}");
                Console.ReadKey();
            }

            // Ejercicio 7.2.1.5: Calcular la calificación promedio de los alumnos
            double calificacionPromedio = _Alumnos.Average(a => a.Calidicacion);
            Console.WriteLine($"Calificación promedio de los alumnos: {calificacionPromedio}");
                 Console.ReadKey();

            // Ejercicio 7.2.1.6: Añadir puntos de calificación a los alumnos según ciertas condiciones
            foreach (var alumno in _Alumnos)
            {
                if (alumno.Calidicacion == 10)
                {
                    alumno.Calidicacion += 1;
                }
                else if (alumno.Calidicacion >= 6 && alumno.Calidicacion <= 7)
                {
                    alumno.Calidicacion += 2;
                }
            }

            // Ejercicio 7.2.1.7: Mostrar datos de alumnos en estatus 3
            var alumnosEstatus3 = _Alumnos.Where(a => a.IdEstatus == 3)
                                         .Join(_Estados, a => a.IdEstado, e => e.Id, (a, e) => new { a.Id, a.Nombre, EstadoNombre = e.Nombre });
            Console.WriteLine("Datos de alumnos en estatus 3:");
            foreach (var alumno in alumnosEstatus3)
            {
                Console.WriteLine($"Id: {alumno.Id}, Nombre: {alumno.Nombre}, Estado: {alumno.EstadoNombre}");
                Console.ReadKey();
            }

            // Ejercicio 7.2.1.8: Mostrar datos de alumnos en estatus 2, ordenados por nombre de alumno
            var alumnosEstatus2 = _Alumnos.Where(a => a.IdEstatus == 2)
                                         .Join(_Estatus, a => a.IdEstatus, es => es.Id, (a, es) => new { a.Id, a.Nombre, EstatusNombre = es.Nombre })
                                         .OrderBy(a => a.Nombre);
            Console.WriteLine("Datos de alumnos en estatus 2, ordenados por nombre de alumno:");
            foreach (var alumno in alumnosEstatus2)
            {
             
                Console.WriteLine($"Id: {alumno.Id}, Nombre: {alumno.Nombre}, Estatus: {alumno.EstatusNombre}");
                Console.ReadKey();
            }

            // Ejercicio 7.2.1.9: Mostrar datos de alumnos con estatus mayor a 2, ordenados por nombre de estatus
            var alumnosEstatusMayorA2 = _Alumnos.Where(a => a.IdEstatus > 2)
                                               .Join(_Estados, a => a.Id, e => e.Id, (a, e) => new { a.Id, a.Nombre, EstadoNombre = e.Nombre })
                                               .Join(_Estatus, a => a.Id, es => es.Id, (a, es) => new { a.Id, a.Nombre, a.EstadoNombre, EstatusNombre = es.Nombre })
                                               .OrderBy(a => a.EstatusNombre)
                                               .ThenBy(a => a.Nombre);
            Console.WriteLine("Datos de alumnos con estatus mayor a 2, ordenados por nombre de estatus:");
            foreach (var alumno in alumnosEstatusMayorA2)
            {
                Console.WriteLine($"Id: {alumno.Id}, Nombre: {alumno.Nombre}, Estado: {alumno.EstadoNombre}, Estatus: {alumno.EstatusNombre}");
                Console.ReadKey();
            }


            // Ejercicio 7.2.1.10: Calcular el impuesto para un sueldo mensual de 22,000 utilizando la tabla ISR
            decimal sueldoMensual = 25000m;
            ItemISR isr = _TablaISR.Find(item => sueldoMensual >= item.LimInf && sueldoMensual <= item.LimSup);

                decimal quincena = (sueldoMensual/2);
            decimal impuesto2 = (quincena * (isr.PorExced / 100)) - isr.Subsidio;
                Console.WriteLine($"Impuesto ISR para un sueldo mensual de {sueldoMensual}: {impuesto2}");
                Console.ReadKey ();
                Console.ReadKey ();
            
        }
    }

}

