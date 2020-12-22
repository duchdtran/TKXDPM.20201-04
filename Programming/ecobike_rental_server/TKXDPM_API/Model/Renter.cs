using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TKXDPM_API.Model
{
    public class Renter
    {
        public Renter()
        {
            RenterId = 20175004;
            Name = "Nguyen Van Cao";
        }

        [Key] public int RenterId { get; set; }
        [Column(TypeName = "varchar(255)")] public string Name { get; set; }
        [Column(TypeName = "varchar(255)")] public string DeviceCode { get; set; }
        public List<Rental> Rentals { get; set; }
        public Card Card { get; set; }
    }

    public class RenterResponse
    {
        public RenterResponse()
        {
            RenterId = 1;
            DeviceCode = "1011-5004";
            Name = "Nguyen Van Cao";
        }

        public int RenterId { get; set; }
        public string Name { get; set; }
        public string DeviceCode { get; set; }
    }
}