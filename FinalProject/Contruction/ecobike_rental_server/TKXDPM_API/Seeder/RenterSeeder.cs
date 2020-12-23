using System.Collections.Generic;
using TKXDPM_API.Model;

namespace TKXDPM_API.Seeder
{
    public static class RenterSeeder
    {
        public static List<Renter> GetSeederData()
        {
            return new List<Renter>
            {
                new Renter() {Name = "Group 4", RenterId = 100001, DeviceCode = "5c9a7697-1ab7-4025-a8b1-73eeed009893"},
                new Renter()
                    {Name = "Nguyễn Văn Linh", RenterId = 100002, DeviceCode = "eba903d4-3a38-4acf-a566-487f0bb21e8b"},
                new Renter()
                    {Name = "Phạm Huy Hoàng", RenterId = 100003, DeviceCode = "4e8eb23d-316d-48ae-8703-a28ca5fb9fd1"},
                new Renter()
                    {Name = "Trần Đình Đức", RenterId = 100004, DeviceCode = "b89570dd-9ae3-4317-b610-6de2b548764c"},
                new Renter()
                    {Name = "Vũ Duy Tiến", RenterId = 100005, DeviceCode = "8a09d153-e9c7-4a77-abc9-23b014cb3edc"},
                new Renter()
                    {Name = "Phạm Mạnh Cường", RenterId = 100006, DeviceCode = "2ade6a42-e744-4c3a-a9e8-263a47920f63"},
                new Renter()
                    {Name = "Trần Văn Tâm", RenterId = 100007, DeviceCode = "d8f539f4-14d9-43dc-ad81-40def84cc26e"},
                new Renter()
                    {Name = "Khổng Hoàng Phong", RenterId = 100008, DeviceCode = "3c063b4d-2986-4591-8ee5-7116e9c17f79"}
            };
        }

    }
}