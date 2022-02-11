using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Minsair.Api.Authentication;
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
    public class TokenController : ControllerBase
    {
        private ITokenProvider _tokenProvider;
        private IDapper _unitOfWork;

        public TokenController(ITokenProvider tokenProvider,IDapper unitOfWork)
        {
            _tokenProvider = tokenProvider;
            _unitOfWork = unitOfWork;


        }

        [HttpPost]
        public JsonWebToken Post([FromBody] User userLogin)
        {
            var user = _unitOfWork.user.ValidateUser(userLogin.strEmail, userLogin.strPassword);
            if (user == null)
            {
                throw new UnauthorizedAccessException();

            }
            var token = new JsonWebToken
            {
                Acces_Token = _tokenProvider.CreateToken(user, DateTime.UtcNow.AddHours(8)),
                Expires_in = 480
            };
            return token;
        }

    }
}
