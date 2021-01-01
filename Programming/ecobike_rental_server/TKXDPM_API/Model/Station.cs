using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using AutoMapper;

namespace TKXDPM_API.Model
{
    public class Station
    {
        [Key] public int StationId { get; set; }

        [Column(TypeName = "varchar(255)")] public string StationName { get; set; }
        [Column(TypeName = "varchar(512)")] public string StationImage { get; set; }
        public int AddressId { get; set; }
        public Address Address { get; set; }
        [Column(TypeName = "varchar(255)")] public string ContactName { get; set; }
        [Column(TypeName = "varchar(255)")] public string Email { get; set; }
        [Column(TypeName = "varchar(255)")] public string Phone { get; set; }
        public float Area { get; set; }
        public List<BikeInStation> BikeInStations { get; set; }

        public IEnumerable<Bike> GetListBikes(BikeType type)
        {
            return (from bikeInStation in BikeInStations
                select bikeInStation.Bike
                into bike
                where bike.Type == type
                select bike);
        }
    }

    public class StationResponse
    {
        public static StationResponse CreateByMapper(Station station, IMapper mapper)
        {
            var stationResponse = mapper.Map<StationResponse>(station);
            if (station.Address != null)
            {
                stationResponse.Address = mapper.Map<AddressResponse>(station.Address);
            }

            var listBike = new List<BikeResponse>();
            foreach (var bikeInStation in station.BikeInStations)
            {
                listBike.Add(mapper.Map<BikeResponse>(bikeInStation.Bike));
            }

            stationResponse.ListBike = listBike;

            return stationResponse;
        }

        public int StationId { get; set; }
        public int AddressId { get; set; }
        public string StationName { get; set; }
        public string StationImage { get; set; }
        public string ContactName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public float Area { get; set; }
        public AddressResponse Address { get; set; }
        public List<BikeResponse> ListBike { get; set; }
    }
}