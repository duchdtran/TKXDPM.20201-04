using System;
using System.Collections.Generic;
using TKXDPM_API.Model;

namespace TKXDPM_API.Seeder
{
    public static class TransactionSeeder
    {
        public static List<Transaction> GetSeederData()
        {
            return new List<Transaction>
            {
                new Transaction()
                {
                    TransactionId = 100001, RentalId = 100001,
                    PaymentStatus = PaymentStatus.Paid,
                    BookedStartDateTime = new DateTime(2020, 12, 3), BookedEndDateTime = new DateTime(2020, 12, 3),
                    ActualStartDateTime = new DateTime(2020, 12, 3, 8, 32, 54),
                    ActualEndDateTime = new DateTime(2020, 12, 3, 10, 14, 54),
                },
                new Transaction()
                {
                    TransactionId = 100002, RentalId = 100001,
                    PaymentStatus = PaymentStatus.Paid,
                    BookedStartDateTime = new DateTime(2020, 12, 5), BookedEndDateTime = new DateTime(2020, 12, 5),
                    ActualStartDateTime = new DateTime(2020, 12, 3, 8, 32, 54),
                    ActualEndDateTime = new DateTime(2020, 12, 3, 10, 14, 54),
                },
                new Transaction()
                {
                    TransactionId = 100003, RentalId = 100001,
                    PaymentStatus = PaymentStatus.Paid,
                    BookedStartDateTime = new DateTime(2020, 12, 6), BookedEndDateTime = new DateTime(2020, 12, 6),
                    ActualStartDateTime = new DateTime(2020, 12, 3, 8, 32, 54),
                    ActualEndDateTime = new DateTime(2020, 12, 3, 10, 14, 54),
                },
                new Transaction()
                {
                    TransactionId = 100004, RentalId = 100002,
                    PaymentStatus = PaymentStatus.Paid,
                    BookedStartDateTime = new DateTime(2020, 12, 3), BookedEndDateTime = new DateTime(2020, 12, 3),
                    ActualStartDateTime = new DateTime(2020, 12, 3, 8, 32, 54),
                    ActualEndDateTime = new DateTime(2020, 12, 3, 10, 14, 54),
                }
            };
        }
    }
}