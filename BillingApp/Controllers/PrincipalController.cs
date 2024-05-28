using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ProductBilling.Controllers
{
    /// <summary>
    /// Permite ejecutar las funcionalidades CRUD Persona, Facturas, Productos y obtener la información de las vistas de la base de datos
    /// </summary>
    [RoutePrefix("api/principal")]
    public class MainController : System.Web.Http.ApiController
    {
        /// <summary>
        /// Permite ejecutar las funcionalidades CRUD Persona, Facturas, Productos y obtener la información de las vistas de la base de datos
        /// </summary>
        /// <returns>OK si fue exitoso el consumo del servicio, FALSE si hubo una excepción</returns>
        [HttpPost]
        [Route("v1/execute")]
        public string Execute_v1()
        {
            return string.Empty;
        }
    }
}
