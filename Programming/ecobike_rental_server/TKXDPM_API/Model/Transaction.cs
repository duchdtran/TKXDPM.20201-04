using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TKXDPM_API.Model
{
    public class Transaction
    {
        [Key] public int TransactionId { get; set; }
        public int RentalId { get; set; }
        public Rental Rental { get; set; }
        public PaymentStatus PaymentStatus { get; set; }
        public DateTime BookedStartDateTime { get; set; } = DateTime.MinValue;
        public DateTime BookedEndDateTime { get; set; } = DateTime.MinValue;
        public DateTime ActualStartDateTime { get; set; } = DateTime.MinValue;
        public DateTime ActualEndDateTime { get; set; } = DateTime.MinValue;
    }

    public class TransactionResponse
    {
        [Key] public int TransactionId { get; set; }
        public PaymentStatus PaymentStatus { get; set; }
        public string BookedStartDateTime { get; set; }
        public string BookedEndDateTime { get; set; }
        public string ActualStartDateTime { get; set; }
        public string ActualEndDateTime { get; set; }
    }

    public enum PaymentStatus
    {
        NotPay = 1,
        Deposit = 2,
        Paid = 3
    }
}