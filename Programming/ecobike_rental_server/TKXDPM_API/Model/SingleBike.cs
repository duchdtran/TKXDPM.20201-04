namespace TKXDPM_API.Model
{
    public class SingleBike : Bike
    {
        private static readonly double RateFee = 1;
        
        public override double CalculateFee(double minutes)
        {
            return CalculateBaseFee(minutes) * RateFee;
        }
    }
}