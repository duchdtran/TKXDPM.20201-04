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
    public class ViewBikeController : ControllerBase
    {
        private readonly ILogger<ViewBikeController> _logger;
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _dbContext;

        public ViewBikeController(ILogger<ViewBikeController> logger, IMapper mapper,
            ApplicationDbContext dbContext)
        {
            _logger = logger;
            _mapper = mapper;
            _dbContext = dbContext;
        }

        [HttpGet("get-list-stations")]
        public async Task<ActionResult<List<StationResponse>>> GetListStations()
        {
            var listStation = await _dbContext.Stations
                .Include(station => station.BikeInStations).ThenInclude(bikeInStation => bikeInStation.Bike)
                .Include(station => station.Address)
                .ToListAsync();
            var listStationResponse = new List<StationResponse>();
            foreach (var station in listStation)
            {
                var stationResponse = _mapper.Map<StationResponse>(station);
                stationResponse.Address = _mapper.Map<AddressResponse>(station.Address);
                var listBike = new List<BikeResponse>();
                foreach (var bikeInStation in station.BikeInStations)
                {
                    listBike.Add(_mapper.Map<BikeResponse>(bikeInStation.Bike));
                }

                stationResponse.ListBike = listBike;
                listStationResponse.Add(stationResponse);
            }

            return listStationResponse;
        }

        [HttpGet("get-station")]
        public async Task<ActionResult<StationResponse>> GetStation(int id)
        {
            var stationR = await _dbContext.Stations.Where(s => s.StationId == id)
                .Include(s => s.BikeInStations).ThenInclude(bikeInStation => bikeInStation.Bike)
                .Include(s => s.Address)
                .FirstOrDefaultAsync();
            if (stationR == null)
            {
                return NotFound($"Not found station {id}");
            }

            var stationResponse = _mapper.Map<StationResponse>(stationR);
            stationResponse.Address = _mapper.Map<AddressResponse>(stationR.Address);
            var listBike = new List<BikeResponse>();
            foreach (var bikeInStation in stationR.BikeInStations)
            {
                listBike.Add(_mapper.Map<BikeResponse>(bikeInStation.Bike));
            }

            stationResponse.ListBike = listBike;
            return stationResponse;
        }

        [HttpGet("get-list-bike")]
        public async Task<ActionResult<List<BikeResponse>>> GetListBike(int stationId, BikeType type)
        {
            var station = await _dbContext.Stations.Where(s => s.StationId == stationId)
                .Include(s => s.BikeInStations)
                .ThenInclude(bikeInStation => bikeInStation.Bike)
                .Include(s => s.Address)
                .FirstOrDefaultAsync();
            if (station == null)
            {
                return NotFound($"Not found station {stationId}");
            }

            var listBike = (
                    from bikeInStation in station.BikeInStations
                    select bikeInStation.Bike
                    into bike
                    where bike.Type == type
                    select bike)
                .ToList();

            var results = new List<BikeResponse>();
            foreach (var bike in listBike)
            {
                var bikeResponse = _mapper.Map<BikeResponse>(bike);
                results.Add(bikeResponse);
            }

            return results;
        }

        [HttpGet("get-bike")]
        public async Task<ActionResult<BikeResponse>> GetBike(int bikeId)
        {
            var bike = await _dbContext.Bikes.Where(b => b.BikeId == bikeId).Include(b => b.Rentals)
                .ThenInclude(r => r.Transaction)
                .FirstOrDefaultAsync();
            if (bike != null)
            {
                var bikeResponse = _mapper.Map<BikeResponse>(bike);
                bikeResponse.IsRented = bike.IsRent();
                return bikeResponse;
            }
            else
            {
                return NotFound($"Not found bike {bikeId}");
            }
        }

        [HttpGet("get-payment-method")]
        public async Task<ActionResult<CardResponse>> GetCard(string deviceCode)
        {
            var renter = await _dbContext.Renters.Where(r => r.DeviceCode == deviceCode).Include(r => r.Card)
                .FirstOrDefaultAsync();
            if (renter == null)
            {
                return NotFound($"Not found renter {deviceCode}");
            }

            var card = _mapper.Map<CardResponse>(renter.Card);
            card.Renter = _mapper.Map<RenterResponse>(renter);
            return card;
        }

        [HttpGet("get-rental-info")]
        public async Task<ActionResult<List<RentalResponse>>> GetRentalInfoBikeById(string deviceCode)
        {
            var renter = await _dbContext.FindRenter(deviceCode);
            if (renter == null)
            {
                return NotFound($"Not found renter {deviceCode}");
            }

            var rentals = await _dbContext.Rentals
                .Where(r => r.RenterId == renter.RenterId)
                .Include(r => r.Card)
                .Include(r => r.Bike)
                .Include(r => r.Transaction).ToListAsync();
            if (rentals.Count == 0)
            {
                return NotFound($"Not found rental with renter {deviceCode}");
            }

            var rentalResponse = _mapper.Map<List<RentalResponse>>(rentals);

            return Ok(rentalResponse);
        }
    }
}