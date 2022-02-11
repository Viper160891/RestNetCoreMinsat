using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Minsair.Api.Authentication;
using Minsair.Api.GlobalError;
using Minsair.Dapper;
using Minsair.DataAcces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Minsair.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddCors(options => {
                options.AddPolicy("Todos",
                builder => builder.WithOrigins("*").WithHeaders("*").WithMethods("*"));
            });
            services.AddSingleton<IDapper>(option => new MinsaitDapper(
                Configuration.GetConnectionString("Minsait")
                )) ;

            var tokenProvider = new JwtProvider("issuer", "audience", "minsait");
            services.AddSingleton<ITokenProvider>(tokenProvider);
            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
            {
                options.RequireHttpsMetadata = false;
                options.TokenValidationParameters = tokenProvider.GetValidationParameters();
            });
            services.AddAuthorization(auth => {
                auth.DefaultPolicy = new AuthorizationPolicyBuilder().AddAuthenticationSchemes(JwtBearerDefaults.AuthenticationScheme)
                    .RequireAuthenticatedUser()
                    .Build();
            });
            services.AddControllers();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            app.UseAuthentication();
            app.ConfigureExceptionHandler();
            app.UseHttpsRedirection();
            app.UseCors("Todos");
            app.UseRouting();
            app.UseCorsMiddleware();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
    public class CorsMiddleware
    {
        private readonly RequestDelegate _next;

        public CorsMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public Task Invoke(HttpContext httpContext)
        {
            httpContext.Response.Headers.Add("Access-Control-Allow-Origin", "*");
            httpContext.Response.Headers.Add("Access-Control-Allow-Credentials", "true");
            httpContext.Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, Accept");
            httpContext.Response.Headers.Add("Access-Control-Allow-Methods", "POST,GET,PUT,PATCH,DELETE,OPTIONS");
            return _next(httpContext);
        }
    }
    // Extension method used to add the middleware to the HTTP request pipeline.  
    public static class CorsMiddlewareExtensions
    {
        public static IApplicationBuilder UseCorsMiddleware(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<CorsMiddleware>();
        }
    }
}
