
using Minsair.Models;
using System.Collections.Generic;

namespace Minsair.Repositories
{
    public interface IContacto:IRepository<Contacto>
    {
        IEnumerable<Contacto> ContactoPaginacion(int pag, int rows);

    }
}
