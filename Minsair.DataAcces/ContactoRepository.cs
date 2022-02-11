using Dapper;
using Minsair.Models;
using Minsair.Repositories;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Minsair.DataAcces
{
    public class ContactoRepository:Repository<Contacto>,IContacto
    {
        public ContactoRepository(string connectionString) : base(connectionString)
        { }

        public IEnumerable<Contacto> ContactoPaginacion(int pag, int rows)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@page", pag);
            parameters.Add("@rows", rows);
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.Query<Contacto>("dbo.paginacionContacto", parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
        }
    }
}
