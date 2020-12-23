using Microsoft.Extensions.Logging;
using NUnit.Framework;
using TKXDPM_API.Controllers;
using TKXDPM_API.Model;

namespace TKXDPM_Test
{
    public class CalculateFeeTest : BaseTest
    {
        private ReturnBikeController CreateController()
        {
            return new ReturnBikeController(BuildLogger<ReturnBikeController>(), BuildContext("ReturnBikeController"));
        }
        
        [Test]
        public void TestCalculateFee1()
        {
            var controller = CreateController();
            var result = controller.CalculateFee(9, BikeType.Single);
            Assert.AreEqual(0, result);
        }
        
        [Test]
        public void TestCalculateFee2()
        {
            var controller = CreateController();
            var result = controller.CalculateFee(9, BikeType.Electric);
            Assert.AreEqual(0, result);
        }
        
        [Test]
        public void TestCalculateFee3()
        {
            var controller = CreateController();
            var result = controller.CalculateFee(9, BikeType.Double);
            Assert.AreEqual(0, result);
        }
        
        [Test]
        public void TestCalculateFee4()
        {
            var controller = CreateController();
            var result = controller.CalculateFee(11, BikeType.Double);
            Assert.AreEqual(15000, result);
        }
        
        [Test]
        public void TestCalculateFee5()
        {
            var controller = CreateController();
            var result = controller.CalculateFee(11, BikeType.Electric);
            Assert.AreEqual(15000, result);
        }
        
        [Test]
        public void TestCalculateFee6()
        {
            var controller = CreateController();
            var result = controller.CalculateFee(11, BikeType.Single);
            Assert.AreEqual(10000, result);
        }
        
        [Test]
        public void TestCalculateFee7()
        {
            var controller = CreateController();
            var result = controller.CalculateFee(31, BikeType.Double);
            Assert.AreEqual(19500, result);
        }
        
        [Test]
        public void TestCalculateFee8()
        {
            var controller = CreateController();
            var result = controller.CalculateFee(31, BikeType.Electric);
            Assert.AreEqual(19500, result);
        }
        
        [Test]
        public void TestCalculateFee9()
        {
            var controller = CreateController();
            var result = controller.CalculateFee(31, BikeType.Single);
            Assert.AreEqual(13000, result);
        }
        
        [Test]
        public void TestCalculateFee10()
        {
            var controller = CreateController();
            var result = controller.CalculateFee(46, BikeType.Double);
            Assert.AreEqual(24000, result);
        }
        
        [Test]
        public void TestCalculateFee11()
        {
            var controller = CreateController();
            var result = controller.CalculateFee(46, BikeType.Electric);
            Assert.AreEqual(24000, result);
        }
        
        [Test]
        public void TestCalculateFee12()
        {
            var controller = CreateController();
            var result = controller.CalculateFee(46, BikeType.Single);
            Assert.AreEqual(16000, result);
        }
    }
}