using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ProductBilling.Controllers
{
    /// <summary>
    /// Permite ejecutar funcionalidades de lectura, creación, actualización y eliminación de facturas
    /// </summary>
    [RoutePrefix("api/persona")]
    public class PersonaController : System.Web.Http.ApiController
    {
        /// <summary>
        /// Permite eliminar las personas
        /// </summary>
        /// <returns>OK si eliminó las personas, FAIL si hubo una excepción</returns>
        [HttpDelete]
        [Route("v1/execute")]
        public string Delete_v1()
        {
            return string.Empty;
        }

        /// <summary>
        /// Permite consultar las personas
        /// </summary>
        /// <returns>Información asociada a las personas</returns>
        [HttpGet]
        [Route("v1/execute")]
        public string Get_v1()
        {
            return string.Empty;
        }

        /// <summary>
        /// Permite crear una nueva persona
        /// </summary>
        /// <returns>OK si creó la persona, FAIL si hubo una excepción</returns>
        [HttpPost]
        [Route("v1/execute")]
        public string Insert_v1()
        {
            return string.Empty;
        }

        /// <summary>
        /// Permite actualizar una persona
        /// </summary>
        /// <returns>OK si actualizó la persona, FAIL si hubo una excepción</returns>
        [HttpPatch]
        [Route("v1/execute")]
        public string Update_v1()
        {
            return string.Empty;
        }
    }
}
