using System.Collections.Generic;
using TKXDPM_API.Model;

namespace TKXDPM_API.Seeder
{
    public static class StationSeeder
    {
         public static List<Station> GetSeederData()
        {
            return new List<Station>
            {
                new Station()
                {
                    StationId = 1001,
                    AddressId = 1001,
                    StationName = "Starbuck Ecopark",
                    ContactName = "Nguyễn Anh Dũng",
                    StationImage = "https://ecoparker.s3.ap-southeast-1.amazonaws.com/s3fs-public/styles/8_col/public/nha%20hang/starbucks-ecopark-13.jpg?itok=Pvth7skq",
                    Email = "aeon.ecopark@gmail.ccom",
                    Phone = "0906232138",
                    Area = 500
                },
                new Station()
                {
                    StationId = 1002,
                    AddressId = 1002,
                    ContactName = "Nguyễn Mạnh Hùng",
                    StationName = "Sân Golf Rừng Cọ - Ecopark",
                    StationImage = "http://ecoparksupport.com/wp-content/uploads/2020/05/san-golf-ecopark-1.jpg",
                    Email = "tennis.ecopark@gmail.com",
                    Phone = "0962610374",
                    Area = 500
                },
                new Station()
                {
                    StationId = 1003,
                    AddressId = 1003,
                    ContactName = "Ngọ Anh Cường",
                    StationName = "Công viên mùa xuân - Spring Park",
                    StationImage = "https://ecoparker.s3.ap-southeast-1.amazonaws.com/s3fs-public/pictures/cong-vien-ho-thien-nga-ecopark-1.jpg",
                    Email = "springpark.ecopark@gmail.com",
                    Phone = "0936656669",
                    Area = 500
                },
                new Station()
                {
                    StationId = 1004,
                    AddressId = 1004,
                    ContactName = "Vũ Hữu Đạt",
                    StationName = "Công viên mùa hạ",
                    StationImage = "https://ecoparker.s3.ap-southeast-1.amazonaws.com/choi/cong-vien-mua-ha-ecopark-02.jpg",
                    Email = "summerpark.ecopark@gmail.com",
                    Phone = "0466519528",
                    Area = 500
                },
                new Station()
                {
                    StationId = 1005,
                    AddressId = 1005,
                    ContactName = "Nguyễn Đình Thắng",
                    StationName = "Công viên mùa đông",
                    StationImage = "https://ecoparker.s3.ap-southeast-1.amazonaws.com/choi/cung-duong-ecopark-grand-10.jpg",
                    Email = "winterpark.ecopark@gmail.com",
                    Phone = "0987866389",
                    Area = 500
                },
                new Station()
                {
                    StationId = 1006,
                    AddressId = 1006,
                    ContactName = "Trương Anh Minh",
                    StationName = "Công viên mùa thu",
                    StationImage = "https://datvietvnn.com/wp-content/uploads/2020/05/cong-vien-mua-ha-ecopark.jpg",
                    Email = "autumpark.ecopark@gmail.com",
                    Phone = "0987866389",
                    Area = 500
                },
            };
        }
    }
}