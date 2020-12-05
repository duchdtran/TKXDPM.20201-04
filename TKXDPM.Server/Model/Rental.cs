using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TKXDPM_API.Model
{
    public class Rental
    {
        [Key] public int RentalId { get; set; }
        public int BikeId { get; set; }
        public Bike Bike { get; set; }
        public int CardId { get; set; }
        public Card Card { get; set; }
        public int RenterId { get; set; }
        public Renter Renter { get; set; }
        [Column(TypeName = "varchar(255)")]
        public string RateContent { get; set; }
        public int RateNumber { get; set; }
        
        public static List<Rental> GetSeederData()
        {
            return new List<Rental>
            {
                new Rental()
                {
                    RentalId = 100001,BikeId = 100001,Bike = new Bike(),CardId = 100001,Card = new Card(),
                    RenterId = 100001, Renter = new Renter(),RateContent = "Mọi thứ đều tốt.",RateNumber = 5
                },
                new Rental()
                {
                    RentalId = 100002,BikeId = 100002,Bike = new Bike(),CardId = 100002,Card = new Card(),
                    RenterId = 100002, Renter = new Renter(),RateContent = "Tuyệt vời.",RateNumber = 5
                },
                new Rental()
                {
                    RentalId = 100003,BikeId = 200001,Bike = new Bike(),CardId = 100003,Card = new Card(),
                    RenterId = 100003, Renter = new Renter(),RateContent = "Mọi thứ đều tốt.",RateNumber = 5
                },
                new Rental()
                {
                    RentalId = 100004,BikeId = 200002,Bike = new Bike(),CardId = 100001,Card = new Card(),
                    RenterId = 100001, Renter = new Renter(),RateContent = "Xe đi rất thoải mái.",RateNumber = 4
                },
                new Rental()
                {
                    RentalId = 100005,BikeId = 300001,Bike = new Bike(),CardId = 100001,Card = new Card(),
                    RenterId = 100001, Renter = new Renter(),RateContent = "Mọi thứ đều tốt.",RateNumber = 5
                },
                new Rental()
                {
                    RentalId = 100006,BikeId = 100004,Bike = new Bike(),CardId = 100001,Card = new Card(),
                    RenterId = 100001, Renter = new Renter(),RateContent = "Trải nghiệm thú vị.",RateNumber = 5
                },
                
            };
        }
        
    }

    public class RentalResponse
    {
        public RentalResponse()
        {
            Renter = new Renter();
            Bike = new BikeResponse();
            RateContent = "Good";
            RateNumber = 5;
        }

        public Renter Renter { get; set; }
        public BikeResponse Bike { get; set; }
        public string RateContent { get; set; }
        public int RateNumber { get; set; }
    }
}