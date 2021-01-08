using TKXDPM_API.Model;

namespace TKXDPM_API.Controllers.CalculateFee
{
    public interface ICalculateFee
    {
        public abstract int CalculateFee(double minutes, BikeType type);
    }
}