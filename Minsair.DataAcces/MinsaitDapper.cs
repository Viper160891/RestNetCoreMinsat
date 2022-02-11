using Minsair.Dapper;
using Minsair.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace Minsair.DataAcces
{
    public class MinsaitDapper : IDapper
    {
        public MinsaitDapper(string conn)
        {
            clientes = new ClientesRepository(conn);
            contacto = new ContactoRepository(conn);
            user = new UserRepository(conn);
        }
        public IClientes clientes { get;private set; }

        public IContacto contacto { get; private set; }

        public IUser user { get; private set; }
    }
}
