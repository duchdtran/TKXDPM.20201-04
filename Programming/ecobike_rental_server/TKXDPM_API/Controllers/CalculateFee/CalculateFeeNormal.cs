using System;
using System.Collections.Generic;
using TKXDPM_API.Model;

namespace TKXDPM_API.Controllers.CalculateFee
{
    public class CalculateFeeNormal : ICalculateFee
    {
        private readonly Dictionary<BikeType, RentFee> _bikeRentFees = new Dictionary<BikeType, RentFee>
        {
            {BikeType.Single, new RentFee {HourlyRent = 3000, StartingRent = 10000}},
            {BikeType.Double, new RentFee {HourlyRent = 4500, StartingRent = 15000}},
            {BikeType.Electric, new RentFee {HourlyRent = 4500, StartingRent = 15000}},
        };

        public int CalculateFee(double minutes, BikeType type)
        {
            var bikeRentFee = _bikeRentFees[type];
            double fee = 0;
            if (minutes < 10)
            {
                fee = 0;
            }
            else if (minutes <= 30)
            {
                fee = bikeRentFee.StartingRent;
            }
            else
            {
                fee = Math.Ceiling((minutes - 30) / 15) * bikeRentFee.HourlyRent + bikeRentFee.StartingRent;
            }

            return (int) fee;
        }
    }
}