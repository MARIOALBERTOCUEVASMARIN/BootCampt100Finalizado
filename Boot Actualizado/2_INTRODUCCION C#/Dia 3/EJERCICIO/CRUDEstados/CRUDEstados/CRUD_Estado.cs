using CRUDEstados;
using System;
using System.Collections.Generic;

class CRUD_Estado
{
    private Dictionary<int, Estado> estados = new Dictionary<int, Estado>();
    private int idCounter = 1;

    public void ConsultarTodos()
    {
        Console.WriteLine("Estados Registrados:");
        foreach (var estado in estados.Values)
        {
            Console.WriteLine($"ID: {estado.Id}, Nombre: {estado.Nombre}");
        }
    }

    public void ConsultarUno()
    {
        Console.Write("Ingrese el ID del estado a consultar: ");
        if (int.TryParse(Console.ReadLine(), out int id))
        {
            if (estados.ContainsKey(id))
            {
                Estado estado = estados[id];
                Console.WriteLine($"ID: {estado.Id}, Nombre: {estado.Nombre}");
            }
            else
            {
                Console.WriteLine("El estado no se encuentra en la lista.");
            }
        }
        else
        {
            Console.WriteLine("ID no válido. Ingrese un número entero.");
        }
    }

    public void Agregar()
    {
        Console.Write("Ingrese el nombre del estado: ");
        string nombre = Console.ReadLine();

        Estado nuevoEstado = new Estado(idCounter, nombre);
        estados[idCounter] = nuevoEstado;
        idCounter++;

        Console.WriteLine("Estado agregado exitosamente.");
    }

    public void Actualizar()
    {
        Console.Write("Ingrese el ID del estado a actualizar: ");
        if (int.TryParse(Console.ReadLine(), out int id))
        {
            if (estados.ContainsKey(id))
            {
                Console.Write("Ingrese el nuevo nombre: ");
                string nuevoNombre = Console.ReadLine();

                estados[id].Nombre = nuevoNombre;
                Console.WriteLine("Estado actualizado exitosamente.");
            }
            else
            {
                Console.WriteLine("El estado no se encuentra en la lista.");
            }
        }
        else
        {
            Console.WriteLine("ID no válido. Ingrese un número entero.");
        }
    }

    public void Eliminar()
    {
        Console.Write("Ingrese el ID del estado a eliminar: ");
        if (int.TryParse(Console.ReadLine(), out int id))
        {
            if (estados.ContainsKey(id))
            {
                estados.Remove(id);
                Console.WriteLine("Estado eliminado exitosamente.");
            }
            else
            {
                Console.WriteLine("El estado no se encuentra en la lista.");
            }
        }
        else
        {
            Console.WriteLine("ID no válido. Ingrese un número entero.");
        }
    }
}

