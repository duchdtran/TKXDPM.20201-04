using System.Collections.Generic;
using TKXDPM_API.Model;

namespace TKXDPM_API.Seeder
{
    public static class AddressSeeder
    {
        public static List<Address> GetSeederData()
        {
            return new List<Address>
            {
                new Address()
                {
                    AddressId = 1001, AddressName = "Phường Hạ Đình, Quận Thanh Xuân, TP Hà Nội", Latitude = 100,
                    Longitude = 99
                },
                new Address()
                {
                    AddressId = 1002, AddressName = "172 Lê Trọng Tấn, Thanh Xuân, Hà Nội", Latitude = 100,
                    Longitude = 99
                },
                new Address()
                {
                    AddressId = 1003, AddressName = "Lương Thế Vinh, Thanh Xuân, Hà Nội", Latitude = 100, Longitude = 99
                },
                new Address()
                {
                    AddressId = 1004, AddressName = "Ngã tư Khuất Duy Tiến, Lê Văn Lương, Thanh Xuân, Hà Nội",
                    Latitude = 100, Longitude = 99
                },
                new Address()
                {
                    AddressId = 1005, AddressName = "57 Nguyễn Trãi, Thanh Xuân, Hà Nội", Latitude = 100, Longitude = 99
                },
                new Address()
                {
                    AddressId = 1006, AddressName = "155 Trường Chinh, Khương Trung, Thanh Xuân, Hà Nội",
                    Latitude = 100, Longitude = 99
                }
            };
        }
    }
}