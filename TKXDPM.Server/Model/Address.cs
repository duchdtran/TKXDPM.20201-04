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

        public static List<Address> GetSeederData()
        {
            return new List<Address>
            {
                new Address() {AddressId = 1001, AddressName = "Phường Hạ Đình, Quận Thanh Xuân, TP Hà Nội", Latitude = 100, Longitude = 99},
                new Address() {AddressId = 1002, AddressName = "172 Lê Trọng Tấn, Thanh Xuân, Hà Nội", Latitude = 100, Longitude = 99},
                new Address() {AddressId = 1003, AddressName = "Lương Thế Vinh, Thanh Xuân, Hà Nội", Latitude = 100, Longitude = 99},
                new Address() {AddressId = 1004, AddressName = "Ngã tư Khuất Duy Tiến, Lê Văn Lương, Thanh Xuân, Hà Nội", Latitude = 100, Longitude = 99},
                new Address() {AddressId = 1005, AddressName = "57 Nguyễn Trãi, Thanh Xuân, Hà Nội", Latitude = 100, Longitude = 99},
                new Address() {AddressId = 1006, AddressName = "155 Trường Chinh, Khương Trung, Thanh Xuân, Hà Nội", Latitude = 100, Longitude = 99}
            };
        }
    }

    public class AddressResponse
    {
        public AddressResponse()
        {
            AddressName = "AddressName";
            Longitude = 10;
            Latitude = 10;
        }

        public string AddressName { get; set; }
        public float Longitude { get; set; }
        public float Latitude { get; set; }
    }
}