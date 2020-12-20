using System;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using TKXDPM_API;
using TKXDPM_API.Controllers;
using TKXDPM_API.Helpers;

namespace TKXDPM_Test
{
    public class BaseTest
    {
        protected ApplicationDbContext BuildContext(string dbName)
        {
            var options = new DbContextOptionsBuilder<ApplicationDbContext>()
                .UseInMemoryDatabase(dbName).Options;
            var dbContext = new ApplicationDbContext(options);
            return dbContext;
        }

        protected IMapper BuildMapper()
        {
            var config = new MapperConfiguration(options =>
            {
                options.AddProfile(new AutoMapperProfile());
            });
            return config.CreateMapper();
        }

        protected Logger<TController> BuildLogger<TController>()
        {
            return new Logger<TController>(new LoggerFactory());
        }
    }
}