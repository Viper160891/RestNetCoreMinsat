using Minsair.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Minsair.Repositories
{
    public interface IUser:IRepository<User>
    {
        User ValidateUser(string email, string password);
    }
}
