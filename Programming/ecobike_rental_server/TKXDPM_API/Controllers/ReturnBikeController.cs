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
    public class ReturnBikeController : ControllerBase
    {
        private readonly ILogger<ReturnBikeController> _logger;
        private readonly ApplicationDbContext _dbContext;

        public ReturnBikeController(ILogger<ReturnBikeController> logger,
            ApplicationDbContext dbContext)
        {
            _logger = logger;
            _dbContext = dbContext;
        }

        public struct ReturnBikeResponse
        {
            public int ReturnMoney { get; set; }
        }

        [HttpPost("return-bike")]
        public async Task<ActionResult<ReturnBikeResponse>> ReturnBike(
            string deviceCode,
            int stationId,
            int bikeId)
        {
            var bikeInStation = await BikeInStation(bikeId, stationId);
            if (bikeInStation)
            {
                return BadRequest($"The Bike {bikeId} Was In StationId {stationId}");
            }

            var bike = await _dbContext.Bikes.FindAsync(bikeId);
            if (bike == null)
            {
                return NotFound($"The BikeId {bikeId} Not Found");
            }

            var station = await _dbContext.Stations.FindAsync(stationId);
            if (station == null)
            {
                return NotFound($"The Station {stationId} Not Found");
            }

            var renterFind = await _dbContext.FindRenter(deviceCode);
            if (renterFind == null)
            {
                return NotFound($"The Renter with device Code {deviceCode} Not Found");
            }

            var bikeStation = new BikeInStation()
            {
                Bike = bike,
                Station = station,
                DateTimeIn = DateTime.Now
            };
            _dbContext.Add(bikeStation);

            var renter = await _dbContext.Renters
                .Where(r => r.DeviceCode == deviceCode)
                .Include(r => r.Rentals)
                .ThenInclude(rt => rt.Transaction)
                .FirstOrDefaultAsync();
            if (renter.HasNoRentals())
            {
                return NotFound($"Renter {deviceCode} didn't have a rental");
            }

            if (!renter.IsRentBike(bikeId))
            {
                return BadRequest($"Renter {deviceCode} didn't rent bike {bikeId}");
            }

            var transaction = renter.GetDepositTransaction();
            if (transaction == null)
            {
                return NotFound($"Renter {deviceCode} didn't have a transaction");
            }

            var totalMinutes = transaction.GetRentMinutes(DateTime.Now);
            var fee = CalculateFee(totalMinutes, bike.Type);
            _logger.LogInformation("Total minutes " + totalMinutes);
            transaction.UpdateRentInfo(bikeStation.DateTimeIn);
            await _dbContext.SaveChangesAsync();

            return new ReturnBikeResponse()
            {
                ReturnMoney = fee
            };
        }

        public struct GetInvoiceResponse
        {
            public int Fee { get; set; }
            public int Minutes { get; set; }
        }

        [HttpGet("get-invoice")]
        public async Task<ActionResult<GetInvoiceResponse>> GetInvoice(
            string deviceCode,
            int bikeId)
        {
            var bike = await _dbContext.Bikes.FindAsync(bikeId);
            if (bike == null)
            {
                return NotFound($"The BikeId {bikeId} Not Found");
            }

            var renterFind = await _dbContext.FindRenter(deviceCode);
            if (renterFind == null)
            {
                return NotFound($"The Renter with device Code {deviceCode} Not Found");
            }

            var renter = await _dbContext.Renters
                .Where(r => r.DeviceCode == deviceCode)
                .Include(r => r.Rentals)
                .ThenInclude(rt => rt.Transaction)
                .FirstOrDefaultAsync();
            if (renter.HasNoRentals())
            {
                return NotFound($"Renter {deviceCode} didn't have a rental");
            }

            if (!renter.IsRentBike(bikeId))
            {
                return BadRequest($"Renter {deviceCode} didn't rent bike {bikeId}");
            }

            var transaction = renter.GetDepositTransaction();
            if (transaction == null)
            {
                return NotFound($"Renter {deviceCode} didn't have a transaction");
            }

            var totalMinutes = transaction.GetRentMinutes(DateTime.Now);
            var fee = CalculateFee(totalMinutes, bike.Type);
            _logger.LogInformation("Total minutes " + totalMinutes);

            return new GetInvoiceResponse()
            {
                Fee = fee,
                Minutes = (int) totalMinutes
            };
        }

        [NonAction]
        private async Task<bool> BikeInStation(int bikeId, int stationId)
        {
            var bikeInStations
                = await (from bikeInStation in _dbContext.BikeInStations
                    where bikeInStation.BikeIsInStation(bikeId, stationId)
                    select bikeInStation).ToListAsync();
            return bikeInStations.Count != 0;
        }

        [NonAction]
        public int CalculateFee(double minutes, BikeType type)
        {
            double fee = 0;
            if (minutes < 10)
            {
                fee = 0;
            }
            else if (minutes <= 30)
            {
                fee = 10;
            }
            else
            {
                fee = Math.Ceiling((minutes - 30) / 15) * 3 + 10;
            }

            switch (type)
            {
                case BikeType.Single:
                    return (int) fee * 1000;
                case BikeType.Double:
                case BikeType.Electric:
                    return (int) (fee * 1000 * 1.5);
                default:
                    return 0;
            }
        }
    }
}