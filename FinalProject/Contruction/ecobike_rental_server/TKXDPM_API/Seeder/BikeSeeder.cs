using System.Collections.Generic;
using TKXDPM_API.Model;

namespace TKXDPM_API.Seeder
{
    public static class BikeSeeder
    {
       public static List<Bike> GetSeederData()
        {
            return new List<Bike>
            {
                new Bike()
                {
                    BikeId = 100001,
                    BikeName = "Xe đạp đua Fornix F8",
                    BikeImage = "https://product.hstatic.net/1000119998/product/xe-dap-the-thao-fornix-f8-4_a07b9f357957448288df8630f0f4c55d_master.jpg",
                    Description =
                        "Với thiết kế mạnh mẽ đầy cá tính, FORNIX F8 còn mang đến cho bạn những trải nghiệm tốc độ của bộ truyền động đầy mạnh mẽ mới nhất từ thương hiệu SHIMANO.",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Single,
                    LicensePlates = "77A-0001",
                    BatterCapacity = 0,
                    PowerDrain = 0,
                    Deposit = 400000
                },
                new Bike()
                {
                    BikeId = 100002,
                    BikeName = "Xe đạp leo núi",
                    BikeImage="https://xedapthegioi.vn/wp-content/uploads/2017/06/xe-dap-the-thao-trinx-junior-1.0-2017-1.jpg",
                    Description =
                        "Xe Đạp Xe đạp leo núi Fat Bike của Đài Loan là một trong những chiếc xe độc đáo và mới lạ tại Việt Nam. Với đặc điểm chính là chiếc bánh xe khổng lồ tạo nên một chiếc xe khá lạ mắt.",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Single,
                    LicensePlates = "77A-0002",
                    BatterCapacity = 0,
                    PowerDrain = 0,
                    Deposit = 400000
                },
                new Bike()
                {
                    BikeId = 100003,
                    BikeName = "Xe đạp địa hình HaHoo",
                    BikeImage = "https://vn-test-11.slatic.net/p/276cb18780530b969e8b4121585c409e.jpg_800x800Q100.jpg",
                    Description =
                        "Xe đạp HaHoo: Khung sườn xe được làm bằng hợp kim thép không gỉ, đảm bảo độ chắn chắn cho xe, có thể chịu được tải trọng của 2 người lớn. Bánh xe cực kool 26 inchs dễ dàng di chuyển với cá tính cực ngầu trong mắt mọi người.",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Single,
                    LicensePlates = "77A-0003",
                    BatterCapacity = 0,
                    PowerDrain = 0,
                    Deposit = 400000
                },
                new Bike()
                {
                    BikeId = 100004,
                    BikeName = "Xe đạp đua Fornix F8",
                    BikeImage = "https://product.hstatic.net/1000119998/product/xe-dap-the-thao-fornix-f8-4_a07b9f357957448288df8630f0f4c55d_master.jpg",
                    Description =
                        "Với thiết kế mạnh mẽ đầy cá tính, FORNIX F8 còn mang đến cho bạn những trải nghiệm tốc độ của bộ truyền động đầy mạnh mẽ mới nhất từ thương hiệu SHIMANO.",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Single,
                    LicensePlates = "77A-0004",
                    BatterCapacity = 0,
                    PowerDrain = 0,
                    Deposit = 400000
                },
                new Bike()
                {
                    BikeId = 100005,
                    BikeName = "Xe đạp leo núi",
                    BikeImage="https://xedapthegioi.vn/wp-content/uploads/2017/06/xe-dap-the-thao-trinx-junior-1.0-2017-1.jpg",
                    Description =
                        "Xe Đạp Xe đạp leo núi Fat Bike của Đài Loan là một trong những chiếc xe độc đáo và mới lạ tại Việt Nam. Với đặc điểm chính là chiếc bánh xe khổng lồ tạo nên một chiếc xe khá lạ mắt.",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Single,
                    LicensePlates = "77A-0005",
                    BatterCapacity = 0,
                    PowerDrain = 0,
                    Deposit = 400000
                },
                new Bike()
                {
                    BikeId = 100006,
                    BikeName = "Xe đạp địa hình HaHoo",
                    BikeImage = "https://vn-test-11.slatic.net/p/276cb18780530b969e8b4121585c409e.jpg_800x800Q100.jpg",
                    Description =
                        "Xe đạp HaHoo: Khung sườn xe được làm bằng hợp kim thép không gỉ, đảm bảo độ chắn chắn cho xe, có thể chịu được tải trọng của 2 người lớn. Bánh xe cực kool 26 inchs dễ dàng di chuyển với cá tính cực ngầu trong mắt mọi người.",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Single,
                    LicensePlates = "77A-0006",
                    BatterCapacity = 0,
                    PowerDrain = 0,
                    Deposit = 400000
                },

                // Double
                new Bike()
                {
                    BikeId = 200001,
                    BikeName = "XE ĐẠP ĐÔI PAX 1-SPORT",
                    BikeImage="https://paxbikes.com/wp-content/uploads/2020/07/xe-dap-doi-pax-6s.jpg",
                    Description =
                        "Xe đạp đôi PAX 1B-SPORT màu xám có thể coi là một mẫu xe đạp đôi có thiết kế đẹp và ấn tượng của PAX kể từ trước tới nay. Ngoài thiết kế đẹp, mẫu xe đạp này còn được lắp ráp bởi các linh kiện có chất lượng tốt và đồng bộ. ",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Double,
                    LicensePlates = "88A-0001",
                    BatterCapacity = 0,
                    PowerDrain = 0,
                    Deposit = 550000
                },
                new Bike()
                {
                    BikeId = 200002,
                    BikeName = "Xe đạp đôi PAX-2B-SPORT",
                    BikeImage = "https://paxbikes.com/wp-content/uploads/2020/07/xe-dap-doi-pax-6b.jpg",
                    Description =
                        "Thiết kế mới và tạo nên sự khác biệt hoàn toàn của xe đạp đôi PAX là hệ thống Dĩa Líp cùng nằm một bên xe, kết nối trực tiếp với nhau từ người ngồi trước và sau, điều này giúp cho người ngồi trước và ngồi sau có thể đạp tự do, tạo nên sự dễ dàng và thỏa mái khi đạp xe đạp đôi.",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Double,
                    LicensePlates = "88A-0002",
                    BatterCapacity = 0,
                    PowerDrain = 0,
                    Deposit = 550000
                },
                new Bike()
                {
                    BikeId = 200003,
                    BikeName = "Xe đạp đôi PAX-2R-SPORT",
                    BikeImage = "https://paxbikes.com/wp-content/uploads/2020/07/xe-dap-doi-pax-6r.jpg",
                    Description =
                        "hiết kế mới và tạo nên sự khác biệt hoàn toàn của xe đạp đôi PAX là hệ thống Dĩa Líp cùng nằm một bên xe, kết nối trực tiếp với nhau từ người ngồi trước và sau, điều này giúp cho người ngồi trước và ngồi sau có thể đạp tự do, tạo nên sự dễ dàng và thỏa mái khi đạp xe đạp đôi.",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Double,
                    LicensePlates = "88A-0003",
                    BatterCapacity = 0,
                    PowerDrain = 0,
                    Deposit = 550000
                },
                new Bike()
                {
                    BikeId = 200004,
                    BikeName = "XE ĐẠP ĐÔI PAX 1-SPORT",
                    BikeImage="https://paxbikes.com/wp-content/uploads/2020/07/xe-dap-doi-pax-6s.jpg",
                    Description =
                        "Xe đạp đôi PAX 1B-SPORT màu xanh có thể coi là một mẫu xe đạp đôi có thiết kế đẹp và ấn tượng của PAX kể từ trước tới nay. Ngoài thiết kế đẹp, mẫu xe đạp này còn được lắp ráp bởi các linh kiện có chất lượng tốt và đồng bộ. ",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Double,
                    LicensePlates = "88A-0004",
                    BatterCapacity = 0,
                    PowerDrain = 0,
                    Deposit = 550000
                },
                new Bike()
                {
                    BikeId = 200005,
                    BikeName = "Xe đạp đôi PAX-2B-SPORT",
                    BikeImage = "https://paxbikes.com/wp-content/uploads/2020/07/xe-dap-doi-pax-6b.jpg",
                    Description =
                        "Thiết kế mới và tạo nên sự khác biệt hoàn toàn của xe đạp đôi PAX là hệ thống Dĩa Líp cùng nằm một bên xe, kết nối trực tiếp với nhau từ người ngồi trước và sau, điều này giúp cho người ngồi trước và ngồi sau có thể đạp tự do, tạo nên sự dễ dàng và thỏa mái khi đạp xe đạp đôi.",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Double,
                    LicensePlates = "88A-0005",
                    BatterCapacity = 0,
                    PowerDrain = 0,
                    Deposit = 550000
                },
                new Bike()
                {
                    BikeId = 200006,
                    BikeName = "Xe đạp đôi PAX-2R-SPORT",
                    BikeImage = "https://paxbikes.com/wp-content/uploads/2020/07/xe-dap-doi-pax-6r.jpg",
                    Description =
                        "hiết kế mới và tạo nên sự khác biệt hoàn toàn của xe đạp đôi PAX là hệ thống Dĩa Líp cùng nằm một bên xe, kết nối trực tiếp với nhau từ người ngồi trước và sau, điều này giúp cho người ngồi trước và ngồi sau có thể đạp tự do, tạo nên sự dễ dàng và thỏa mái khi đạp xe đạp đôi.",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Double,
                    LicensePlates = "88A-0006",
                    BatterCapacity = 0,
                    PowerDrain = 0,
                    Deposit = 550000
                },
                // Electric bike
                new Bike()
                {
                    BikeId = 300001,
                    BikeName = "Xe Đạp Điện Pega Bike Zinger",
                    BikeImage = "https://salt.tikicdn.com/cache/w444/ts/product/a0/d9/c7/1576226a1ee3c162d3d3c5ab441691ec.jpg",
                    Description =
                        "Bứt phá giới hạn của xe điện với 80km chỉ với 1 lần sạc .Động cơ mạnh mẽ, thỏa mãn những tay lái cừ khôi nhất.Cực kỳ an toàn nhờ phanh đĩa trước và lốp không săm.Tiết kiệm hơn 34 lần so với xe máy chạy xăng",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Electric,
                    LicensePlates = "99A-0001",
                    BatterCapacity = 90,
                    PowerDrain = 300,
                    Deposit = 700000
                },
                new Bike()
                {
                    BikeId = 300002,
                    BikeName = "Xe Đạp Điện Bluera Cap X 2019",
                    BikeImage = "https://dailyxedien.vn/wp-content/uploads/2020/02/xe-dap-dien-cap-x-pro-update-01-768x768.jpg",
                    Description =
                        "Xe đạp điện Cap X 2019 là sản phẩm độc quyền được thiết kế và sản xuất bởi Đại Lý Xe Điện Bluera Việt Nhật. Với kiểu dáng và các màu sắc nổi bật phù hợp với mọi đối tượng sử dụng, đặc biệt Cap X 2019 sẽ bật tung phong cách cá tính riêng của các bạn trẻ tràn đầy năng lượng.",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Electric,
                    LicensePlates = "99A-0002",
                    BatterCapacity = 100,
                    PowerDrain = 300,
                    Deposit = 700000
                },
                new Bike()
                {
                    BikeId = 300003,
                    BikeName = "Xe đạp điện homesheel FTN T5s",
                    BikeImage = "https://homesheel.com.vn/wp-content/uploads/2020/07/T5S_DEN.jpg",
                    Description =
                        "Xe điện thể thao gấp gọn Homesheel T5S vượt ra ngoài quy chuẩn thiết kế! Đẳng cấp và sang trọng tạo nên sự khác biết của NGHÀNH XE ĐIỆN",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Electric,
                    LicensePlates = "99A-0003",
                    BatterCapacity = 80,
                    PowerDrain = 300,
                    Deposit = 700000
                },
                new Bike()
                {
                    BikeId = 300004,
                    BikeName = "Xe Đạp Điện Pega Bike Zinger",
                    BikeImage = "https://salt.tikicdn.com/cache/w444/ts/product/a0/d9/c7/1576226a1ee3c162d3d3c5ab441691ec.jpg",
                    Description =
                        "Bứt phá giới hạn của xe điện với 80km chỉ với 1 lần sạc .Động cơ mạnh mẽ, thỏa mãn những tay lái cừ khôi nhất.Cực kỳ an toàn nhờ phanh đĩa trước và lốp không săm.Tiết kiệm hơn 34 lần so với xe máy chạy xăng",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Electric,
                    LicensePlates = "99A-0004",
                    BatterCapacity = 90,
                    PowerDrain = 300,
                    Deposit = 700000
                },
                new Bike()
                {
                    BikeId = 300005,
                    BikeName = "Xe Đạp Điện Bluera Cap X 2019",
                    BikeImage = "https://dailyxedien.vn/wp-content/uploads/2020/02/xe-dap-dien-cap-x-pro-update-01-768x768.jpg",
                    Description =
                        "Xe đạp điện Cap X 2019 là sản phẩm độc quyền được thiết kế và sản xuất bởi Đại Lý Xe Điện Bluera Việt Nhật. Với kiểu dáng và các màu sắc nổi bật phù hợp với mọi đối tượng sử dụng, đặc biệt Cap X 2019 sẽ bật tung phong cách cá tính riêng của các bạn trẻ tràn đầy năng lượng.",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Electric,
                    LicensePlates = "99A-0005",
                    BatterCapacity = 80,
                    PowerDrain = 300,
                    Deposit = 700000
                },
                new Bike()
                {
                    BikeId = 300006,
                    BikeName = "Xe đạp điện homesheel FTN T5s",
                    BikeImage = "https://homesheel.com.vn/wp-content/uploads/2020/07/T5S_DEN.jpg",
                    Description =
                        "Xe điện thể thao gấp gọn Homesheel T5S vượt ra ngoài quy chuẩn thiết kế! Đẳng cấp và sang trọng tạo nên sự khác biết của NGHÀNH XE ĐIỆN",
                    Size = 26,
                    StartingRent = 10000,
                    HourlyRent = 3000,
                    Type = BikeType.Electric,
                    LicensePlates = "99A-0006",
                    BatterCapacity = 80,
                    PowerDrain = 300,
                    Deposit = 700000
                }
            };
        }
    }
}