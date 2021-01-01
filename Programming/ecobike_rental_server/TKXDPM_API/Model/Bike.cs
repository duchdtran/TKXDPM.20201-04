using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using AutoMapper;

namespace TKXDPM_API.Model
{
    public class Bike
    {
        [Key] public int BikeId { get; set; }
        [Column(TypeName = "varchar(255)")] public string BikeName { get; set; }
        [Column(TypeName = "varchar(512)")] public string BikeImage { get; set; }
        public string Description { get; set; }
        public int Size { get; set; }
        public int StartingRent { get; set; }
        public int HourlyRent { get; set; }
        public BikeType Type { get; set; }
        [Column(TypeName = "varchar(255)")] public string LicensePlates { get; set; }
        public int BatterCapacity { get; set; }
        public float PowerDrain { get; set; }
        public int Deposit { get; set; }

        public List<Rental> Rentals { get; set; }

        public Rental FindRental()
        {
            var rentals = Rentals.Where(rental => rental.Transaction.BookedEndDateTime == DateTime.MinValue).ToArray();
            return rentals[0];
        }

        public bool IsRent()
        {
            return Rentals != null &&
                   Rentals.Any(rental =>
                       rental.Transaction != null && (
                           rental.Transaction.BookedEndDateTime == DateTime.MinValue ||
                           rental.Transaction.BookedEndDateTime >= DateTime.Now));
        }

        public bool CheckDeposit(int deposit)
        {
            var condition = new Dictionary<BikeType, int>()
            {
                {BikeType.Single, 400000},
                {BikeType.Double, 550000},
                {BikeType.Electric, 700000}
            };

            return deposit >= condition[Type];
        }
    }

    public class BikeResponse
    {
        public static BikeResponse CreateByMapper(Bike bike, IMapper mapper)
        {
            var bikeResponse = mapper.Map<BikeResponse>(bike);
            bikeResponse.IsRented = bike.IsRent();
            return bikeResponse;
        }

        public int BikeId { get; set; }
        public string BikeName { get; set; }
        public string BikeImage { get; set; }
        public string Description { get; set; }
        public int StartingRent { get; set; }
        public int HourlyRent { get; set; }
        public BikeType Type { get; set; }
        public string LicensePlates { get; set; }
        public int BatterCapacity { get; set; }
        public float PowerDrain { get; set; }
        public int Deposit { get; set; }
        public bool IsRented { get; set; } = false;
    }

    public enum BikeType
    {
        Single = 1,
        Double = 2,
        Electric = 3,
    }
}