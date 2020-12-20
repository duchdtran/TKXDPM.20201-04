// using System;
// using System.Diagnostics;
// using System.Linq;
// using System.Threading.Tasks;
// using Microsoft.AspNetCore.Mvc;
// using Microsoft.EntityFrameworkCore;
// using Microsoft.Extensions.Logging;
// using NUnit.Framework;
// using TKXDPM_API;
// using TKXDPM_API.Controllers;
// using TKXDPM_API.Model;
//
// namespace TKXDPM_Test
// {
//     public class ControllerTest : BaseTest
//     {
//         [Test]
//         public async Task TestAddPaymentMethod()
//         {
//             var dbName = Guid.NewGuid().ToString();
//             var context = BuildContext(dbName);
//             var mapper = BuildMapper();
//             var logger = new Logger<EcoBikeRentalController>(new LoggerFactory());
//             var form = new EcoBikeRentalController.AddPaymentMethodForm()
//             {
//                 DeviceCode = "1",
//                 CardCode = "2",
//                 PaymentMethod = "PaymentMethod1",
//                 Cvv = 100,
//                 ExpirationDate = new DateTime(2020, 10, 20)
//             };
//             var controller = new EcoBikeRentalController(logger, mapper, context);
//             var response = await controller.AddPaymentMethod(form);
//             var cards = context.Cards.ToList();
//             var result = response as StatusCodeResult;
//
//             Debug.Assert(result != null, nameof(result) + " != null");
//             Assert.IsTrue(200 == result.StatusCode);
//             Assert.IsTrue(cards.Count == 1);
//             Assert.IsTrue(cards[0].PaymentMethod == form.PaymentMethod);
//             Assert.IsTrue(cards[0].Cvv == form.Cvv);
//             Assert.IsTrue(cards[0].ExpirationDate == form.ExpirationDate);
//         }
//
//         [Test]
//         public async Task TestRentBike()
//         {
//             var dbName = Guid.NewGuid().ToString();
//             var context = BuildContext(dbName);
//             var mapper = BuildMapper();
//             var logger = new Logger<EcoBikeRentalController>(new LoggerFactory());
//             context.Add(new Renter()
//             {
//                 RenterId = 1,
//                 Name = "userId1-Name"
//             });
//             context.Add(new Station()
//             {
//                 StationId = 1
//             });
//             context.Add(new Bike()
//             {
//                 BikeId = 1
//             });
//             var bikeInStation = new BikeInStation()
//             {
//                 BikeId = 1,
//                 StationId = 1
//             };
//             context.Add(bikeInStation);
//             await context.SaveChangesAsync();
//
//             var controller = new EcoBikeRentalController(logger, mapper, context);
//
//             var response = await controller.RentBike("userId1", 1);
//
//             var result = response as StatusCodeResult;
//             Debug.Assert(result != null, nameof(result) + " != null");
//
//             Assert.IsTrue(200 == result.StatusCode);
//             var exists = await context.BikeInStations.AnyAsync(bikeInStationTest =>
//                 bikeInStationTest.BikeId == 1 && bikeInStationTest.StationId == 1);
//             Assert.IsTrue(exists == false);
//             var rental = context.Rentals.Where(r => r.RenterId == 1 && r.BikeId == 1).ToList();
//             Assert.IsTrue(rental.Count == 1);
//         }
//         
//         [Test]
//         public async Task TestRentBikeWithoutDate()
//         {
//             var dbName = Guid.NewGuid().ToString();
//             var context = BuildContext(dbName);
//             var mapper = BuildMapper();
//             var logger = new Logger<EcoBikeRentalController>(new LoggerFactory());
//
//             var controller = new EcoBikeRentalController(logger, mapper, context);
//
//             var response = await controller.RentBike("userId1", 1);
//
//             var result = response as StatusCodeResult;
//             Debug.Assert(result != null, nameof(result) + " != null");
//
//             Assert.IsTrue(200 == result.StatusCode);
//             var exists = await context.BikeInStations.AnyAsync(bikeInStationTest =>
//                 bikeInStationTest.BikeId == 1 && bikeInStationTest.StationId == 1);
//             Assert.IsTrue(exists == false);
//             var rental = context.Rentals.Where(r => r.RenterId == 1 && r.BikeId == 1).ToList();
//             Assert.IsTrue(rental.Count == 1);
//         }
//
//     }
// } 