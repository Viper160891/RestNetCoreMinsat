
using Minsair.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace Minsair.Dapper
{
    public interface IDapper
    {
        IClientes clientes { get; }
        IContacto contacto { get; }
        IUser user { get; }

    }
}
