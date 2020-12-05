using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using TKXDPM_API.Model;

namespace TKXDPM_API.Controllers
{ 
    [Route("api")]
    [ApiController]
    public class EcoBikeRentalController : ControllerBase
    {
        private readonly ILogger<EcoBikeRentalController> _logger;

        public EcoBikeRentalController(ILogger<EcoBikeRentalController> logger)
        {
            _logger = logger;
        }

        [HttpGet("get-list-stations")]
        public async Task<ActionResult> GetListStations()
        {
            var listStation = new List<StationResponse>
            {
                new StationResponse(),
                new StationResponse()
            };
            return Ok(listStation);
        }
        
        [HttpGet("get-station")]
        public async Task<ActionResult> GetStation(int id)
        {
            return Ok(new StationResponse());
        }
        
        [HttpGet("get-list-bike")]
        public async Task<ActionResult> GetListBike(int stationId, BikeType type)
        {
            return Ok(new List<BikeResponse>
            {
                new BikeResponse(),
                new BikeResponse(),
                new BikeResponse(),
                new BikeResponse(),
                new BikeResponse(),
                new BikeResponse()
            });
        }
        
        [HttpGet("get-bike")]
        public async Task<ActionResult> GetListBike(int bikeId)
        {
            return Ok(new BikeResponse());
        }
        
        [HttpGet("get-payment-method")]
        public async Task<ActionResult> GetCard(string userId)
        {
            return Ok(new CardResponse());
        }
        
        [HttpGet("get-rental-info")]
        public async Task<ActionResult> GetRentalInfoBikeById(string userId)
        {
            return Ok(new RentalResponse());
        }
    }
}