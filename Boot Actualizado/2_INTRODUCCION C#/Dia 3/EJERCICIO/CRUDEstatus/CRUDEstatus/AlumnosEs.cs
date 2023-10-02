using System;
using System.Collections.Generic;

class AlumnosEs
{
    private List<EstatusAlumnos> listaEstatus = new List<EstatusAlumnos>();

    public void ConsultarTodos()
    {
        Console.WriteLine("Estatus de Alumnos Registrados:");
        foreach (var estatus in listaEstatus)
        {
            Console.WriteLine($"ID: {estatus.Id}, Nombre: {estatus.Nombre}");
        }
    }

    public void ConsultarUno()
    {
        Console.Write("Ingrese el ID del estatus a consultar: ");
        if (int.TryParse(Console.ReadLine(), out int id))
        {
            EstatusAlumnos estatus = listaEstatus.Find(e => e.Id == id);
            if (estatus != null)
            {
                Console.WriteLine($"ID: {estatus.Id}, Nombre: {estatus.Nombre}");
            }
            else
            {
                Console.WriteLine("El estatus no se encuentra en la lista.");
            }
        }
        else
        {
            Console.WriteLine("ID no válido. Ingrese un número entero.");
        }
    }

    public void Agregar()
    {
        Console.Write("Ingrese el nombre del estatus: ");
        string nombre = Console.ReadLine();

        int nuevoId = listaEstatus.Count + 1;
        EstatusAlumnos nuevoEstatus = new EstatusAlumnos(nuevoId, nombre);
        listaEstatus.Add(nuevoEstatus);

        Console.WriteLine("Estatus agregado exitosamente.");
    }

    public void Actualizar()
    {
        Console.Write("Ingrese el ID del estatus a actualizar: ");
        if (int.TryParse(Console.ReadLine(), out int id))
        {
            EstatusAlumnos estatus = listaEstatus.Find(e => e.Id == id);
            if (estatus != null)
            {
                Console.Write("Ingrese el nuevo nombre: ");
                string nuevoNombre = Console.ReadLine();

                estatus.Nombre = nuevoNombre;
                Console.WriteLine("Estatus actualizado exitosamente.");
            }
            else
            {
                Console.WriteLine("El estatus no se encuentra en la lista.");
            }
        }
        else
        {
            Console.WriteLine("ID no válido. Ingrese un número entero.");
        }
    }

    public void Eliminar()
    {
        Console.Write("Ingrese el ID del estatus a eliminar: ");
        if (int.TryParse(Console.ReadLine(), out int id))
        {
            EstatusAlumnos estatus = listaEstatus.Find(e => e.Id == id);
            if (estatus != null)
            {
                listaEstatus.Remove(estatus);
                Console.WriteLine("Estatus eliminado exitosamente.");
            }
            else
            {
                Console.WriteLine("El estatus no se encuentra en la lista.");
            }
        }
        else
        {
            Console.WriteLine("ID no válido. Ingrese un número entero.");
        }
    }
}
