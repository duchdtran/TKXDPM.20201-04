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
        [Column(TypeName = "varchar(255)")] public string PaymentStatus { get; set; }
        public DateTime BookedStartDateTime { get; set; }
        public DateTime BookedEndDateTime { get; set; }
        public DateTime ActualStartDateTime { get; set; }
        public DateTime ActualEndDateTime { get; set; }


        public static List<Transaction> GetSeederData()
        {
            return new List<Transaction>
            {
                new Transaction()
                {
                    TransactionId = 100001, RentalId = 100001, Rental = new Rental(), PaymentStatus = "PaymentStatus",
                    BookedStartDateTime = new DateTime(2020, 12, 3), BookedEndDateTime = new DateTime(2020, 12, 3),
                    ActualStartDateTime = new DateTime(2020, 12, 3, 8, 32, 54),
                    ActualEndDateTime = new DateTime(2020, 12, 3, 10, 14, 54),
                },
                new Transaction()
                {
                    TransactionId = 100001, RentalId = 100001, Rental = new Rental(), PaymentStatus = "PaymentStatus",
                    BookedStartDateTime = new DateTime(2020, 12, 5), BookedEndDateTime = new DateTime(2020, 12, 5),
                    ActualStartDateTime = new DateTime(2020, 12, 3, 8, 32, 54),
                    ActualEndDateTime = new DateTime(2020, 12, 3, 10, 14, 54),
                },
                new Transaction()
                {
                    TransactionId = 100001, RentalId = 100001, Rental = new Rental(), PaymentStatus = "PaymentStatus",
                    BookedStartDateTime = new DateTime(2020, 12, 6), BookedEndDateTime = new DateTime(2020, 12, 6),
                    ActualStartDateTime = new DateTime(2020, 12, 3, 8, 32, 54),
                    ActualEndDateTime = new DateTime(2020, 12, 3, 10, 14, 54),
                },
                new Transaction()
                {
                    TransactionId = 100002, RentalId = 100002, Rental = new Rental(), PaymentStatus = "PaymentStatus",
                    BookedStartDateTime = new DateTime(2020, 12, 3), BookedEndDateTime = new DateTime(2020, 12, 3),
                    ActualStartDateTime = new DateTime(2020, 12, 3, 8, 32, 54),
                    ActualEndDateTime = new DateTime(2020, 12, 3, 10, 14, 54),
                }
            };
        }
    }
}