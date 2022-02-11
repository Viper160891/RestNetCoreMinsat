using Microsoft.IdentityModel.Tokens;
using Minsair.Models;
using System;

namespace Minsair.Api.Authentication
{
    public interface ITokenProvider
    {
        string CreateToken(User user, DateTime expire);
        TokenValidationParameters GetValidationParameters();
        
    }
}
