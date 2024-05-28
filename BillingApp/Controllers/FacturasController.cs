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
    [RoutePrefix("api/facturas")]
    public class FacturasController : System.Web.Http.ApiController
    {
        /// <summary>
        /// Permite eliminar las facturas
        /// </summary>
        /// <returns>OK si eliminó las facturas, FAIL si hubo una excepción</returns>
        [HttpDelete]
        [Route("v1/execute")]
        public string Delete_v1()
        {
            return string.Empty;
        }

        /// <summary>
        /// Permite consultar las facturas
        /// </summary>
        /// <returns>Información asociada a las facturas</returns>
        [HttpGet]
        [Route("v1/execute")]
        public string Get_v1()
        {
            return string.Empty;
        }

        /// <summary>
        /// Permite crear una nueva factura
        /// </summary>
        /// <returns>OK si creó la factura, FAIL si hubo una excepción</returns>
        [HttpPost]
        [Route("v1/execute")]
        public string Insert_v1()
        {
            return string.Empty;
        }

        /// <summary>
        /// Permite actualizar una factura
        /// </summary>
        /// <returns>OK si actualizó la factura, FAIL si hubo una excepción</returns>
        [HttpPatch]
        [Route("v1/execute")]
        public string Update_v1()
        {
            return string.Empty;
        }
    }
}
