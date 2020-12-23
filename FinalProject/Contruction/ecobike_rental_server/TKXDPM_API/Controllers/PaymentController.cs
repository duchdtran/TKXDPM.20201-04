using System;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using TKXDPM_API.Model;

namespace TKXDPM_API.Controllers
{
    public class PaymentController : ControllerBase
    {
        private ILogger<PaymentController> _logger;
        private IMapper _mapper;
        private ApplicationDbContext _dbContext;

        public PaymentController(ILogger<PaymentController> logger, IMapper mapper,
            ApplicationDbContext dbContext)
        {
            _logger = logger;
            _mapper = mapper;
            _dbContext = dbContext;
        }
        
        public class AddPaymentMethodForm
        {
            public string DeviceCode { get; set; }
            public string CardCode { get; set; }
            public string PaymentMethod { get; set; }
            public int Cvv { get; set; }
            public DateTime ExpirationDate { get; set; }
        }

        [HttpPost("add-payment-method")]
        public async Task<ActionResult> AddPaymentMethod([FromBody] AddPaymentMethodForm request)
        {
            var renter = await _dbContext.FindRenter(request.DeviceCode);
            if (renter == null)
            {
                return NotFound($"Not found renter {request.DeviceCode}");
            }

            var card = new Card()
            {
                RenterId = renter.RenterId,
                CardCode = request.CardCode,
                PaymentMethod = request.PaymentMethod,
                Cvv = request.Cvv,
                ExpirationDate = request.ExpirationDate
            };
            _dbContext.Cards.Add(card);
            await _dbContext.SaveChangesAsync();
            return Ok();
        }
    }
}