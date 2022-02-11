using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Minsair.Dapper;
using Minsair.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Minsair.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ClientesController : ControllerBase
    {

        private readonly IDapper _dapper;
        public ClientesController(IDapper dapper)
        {
            _dapper = dapper;
        }

        [HttpGet]
        [Route("GetpaginacionClientes/{page:int}/{rows:int}")]
        public IActionResult GetpaginacionClientes(int page, int rows)
        {
            
            return Ok(_dapper.clientes.ClientesPaginacion(page, rows));
        }

        [HttpGet]
        [Route("{Id:int}")]
        public ActionResult GetByID(int Id)
        {
            return Ok(_dapper.contacto.GetById(Id));
        }

        [HttpPost]
        public IActionResult Post([FromBody] Clientes cli)
        {
            if (!ModelState.IsValid) return BadRequest();
            return Ok(_dapper.clientes.Insert(cli));
        }

        [HttpPut]
        public IActionResult Put([FromBody] Clientes cli)
        {
            if (ModelState.IsValid && _dapper.clientes.Update(cli))
            {
                return Ok(new { Message = "El Cliente a sido Actualizado" });
            }
            return BadRequest();
        }

        [HttpDelete]
        public IActionResult Delete([FromBody] Clientes cli)
        {
            if (cli.Id > 0)
                return Ok(_dapper.clientes.Delete(cli));
            return BadRequest();
        }

    }
}
