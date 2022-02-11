using Dapper;
using Minsair.Models;
using Minsair.Repositories;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Minsair.DataAcces
{
    public class ClientesRepository : Repository<Clientes>, IClientes
    {
        public ClientesRepository(string connectionString) : base(connectionString)
        { }
        public IEnumerable<Clientes> ClientesPaginacion(int pag, int rows)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@page", pag);
            parameters.Add("@rows", rows);
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.Query<Clientes>("dbo.paginacionClientes", parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

       
    }
}
