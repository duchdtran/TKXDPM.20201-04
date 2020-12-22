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
        private RentBikeController CreateController()
        {
            return new RentBikeController(BuildLogger<RentBikeController>(), BuildMapper() ,BuildContext("RentBikeController"));
        }
        
        [Test]
        public void TestRentSingleBike()
        {
            var controller = CreateController();
            var bike = new Bike()
            {
                Type = BikeType.Single
            };
            var deposit = 550000;
            var result = controller.CheckDeposit(deposit, bike);
            Assert.IsTrue(result);
        }

        [Test]
        public void TestRentDoubleBike()
        {
            var controller = CreateController();
            var bike = new Bike()
            {
                Type = BikeType.Double
            };
            var deposit = 700000;
            var result = controller.CheckDeposit(deposit, bike);
            Assert.IsTrue(result);
        }

        [Test]
        public void TestRentElectricBike()
        {
            var controller = CreateController();
            var bike = new Bike()
            {
                Type = BikeType.Electric
            };
            var deposit = 700000;
            var result = controller.CheckDeposit(deposit, bike);
            Assert.IsTrue(result);
        }

        [Test]
        public void TestRentSingleBikeFail()
        {
            var controller = CreateController();
            var bike = new Bike()
            {
                Type = BikeType.Single
            };
            var deposit = 549999;
            var result = controller.CheckDeposit(deposit, bike);
            Assert.IsFalse(result);
            
        }

        [Test]
        public void TestRentDoubleBikeFail()
        {
            var controller = CreateController();
            var bike = new Bike()
            {
                Type = BikeType.Double
            };
            var deposit = 699999;
            var result = controller.CheckDeposit(deposit, bike);
            Assert.IsFalse(result);
        }

        [Test]
        public void TestRentElectricBikeFail()
        {
            var controller = CreateController();
            var bike = new Bike()
            {
                Type = BikeType.Electric
            };
            var deposit = 699999;
            var result = controller.CheckDeposit(deposit, bike);
            Assert.IsFalse(result);
        }
    }
}