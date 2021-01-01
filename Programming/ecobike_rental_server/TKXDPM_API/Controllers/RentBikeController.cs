using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using TKXDPM_API.Model;

namespace TKXDPM_API.Controllers
{
    [Route("api")]
    public class RentBikeController : ControllerBase
    {
        private readonly ILogger<RentBikeController> _logger;
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _dbContext;

        public RentBikeController(ILogger<RentBikeController> logger, IMapper mapper,
            ApplicationDbContext dbContext)
        {
            _logger = logger;
            _mapper = mapper;
            _dbContext = dbContext;
        }


        [HttpPost("rent-bike")]
        public async Task<ActionResult> RentBike(string deviceCode, int bikeId, int deposit)
        {
            var renter = await _dbContext.Renters.
                Where(r => r.DeviceCode == deviceCode).
                Include(r => r.Card)
                .FirstOrDefaultAsync();
            if (renter == null)
            {
                return NotFound($"The Renter with device Code {deviceCode} Not Found");
            }

            var bike = await _dbContext.Bikes.
                Where(b => b.BikeId == bikeId).
                Include(b => b.Rentals)
                .ThenInclude(r => r.Transaction)
                .FirstOrDefaultAsync();
            if (bike == null)
            {
                return NotFound($"The BikeId {bikeId} Not Found");
            }

            if (bike.IsRent())
            {
                return BadRequest($"The BikeId {bikeId} Is Rented By Other");
            }

            var hasRent = await HasRentBike(renter);
            if (hasRent)
            {
                return BadRequest($"UserID {renter.RenterId} has rent another bike");
            }

            if (renter.Card == null)
            {
                return NotFound($"The Card of renter {deviceCode} Not Found");
            }

            if (bike.CheckDeposit(deposit))
            {
                await RentBike(bike, renter);
                return Ok();
            }
            else
            {
                return BadRequest("Not enough deposit");
            }
        }

        [HttpPost("check-rent-bike")]
        public async Task<ActionResult<BikeResponse>> CheckRentBikeTask(string deviceCode)
        {
            var renter = await _dbContext.FindRenter(deviceCode);
            if (renter == null)
            {
                return NotFound($"The Renter with device Code {deviceCode} Not Found");
            }

            var oldRentals =
                await _dbContext.Rentals.Where(r => r.RenterId == renter.RenterId)
                    .Include(r => r.Transaction)
                    .Include(r => r.Bike)
                    .ToListAsync();
            var rental = oldRentals.Find(r =>
                r.IsInRentingState());
            if (rental != null)
            {
                return _mapper.Map<BikeResponse>(rental.Bike);
            }
            else
            {
                return NotFound("Not Found Rental");
            }
        }

        [NonAction]
        public async Task<bool> HasRentBike(Renter renter)
        {
            var oldRentals =
                await _dbContext.Rentals.Where(r => r.RenterId == renter.RenterId)
                    .Include(r => r.Transaction)
                    .ToListAsync();
            var hasRent = oldRentals.Any(rental => rental.IsInRentingState());
            return hasRent;
        }

        [NonAction]
        public async Task RentBike(Bike bike, Renter renter)
        {
            var bikeInStations
                = from bikeInStation in _dbContext.BikeInStations
                where bikeInStation.BikeId == bike.BikeId
                select bikeInStation;
            _dbContext.RemoveRange(bikeInStations);
            var newRental = new Rental()
            {
                Bike = bike,
                Renter = renter,
                Card = renter.Card,
            };
            var transaction = new Transaction()
            {
                Rental = newRental,
                PaymentStatus = PaymentStatus.Deposit,
                BookedStartDateTime = DateTime.Now
            };
            _dbContext.Add(newRental);
            _dbContext.Add(transaction);
            await _dbContext.SaveChangesAsync();
        }
    }
}