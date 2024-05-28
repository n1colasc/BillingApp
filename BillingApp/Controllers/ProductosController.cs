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
    [RoutePrefix("api/productos")]
    public class ProductosController : System.Web.Http.ApiController
    {
        /// <summary>
        /// Permite eliminar los productos
        /// </summary>
        /// <returns>OK si eliminó los productos, FAIL si hubo una excepción</returns>
        [HttpDelete]
        [Route("v1/execute")]
        public string Delete_v1()
        {
            return string.Empty;
        }

        /// <summary>
        /// Permite consultar los productos
        /// </summary>
        /// <returns>Información asociada a las personas</returns>
        [HttpGet]
        [Route("v1/execute")]
        public string Get_v1()
        {
            return string.Empty;
        }

        /// <summary>
        /// Permite crear un nuevo producto
        /// </summary>
        /// <returns>OK si creó el producto, FAIL si hubo una excepción</returns>
        [HttpPost]
        [Route("v1/execute")]
        public string Insert_v1()
        {
            return string.Empty;
        }

        /// <summary>
        /// Permite actualizar un producto
        /// </summary>
        /// <returns>OK si actualizó el producto, FAIL si hubo una excepción</returns>
        [HttpPatch]
        [Route("v1/execute")]
        public string Update_v1()
        {
            return string.Empty;
        }
    }
}
