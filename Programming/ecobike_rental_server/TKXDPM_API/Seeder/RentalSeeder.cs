using System.Collections.Generic;
using TKXDPM_API.Model;

namespace TKXDPM_API.Seeder
{
    public static class RentalSeeder
    {
        public static List<Rental> GetSeederData()
        {
            return new List<Rental>
            {
                new Rental()
                {
                    RentalId = 100001, BikeId = 100001, CardId = 100001, RateContent = "Mọi thứ đều tốt.",
                    RateNumber = 5, RenterId = 100001
                },
                new Rental()
                {
                    RentalId = 100002, BikeId = 100002, CardId = 100002, RateContent = "Tuyệt vời.", RateNumber = 5,
                    RenterId = 100002
                },
                new Rental()
                {
                    RentalId = 100003, BikeId = 200001, CardId = 100003, RateContent = "Mọi thứ đều tốt.",
                    RateNumber = 5, RenterId = 100003
                },
                new Rental()
                {
                    RentalId = 100004, BikeId = 200002, CardId = 100001, RateContent = "Xe đi rất thoải mái.",
                    RateNumber = 4, RenterId = 100004
                },
                new Rental()
                {
                    RentalId = 100005, BikeId = 300001, CardId = 100001, RateContent = "Mọi thứ đều tốt.",
                    RateNumber = 5, RenterId = 100005
                },
                new Rental()
                {
                    RentalId = 100006, BikeId = 100004, CardId = 100001, RateContent = "Trải nghiệm thú vị.",
                    RateNumber = 5, RenterId = 100006
                },
            };
        }
    }
}