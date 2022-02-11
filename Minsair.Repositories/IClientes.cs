using Minsair.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Minsair.Repositories
{
    public interface IClientes : IRepository<Clientes>
    {
        IEnumerable<Clientes> ClientesPaginacion(int pag, int rows);
    }
}
