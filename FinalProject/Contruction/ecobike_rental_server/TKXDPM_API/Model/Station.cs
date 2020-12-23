using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TKXDPM_API.Model
{
    public class Station
    {
        [Key] public int StationId { get; set; }

        [Column(TypeName = "varchar(255)")] public string StationName { get; set; }
        [Column(TypeName = "varchar(512)")] public string StationImage { get; set; }
        public int AddressId { get; set; }
        public Address Address { get; set; }
        [Column(TypeName = "varchar(255)")] public string ContactName { get; set; }
        [Column(TypeName = "varchar(255)")] public string Email { get; set; }
        [Column(TypeName = "varchar(255)")] public string Phone { get; set; }
        public float Area { get; set; }

        public List<BikeInStation> BikeInStations { get; set; }
    }

    public class StationResponse
    {
        public StationResponse()
        {
            StationId = 1;
            AddressId = 1;
            StationName = "StationName";
            StationImage = "StationImage";
            ContactName = "ContactName";
            Email = "Email";
            Phone = "Phone";
            Address = new AddressResponse();
            ListBike = new List<BikeResponse>()
            {
                new BikeResponse(),
                new BikeResponse(),
                new BikeResponse()
            };
            Area = 10.5F;
        }

        public int StationId { get; set; }
        public int AddressId { get; set; }
        public string StationName { get; set; }
        public string StationImage { get; set; }
        public string ContactName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public float Area { get; set; }
        public AddressResponse Address { get; set; }
        public List<BikeResponse> ListBike { get; set; }
    }
}