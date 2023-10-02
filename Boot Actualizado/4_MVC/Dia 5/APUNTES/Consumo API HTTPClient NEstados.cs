using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Text;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;

using System.Web;
using System.Configuration;

namespace ConsumeAPIMVC.Models
{
    public class NEstados
    {
        //private static readonly HttpClient client = new HttpClient();
        //const string urlWebAPI = "http://localhost:22834/api/Estados";

        string urlWebAPI = ConfigurationManager.AppSettings["urlWebAPI"];

        public NEstados()
        {

        }
        public List<Estados> Consultar()
        {
            var estados = new List<Estados>();
            try
            {
                //Instancia el objeto HttpClient
                using (var client = new HttpClient())
                {
                    //Invoca el método GetAsync del objeto HttpClient, el cual envía una solicitud GET al
                    //URI especificado como parámetro, como una operación asincrónica
                    Task<HttpResponseMessage> responseTask = client.GetAsync("http://localhost:22834/api/Estados");
                    
                    // Se invoca al método Wait a fin de esperar a que se complete la operación asincrona
                    responseTask.Wait();
                    
                    //Obtenemos el objeto HttpResponseMessage a través de la propiedad Result del objeto Task<HttpResponseMessage>
                    HttpResponseMessage result = responseTask.Result;
                    
                    // Verificamos que la operación haya sido ejecutada con éxito, para proceder a obtener el resultado enviado
                    // desde la web api, en caso contrario enviamos una excepción
                    if (result.IsSuccessStatusCode)
                    {
                        //Invocamos al método ReadAsStringAsync del objeto HttpContent el cual serializa
                        //el contenido HTTP en una cadena como una operación asincrónica. 
                        Task<string> readTask = result.Content.ReadAsStringAsync();
                    
                        // Se invoca al método Wait a fin de esperar a que se complete la operación asincrona
                        readTask.Wait();
                        
                        //Obtenemos el string en formato json del objeto recibido
                        string json = readTask.Result;
                        
                        //Deserealizamos el objeto recibido, en este caso una lista de estados
                        estados = JsonConvert.DeserializeObject<List<Estados>>(json);
                    }
                    else //web api envió error de respuesta
                    {
                        throw new Exception($"WebAPI. Respondio con error.{result.StatusCode}");
                    }
                }

            }
            catch (Exception ex)
            {
                throw new Exception($"WebAPI. Respondio con error.{ex.Message}");
            }
            return estados;
        }
        public Estados Consultar(int id)
        {
            Estados estados = null;
            try
            {
                //Instancia el objeto HttpClient
                using (var client = new HttpClient())
                {
                    //Invoca el método GetAsync del objeto HttpClient, el cual envía una solicitud GET al
                    //URI especificado como parámetro, como una operación asincrónica
                    var responseTask = client.GetAsync(urlWebAPI + $"/{id}");

                    // Se invoca al método Wait a fin de esperar a que se complete la operación asincrona
                    responseTask.Wait();

                    //Obtenemos el objeto HttpResponseMessage a través de la propiedad Result del objeto Task<HttpResponseMessage>
                    var result = responseTask.Result;

                    // Verificamos que la operación haya sido ejecutada con éxito, para proceder a obtener el resultado enviado
                    // desde la web api, en caso contrario enviamos una excepción
                    if (result.IsSuccessStatusCode)
                    {
                        //Invocamos al método ReadAsStringAsync del objeto HttpContent el cual serializa
                        //el contenido HTTP en una cadena como una operación asincrónica. 
                        var readTask = result.Content.ReadAsStringAsync();

                        // Se invoca al método Wait a fin de esperar a que se complete la operación asincrona
                        readTask.Wait();
                        
                        //Obtenemos el string en formato json del objeto recibido
                        string json = readTask.Result;
                        
                        //Deserealizamos el objeto recibido, en este caso un estado
                        estados = JsonConvert.DeserializeObject<Estados>(json);
                    }
                    else //web api envió error de respuesta 
                    {
                        throw new Exception($"WebAPI. Respondio con error.{result.StatusCode}");
                    }

                }
            }
            catch (Exception ex)
            {
                throw new Exception($"WebAPI. Respondio con error.{ex.Message}");
            }
            return estados;

        }
        public Estados Agregar(Estados estado)
        {
            try
            {
                //Instancia el objeto HttpClient
                using (var client = new HttpClient())
                {

                    //Creamos un objeto HttpContent instanciando un objeto StringContent, la cual es una clase derivada de HttpContent.
                    //Este contenido se crea con el objeto Estado que se está recibiendo
                    HttpContent httpContent = new StringContent(JsonConvert.SerializeObject(estado), Encoding.UTF8);

                    //Asignamos a la propiedad ContentType del encabezado de HttpContent
                    httpContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");

                    //Invoca el método PostAsync del objeto HttpClient, el cual envía una solicitud POST al
                    //URI especificado como parámetro, como una operación asincrónica, asimismo le envía el contenido (objeto estado) dentro del httpContect
                    Task<HttpResponseMessage> postTask = client.PostAsync(urlWebAPI, httpContent);

                    // Se invoca al método Wait a fin de esperar a que se complete la operación asincrona
                    postTask.Wait();

                    //Obtenemos el objeto HttpResponseMessage a través de la propiedad Result del objeto Task<HttpResponseMessage>
                    HttpResponseMessage result = postTask.Result;

                    // Verificamos que la operación haya sido ejecutada con éxito, para proceder a obtener el resultado enviado
                    // desde la web api, en caso contrario enviamos una excepción
                    if (result.IsSuccessStatusCode)
                    {
                        // Verificamos que la operación haya sido ejecutada con éxito, para proceder a obtener el resultado enviado
                        // desde la web api, en caso contrario enviamos una excepción
                        var readTask = result.Content.ReadAsStringAsync();
                        // Se invoca al método Wait a fin de esperar a que se complete la operación asincrona
                        readTask.Wait();
                        //Obtenemos el string en formato json del objeto recibido
                        string json = readTask.Result;
                        //Deserealizamos el objeto recibido, en este caso un estado
                        estado = JsonConvert.DeserializeObject<Estados>(json);
                    }
                    else //web api envió error de respuesta
                    {
                        throw new Exception($"WebAPI. Respondio con error.{result.StatusCode}");
                    }
                }

            }
            catch (Exception ex)
            {
                throw new Exception($"WebAPI. Respondio con error.{ex.Message}");
            }
            return estado;
        }
        

    }
}