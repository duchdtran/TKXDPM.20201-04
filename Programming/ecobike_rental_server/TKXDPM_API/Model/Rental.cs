using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace TKXDPM_API.Model
{
    public class Rental
    {
        [Key] public int RentalId { get; set; }
        public int BikeId { get; set; }
        public Bike Bike { get; set; }
        [AllowNull]
        public int CardId { get; set; }
        public Card Card { get; set; }
        public int RenterId { get; set; }
        public Renter Renter { get; set; }
        [Column(TypeName = "varchar(255)")] 
        public string RateContent { get; set; }
        public Transaction Transaction { get; set; }
        public int RateNumber { get; set; }
        
        public bool IsInRentingState()
        {
            return Transaction != null && Transaction.IsInRentingState();
        }
    }

    public class RentalResponse
    {
        public BikeResponse Bike { get; set; }
        public CardResponse Card { get; set; }
        public TransactionResponse Transaction { get; set; }
        public string RateContent { get; set; }
        public int RateNumber { get; set; }
    }
}