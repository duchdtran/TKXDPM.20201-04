using System.Diagnostics;
using Microsoft.Extensions.Logging;
using NUnit.Framework;
using TKXDPM_API;
using TKXDPM_API.Controllers;
using TKXDPM_API.Model;

namespace TKXDPM_Test
{
    public class RentBikeTest : BaseTest
    {
        [Test]
        public void TestRentSingleBike()
        {
            var bike = new Bike()
            {
                Type = BikeType.Single
            };
            var deposit = 400000;
            var result = bike.CheckDeposit(deposit);
            Assert.IsTrue(result);
        }

        [Test]
        public void TestRentDoubleBike()
        {
            var bike = new Bike()
            {
                Type = BikeType.Double
            };
            var deposit = 550000;
            var result = bike.CheckDeposit(deposit);
            Assert.IsTrue(result);
        }

        [Test]
        public void TestRentElectricBike()
        {
            var bike = new Bike()
            {
                Type = BikeType.Electric
            };
            var deposit = 700000;
            var result = bike.CheckDeposit(deposit);
            Assert.IsTrue(result);
        }

        [Test]
        public void TestRentSingleBikeFail()
        {
            var bike = new Bike()
            {
                Type = BikeType.Single
            };
            var deposit = 399999;
            var result = bike.CheckDeposit(deposit);
            Assert.IsFalse(result);
            
        }

        [Test]
        public void TestRentDoubleBikeFail()
        {
            var bike = new Bike()
            {
                Type = BikeType.Double
            };
            var deposit = 549999;
            var result = bike.CheckDeposit(deposit);
            Assert.IsFalse(result);
        }

        [Test]
        public void TestRentElectricBikeFail()
        {
            var bike = new Bike()
            {
                Type = BikeType.Electric
            };
            var deposit = 699999;
            var result = bike.CheckDeposit(deposit);
            Assert.IsFalse(result);
        }
    }
}