using Dapper;
using Minsair.Models;
using Minsair.Repositories;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Minsair.DataAcces
{
    public class UserRepository : Repository<User>, IUser
    {
        public UserRepository(string connectionString) : base(connectionString)
        { }
        public User ValidateUser(string email, string password)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@email", email);
            parameters.Add("@password", password);

            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.QueryFirstOrDefault<User>("dbo.ValidateUser", parameters,
                    commandType: System.Data.CommandType.StoredProcedure);
            }
        }
    }
}
