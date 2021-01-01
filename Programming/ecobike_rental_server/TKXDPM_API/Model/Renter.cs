using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TKXDPM_API.Model
{
    public class Renter
    {
        [Key] public int RenterId { get; set; }
        [Column(TypeName = "varchar(255)")] public string Name { get; set; }
        [Column(TypeName = "varchar(255)")] public string DeviceCode { get; set; }
        public List<Rental> Rentals { get; set; }
        public Card Card { get; set; }

        public bool HasNoRentals()
        {
            return Rentals.Count == 0;
        }

        public Transaction GetDepositTransaction()
        {
            var rental = Rentals.Find(r => (r.Transaction != null && r.Transaction.PaymentStatus == PaymentStatus.Deposit));
            return rental?.Transaction;
        }

        public bool IsRentBike(int bikeId)
        {
            var rental = Rentals.Find(r => (r.Transaction != null && r.Transaction.PaymentStatus == PaymentStatus.Deposit));
            return rental?.BikeId == bikeId;
        }
    }

    public class RenterResponse
    {
        public int RenterId { get; set; }
        public string Name { get; set; }
        public string DeviceCode { get; set; }
    }
}