using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TKXDPM_API.Model
{
    public class Address
    {
        [Key] public int AddressId { get; set; }
        [Column(TypeName = "varchar(255)")] public string AddressName { get; set; }
        public float Longitude { get; set; }
        public float Latitude { get; set; }
    }

    public class AddressResponse
    {
        public string AddressName { get; set; }
        public float Longitude { get; set; }
        public float Latitude { get; set; }
    }
}