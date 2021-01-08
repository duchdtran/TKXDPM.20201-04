namespace TKXDPM_API.Model
{
    public class DoubleBike : Bike
    {
        public override double CalculateFee(double minutes)
        {
            return CalculateBaseFee(minutes) * RateFee;
        }
    }
}