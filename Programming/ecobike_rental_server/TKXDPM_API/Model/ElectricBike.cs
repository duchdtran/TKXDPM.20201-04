namespace TKXDPM_API.Model
{
    public class ElectricBike : Bike
    {
        private static readonly double RateFee = 1.5;
        
        public override double CalculateFee(double minutes)
        {
            return CalculateBaseFee(minutes) * RateFee;
        }
    }
}