using System;
using System.Collections.Generic;
using TKXDPM_API.Model;

namespace TKXDPM_API.Seeder
{
    public static class CardSeeder
    {
        public static List<Card> GetSeederData()
        {
            return new List<Card>
            {
                new Card()
                {
                    CardId = 100001, CardCode = "118609_group4_2020", RenterId = 100001,
                    PaymentMethod = "PaymentMethod", Cvv = 228, ExpirationDate = new DateTime(2020, 11, 25)
                },
                new Card()
                {
                    CardId = 100002, CardCode = "118609_group5_2020", RenterId = 100002,
                    PaymentMethod = "PaymentMethod", Cvv = 234, ExpirationDate = new DateTime(2020, 11, 25)
                },
                new Card()
                {
                    CardId = 100003, CardCode = "118609_group6_2020", RenterId = 100003,
                    PaymentMethod = "PaymentMethod", Cvv = 563, ExpirationDate = new DateTime(2020, 11, 25)
                },
                new Card()
                {
                    CardId = 100004, CardCode = "118609_group7_2020", RenterId = 100004,
                    PaymentMethod = "PaymentMethod", Cvv = 463, ExpirationDate = new DateTime(2020, 11, 25)
                },
                new Card()
                {
                    CardId = 100005, CardCode = "118609_group8_2020", RenterId = 100005,
                    PaymentMethod = "PaymentMethod", Cvv = 263, ExpirationDate = new DateTime(2020, 11, 25)
                },
                new Card()
                {
                    CardId = 100006, CardCode = "118609_group9_2020", RenterId = 100006,
                    PaymentMethod = "PaymentMethod", Cvv = 262, ExpirationDate = new DateTime(2020, 11, 25)
                }
            };
        }
    }
}