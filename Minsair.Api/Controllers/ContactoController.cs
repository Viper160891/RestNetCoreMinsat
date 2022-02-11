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
    public class ContactoController : ControllerBase
    {
        private readonly IDapper _dapper;
        public ContactoController(IDapper dapper)
        {
            _dapper = dapper;
        }

        [HttpGet]
        [Route("GetpaginacionContacto/{page:int}/{rows:int}")]
        public IActionResult GetpaginacionContacto(int page, int rows)
        {
            return Ok(_dapper.contacto.ContactoPaginacion(page, rows));
        }

        [HttpGet]
        [Route("{Id:int}")]
        public ActionResult GetByID(int Id)
        {
            return Ok(_dapper.contacto.GetById(Id));
        }

        [HttpPost]
        public IActionResult Post([FromBody] Contacto contac)
        {
            if (!ModelState.IsValid) return BadRequest();
            return Ok(_dapper.contacto.Insert(contac));
        }

        [HttpPut]
        public IActionResult Put([FromBody] Contacto contac)
        {
            if (ModelState.IsValid && _dapper.contacto.Update(contac))
            {
                return Ok(new { Message = "El Contacto a sido Actualizado" });
            }
            return BadRequest();
        }

        [HttpDelete]
        public IActionResult Delete([FromBody] Contacto contac)
        {
            if (contac.Id > 0)
                return Ok(_dapper.contacto.Delete(contac));
            return BadRequest();
        }

    }
}
