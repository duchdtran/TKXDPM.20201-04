using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

namespace TKXDPM_API.Migrations
{
    public partial class test : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Addresses",
                columns: table => new
                {
                    AddressId = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    AddressName = table.Column<string>(type: "varchar(255)", nullable: true),
                    Longitude = table.Column<float>(type: "real", nullable: false),
                    Latitude = table.Column<float>(type: "real", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Addresses", x => x.AddressId);
                });

            migrationBuilder.CreateTable(
                name: "Bikes",
                columns: table => new
                {
                    BikeId = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    BikeName = table.Column<string>(type: "varchar(255)", nullable: true),
                    BikeImage = table.Column<string>(type: "varchar(512)", nullable: true),
                    Description = table.Column<string>(type: "text", nullable: true),
                    Size = table.Column<int>(type: "integer", nullable: false),
                    StartingRent = table.Column<int>(type: "integer", nullable: false),
                    HourlyRent = table.Column<int>(type: "integer", nullable: false),
                    Type = table.Column<int>(type: "integer", nullable: false),
                    LicensePlates = table.Column<string>(type: "varchar(255)", nullable: true),
                    BatterCapacity = table.Column<int>(type: "integer", nullable: false),
                    PowerDrain = table.Column<float>(type: "real", nullable: false),
                    Deposit = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Bikes", x => x.BikeId);
                });

            migrationBuilder.CreateTable(
                name: "Renters",
                columns: table => new
                {
                    RenterId = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    Name = table.Column<string>(type: "varchar(255)", nullable: true),
                    DeviceCode = table.Column<string>(type: "varchar(255)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Renters", x => x.RenterId);
                });

            migrationBuilder.CreateTable(
                name: "Stations",
                columns: table => new
                {
                    StationId = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    StationName = table.Column<string>(type: "varchar(255)", nullable: true),
                    StationImage = table.Column<string>(type: "varchar(512)", nullable: true),
                    AddressId = table.Column<int>(type: "integer", nullable: false),
                    ContactName = table.Column<string>(type: "varchar(255)", nullable: true),
                    Email = table.Column<string>(type: "varchar(255)", nullable: true),
                    Phone = table.Column<string>(type: "varchar(255)", nullable: true),
                    Area = table.Column<float>(type: "real", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Stations", x => x.StationId);
                    table.ForeignKey(
                        name: "FK_Stations_Addresses_AddressId",
                        column: x => x.AddressId,
                        principalTable: "Addresses",
                        principalColumn: "AddressId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Cards",
                columns: table => new
                {
                    CardId = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    CardCode = table.Column<string>(type: "varchar(255)", nullable: true),
                    RenterId = table.Column<int>(type: "integer", nullable: false),
                    PaymentMethod = table.Column<string>(type: "varchar(255)", nullable: true),
                    Cvv = table.Column<int>(type: "integer", nullable: false),
                    ExpirationDate = table.Column<DateTime>(type: "timestamp without time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Cards", x => x.CardId);
                    table.ForeignKey(
                        name: "FK_Cards_Renters_RenterId",
                        column: x => x.RenterId,
                        principalTable: "Renters",
                        principalColumn: "RenterId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "BikeInStations",
                columns: table => new
                {
                    StationId = table.Column<int>(type: "integer", nullable: false),
                    BikeId = table.Column<int>(type: "integer", nullable: false),
                    DateTimeIn = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    DateTimeOut = table.Column<DateTime>(type: "timestamp without time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BikeInStations", x => new { x.BikeId, x.StationId });
                    table.ForeignKey(
                        name: "FK_BikeInStations_Bikes_BikeId",
                        column: x => x.BikeId,
                        principalTable: "Bikes",
                        principalColumn: "BikeId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_BikeInStations_Stations_StationId",
                        column: x => x.StationId,
                        principalTable: "Stations",
                        principalColumn: "StationId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Rentals",
                columns: table => new
                {
                    RentalId = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    BikeId = table.Column<int>(type: "integer", nullable: false),
                    CardId = table.Column<int>(type: "integer", nullable: false),
                    RenterId = table.Column<int>(type: "integer", nullable: false),
                    RateContent = table.Column<string>(type: "varchar(255)", nullable: true),
                    RateNumber = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Rentals", x => x.RentalId);
                    table.ForeignKey(
                        name: "FK_Rentals_Bikes_BikeId",
                        column: x => x.BikeId,
                        principalTable: "Bikes",
                        principalColumn: "BikeId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Rentals_Cards_CardId",
                        column: x => x.CardId,
                        principalTable: "Cards",
                        principalColumn: "CardId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Rentals_Renters_RenterId",
                        column: x => x.RenterId,
                        principalTable: "Renters",
                        principalColumn: "RenterId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Transactions",
                columns: table => new
                {
                    TransactionId = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    RentalId = table.Column<int>(type: "integer", nullable: false),
                    PaymentStatus = table.Column<int>(type: "integer", nullable: false),
                    BookedStartDateTime = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    BookedEndDateTime = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    ActualStartDateTime = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    ActualEndDateTime = table.Column<DateTime>(type: "timestamp without time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Transactions", x => x.TransactionId);
                    table.ForeignKey(
                        name: "FK_Transactions_Rentals_RentalId",
                        column: x => x.RentalId,
                        principalTable: "Rentals",
                        principalColumn: "RentalId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Addresses",
                columns: new[] { "AddressId", "AddressName", "Latitude", "Longitude" },
                values: new object[,]
                {
                    { 1001, "Phường Hạ Đình, Quận Thanh Xuân, TP Hà Nội", 100f, 99f },
                    { 1002, "172 Lê Trọng Tấn, Thanh Xuân, Hà Nội", 100f, 99f },
                    { 1003, "Lương Thế Vinh, Thanh Xuân, Hà Nội", 100f, 99f },
                    { 1004, "Ngã tư Khuất Duy Tiến, Lê Văn Lương, Thanh Xuân, Hà Nội", 100f, 99f },
                    { 1005, "57 Nguyễn Trãi, Thanh Xuân, Hà Nội", 100f, 99f },
                    { 1006, "155 Trường Chinh, Khương Trung, Thanh Xuân, Hà Nội", 100f, 99f }
                });

            migrationBuilder.InsertData(
                table: "Bikes",
                columns: new[] { "BikeId", "BatterCapacity", "BikeImage", "BikeName", "Deposit", "Description", "HourlyRent", "LicensePlates", "PowerDrain", "Size", "StartingRent", "Type" },
                values: new object[,]
                {
                    { 300006, 80, "https://homesheel.com.vn/wp-content/uploads/2020/07/T5S_DEN.jpg", "Xe đạp điện homesheel FTN T5s", 700000, "Xe điện thể thao gấp gọn Homesheel T5S vượt ra ngoài quy chuẩn thiết kế! Đẳng cấp và sang trọng tạo nên sự khác biết của NGHÀNH XE ĐIỆN", 3000, "99A-0006", 300f, 26, 10000, 3 },
                    { 300005, 80, "https://dailyxedien.vn/wp-content/uploads/2020/02/xe-dap-dien-cap-x-pro-update-01-768x768.jpg", "Xe Đạp Điện Bluera Cap X 2019", 700000, "Xe đạp điện Cap X 2019 là sản phẩm độc quyền được thiết kế và sản xuất bởi Đại Lý Xe Điện Bluera Việt Nhật. Với kiểu dáng và các màu sắc nổi bật phù hợp với mọi đối tượng sử dụng, đặc biệt Cap X 2019 sẽ bật tung phong cách cá tính riêng của các bạn trẻ tràn đầy năng lượng.", 3000, "99A-0005", 300f, 26, 10000, 3 },
                    { 300004, 90, "https://salt.tikicdn.com/cache/w444/ts/product/a0/d9/c7/1576226a1ee3c162d3d3c5ab441691ec.jpg", "Xe Đạp Điện Pega Bike Zinger", 700000, "Bứt phá giới hạn của xe điện với 80km chỉ với 1 lần sạc .Động cơ mạnh mẽ, thỏa mãn những tay lái cừ khôi nhất.Cực kỳ an toàn nhờ phanh đĩa trước và lốp không săm.Tiết kiệm hơn 34 lần so với xe máy chạy xăng", 3000, "99A-0004", 300f, 26, 10000, 3 },
                    { 300003, 80, "https://homesheel.com.vn/wp-content/uploads/2020/07/T5S_DEN.jpg", "Xe đạp điện homesheel FTN T5s", 700000, "Xe điện thể thao gấp gọn Homesheel T5S vượt ra ngoài quy chuẩn thiết kế! Đẳng cấp và sang trọng tạo nên sự khác biết của NGHÀNH XE ĐIỆN", 3000, "99A-0003", 300f, 26, 10000, 3 },
                    { 300002, 100, "https://dailyxedien.vn/wp-content/uploads/2020/02/xe-dap-dien-cap-x-pro-update-01-768x768.jpg", "Xe Đạp Điện Bluera Cap X 2019", 700000, "Xe đạp điện Cap X 2019 là sản phẩm độc quyền được thiết kế và sản xuất bởi Đại Lý Xe Điện Bluera Việt Nhật. Với kiểu dáng và các màu sắc nổi bật phù hợp với mọi đối tượng sử dụng, đặc biệt Cap X 2019 sẽ bật tung phong cách cá tính riêng của các bạn trẻ tràn đầy năng lượng.", 3000, "99A-0002", 300f, 26, 10000, 3 },
                    { 300001, 90, "https://salt.tikicdn.com/cache/w444/ts/product/a0/d9/c7/1576226a1ee3c162d3d3c5ab441691ec.jpg", "Xe Đạp Điện Pega Bike Zinger", 700000, "Bứt phá giới hạn của xe điện với 80km chỉ với 1 lần sạc .Động cơ mạnh mẽ, thỏa mãn những tay lái cừ khôi nhất.Cực kỳ an toàn nhờ phanh đĩa trước và lốp không săm.Tiết kiệm hơn 34 lần so với xe máy chạy xăng", 3000, "99A-0001", 300f, 26, 10000, 3 },
                    { 200006, 0, "https://paxbikes.com/wp-content/uploads/2020/07/xe-dap-doi-pax-6r.jpg", "Xe đạp đôi PAX-2R-SPORT", 550000, "hiết kế mới và tạo nên sự khác biệt hoàn toàn của xe đạp đôi PAX là hệ thống Dĩa Líp cùng nằm một bên xe, kết nối trực tiếp với nhau từ người ngồi trước và sau, điều này giúp cho người ngồi trước và ngồi sau có thể đạp tự do, tạo nên sự dễ dàng và thỏa mái khi đạp xe đạp đôi.", 3000, "88A-0006", 0f, 26, 10000, 2 },
                    { 200005, 0, "https://paxbikes.com/wp-content/uploads/2020/07/xe-dap-doi-pax-6b.jpg", "Xe đạp đôi PAX-2B-SPORT", 550000, "Thiết kế mới và tạo nên sự khác biệt hoàn toàn của xe đạp đôi PAX là hệ thống Dĩa Líp cùng nằm một bên xe, kết nối trực tiếp với nhau từ người ngồi trước và sau, điều này giúp cho người ngồi trước và ngồi sau có thể đạp tự do, tạo nên sự dễ dàng và thỏa mái khi đạp xe đạp đôi.", 3000, "88A-0005", 0f, 26, 10000, 2 },
                    { 200004, 0, "https://paxbikes.com/wp-content/uploads/2020/07/xe-dap-doi-pax-6s.jpg", "XE ĐẠP ĐÔI PAX 1-SPORT", 550000, "Xe đạp đôi PAX 1B-SPORT màu xanh có thể coi là một mẫu xe đạp đôi có thiết kế đẹp và ấn tượng của PAX kể từ trước tới nay. Ngoài thiết kế đẹp, mẫu xe đạp này còn được lắp ráp bởi các linh kiện có chất lượng tốt và đồng bộ. ", 3000, "88A-0004", 0f, 26, 10000, 2 },
                    { 100001, 0, "https://product.hstatic.net/1000119998/product/xe-dap-the-thao-fornix-f8-4_a07b9f357957448288df8630f0f4c55d_master.jpg", "Xe đạp đua Fornix F8", 400000, "Với thiết kế mạnh mẽ đầy cá tính, FORNIX F8 còn mang đến cho bạn những trải nghiệm tốc độ của bộ truyền động đầy mạnh mẽ mới nhất từ thương hiệu SHIMANO.", 3000, "77A-0001", 0f, 26, 10000, 1 },
                    { 200002, 0, "https://paxbikes.com/wp-content/uploads/2020/07/xe-dap-doi-pax-6b.jpg", "Xe đạp đôi PAX-2B-SPORT", 550000, "Thiết kế mới và tạo nên sự khác biệt hoàn toàn của xe đạp đôi PAX là hệ thống Dĩa Líp cùng nằm một bên xe, kết nối trực tiếp với nhau từ người ngồi trước và sau, điều này giúp cho người ngồi trước và ngồi sau có thể đạp tự do, tạo nên sự dễ dàng và thỏa mái khi đạp xe đạp đôi.", 3000, "88A-0002", 0f, 26, 10000, 2 },
                    { 200001, 0, "https://paxbikes.com/wp-content/uploads/2020/07/xe-dap-doi-pax-6s.jpg", "XE ĐẠP ĐÔI PAX 1-SPORT", 550000, "Xe đạp đôi PAX 1B-SPORT màu xám có thể coi là một mẫu xe đạp đôi có thiết kế đẹp và ấn tượng của PAX kể từ trước tới nay. Ngoài thiết kế đẹp, mẫu xe đạp này còn được lắp ráp bởi các linh kiện có chất lượng tốt và đồng bộ. ", 3000, "88A-0001", 0f, 26, 10000, 2 },
                    { 100006, 0, "https://vn-test-11.slatic.net/p/276cb18780530b969e8b4121585c409e.jpg_800x800Q100.jpg", "Xe đạp địa hình HaHoo", 400000, "Xe đạp HaHoo: Khung sườn xe được làm bằng hợp kim thép không gỉ, đảm bảo độ chắn chắn cho xe, có thể chịu được tải trọng của 2 người lớn. Bánh xe cực kool 26 inchs dễ dàng di chuyển với cá tính cực ngầu trong mắt mọi người.", 3000, "77A-0006", 0f, 26, 10000, 1 },
                    { 100005, 0, "https://xedapthegioi.vn/wp-content/uploads/2017/06/xe-dap-the-thao-trinx-junior-1.0-2017-1.jpg", "Xe đạp leo núi", 400000, "Xe Đạp Xe đạp leo núi Fat Bike của Đài Loan là một trong những chiếc xe độc đáo và mới lạ tại Việt Nam. Với đặc điểm chính là chiếc bánh xe khổng lồ tạo nên một chiếc xe khá lạ mắt.", 3000, "77A-0005", 0f, 26, 10000, 1 },
                    { 100004, 0, "https://product.hstatic.net/1000119998/product/xe-dap-the-thao-fornix-f8-4_a07b9f357957448288df8630f0f4c55d_master.jpg", "Xe đạp đua Fornix F8", 400000, "Với thiết kế mạnh mẽ đầy cá tính, FORNIX F8 còn mang đến cho bạn những trải nghiệm tốc độ của bộ truyền động đầy mạnh mẽ mới nhất từ thương hiệu SHIMANO.", 3000, "77A-0004", 0f, 26, 10000, 1 },
                    { 100003, 0, "https://vn-test-11.slatic.net/p/276cb18780530b969e8b4121585c409e.jpg_800x800Q100.jpg", "Xe đạp địa hình HaHoo", 400000, "Xe đạp HaHoo: Khung sườn xe được làm bằng hợp kim thép không gỉ, đảm bảo độ chắn chắn cho xe, có thể chịu được tải trọng của 2 người lớn. Bánh xe cực kool 26 inchs dễ dàng di chuyển với cá tính cực ngầu trong mắt mọi người.", 3000, "77A-0003", 0f, 26, 10000, 1 },
                    { 100002, 0, "https://xedapthegioi.vn/wp-content/uploads/2017/06/xe-dap-the-thao-trinx-junior-1.0-2017-1.jpg", "Xe đạp leo núi", 400000, "Xe Đạp Xe đạp leo núi Fat Bike của Đài Loan là một trong những chiếc xe độc đáo và mới lạ tại Việt Nam. Với đặc điểm chính là chiếc bánh xe khổng lồ tạo nên một chiếc xe khá lạ mắt.", 3000, "77A-0002", 0f, 26, 10000, 1 },
                    { 200003, 0, "https://paxbikes.com/wp-content/uploads/2020/07/xe-dap-doi-pax-6r.jpg", "Xe đạp đôi PAX-2R-SPORT", 550000, "hiết kế mới và tạo nên sự khác biệt hoàn toàn của xe đạp đôi PAX là hệ thống Dĩa Líp cùng nằm một bên xe, kết nối trực tiếp với nhau từ người ngồi trước và sau, điều này giúp cho người ngồi trước và ngồi sau có thể đạp tự do, tạo nên sự dễ dàng và thỏa mái khi đạp xe đạp đôi.", 3000, "88A-0003", 0f, 26, 10000, 2 }
                });

            migrationBuilder.InsertData(
                table: "Renters",
                columns: new[] { "RenterId", "DeviceCode", "Name" },
                values: new object[,]
                {
                    { 100006, "2ade6a42-e744-4c3a-a9e8-263a47920f63", "Phạm Mạnh Cường" },
                    { 100005, "8a09d153-e9c7-4a77-abc9-23b014cb3edc", "Vũ Duy Tiến" },
                    { 100004, "b89570dd-9ae3-4317-b610-6de2b548764c", "Trần Đình Đức" },
                    { 100007, "d8f539f4-14d9-43dc-ad81-40def84cc26e", "Trần Văn Tâm" },
                    { 100002, "eba903d4-3a38-4acf-a566-487f0bb21e8b", "Nguyễn Văn Linh" },
                    { 100001, "5c9a7697-1ab7-4025-a8b1-73eeed009893", "Group 4" },
                    { 100003, "4e8eb23d-316d-48ae-8703-a28ca5fb9fd1", "Phạm Huy Hoàng" },
                    { 100008, "3c063b4d-2986-4591-8ee5-7116e9c17f79", "Khổng Hoàng Phong" }
                });

            migrationBuilder.InsertData(
                table: "Cards",
                columns: new[] { "CardId", "CardCode", "Cvv", "ExpirationDate", "PaymentMethod", "RenterId" },
                values: new object[,]
                {
                    { 100001, "118609_group4_2020", 228, new DateTime(2020, 11, 25, 0, 0, 0, 0, DateTimeKind.Unspecified), "PaymentMethod", 100001 },
                    { 100002, "118609_group5_2020", 234, new DateTime(2020, 11, 25, 0, 0, 0, 0, DateTimeKind.Unspecified), "PaymentMethod", 100002 },
                    { 100003, "118609_group6_2020", 563, new DateTime(2020, 11, 25, 0, 0, 0, 0, DateTimeKind.Unspecified), "PaymentMethod", 100003 },
                    { 100004, "118609_group7_2020", 463, new DateTime(2020, 11, 25, 0, 0, 0, 0, DateTimeKind.Unspecified), "PaymentMethod", 100004 },
                    { 100005, "118609_group8_2020", 263, new DateTime(2020, 11, 25, 0, 0, 0, 0, DateTimeKind.Unspecified), "PaymentMethod", 100005 },
                    { 100006, "118609_group9_2020", 262, new DateTime(2020, 11, 25, 0, 0, 0, 0, DateTimeKind.Unspecified), "PaymentMethod", 100006 }
                });

            migrationBuilder.InsertData(
                table: "Stations",
                columns: new[] { "StationId", "AddressId", "Area", "ContactName", "Email", "Phone", "StationImage", "StationName" },
                values: new object[,]
                {
                    { 1001, 1001, 500f, "Nguyễn Anh Dũng", "aeon.ecopark@gmail.ccom", "0906232138", "https://ecoparker.s3.ap-southeast-1.amazonaws.com/s3fs-public/styles/8_col/public/nha%20hang/starbucks-ecopark-13.jpg?itok=Pvth7skq", "Starbuck Ecopark" },
                    { 1002, 1002, 500f, "Nguyễn Mạnh Hùng", "tennis.ecopark@gmail.com", "0962610374", "http://ecoparksupport.com/wp-content/uploads/2020/05/san-golf-ecopark-1.jpg", "Sân Golf Rừng Cọ - Ecopark" },
                    { 1003, 1003, 500f, "Ngọ Anh Cường", "springpark.ecopark@gmail.com", "0936656669", "https://ecoparker.s3.ap-southeast-1.amazonaws.com/s3fs-public/pictures/cong-vien-ho-thien-nga-ecopark-1.jpg", "Công viên mùa xuân - Spring Park" },
                    { 1004, 1004, 500f, "Vũ Hữu Đạt", "summerpark.ecopark@gmail.com", "0466519528", "https://ecoparker.s3.ap-southeast-1.amazonaws.com/choi/cong-vien-mua-ha-ecopark-02.jpg", "Công viên mùa hạ" },
                    { 1005, 1005, 500f, "Nguyễn Đình Thắng", "winterpark.ecopark@gmail.com", "0987866389", "https://ecoparker.s3.ap-southeast-1.amazonaws.com/choi/cung-duong-ecopark-grand-10.jpg", "Công viên mùa đông" },
                    { 1006, 1006, 500f, "Trương Anh Minh", "autumpark.ecopark@gmail.com", "0987866389", "https://datvietvnn.com/wp-content/uploads/2020/05/cong-vien-mua-ha-ecopark.jpg", "Công viên mùa thu" }
                });

            migrationBuilder.InsertData(
                table: "BikeInStations",
                columns: new[] { "BikeId", "StationId", "DateTimeIn", "DateTimeOut" },
                values: new object[,]
                {
                    { 100001, 1001, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 300006, 1005, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 200006, 1005, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 300005, 1004, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 300004, 1004, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 200005, 1004, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 200004, 1004, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 200003, 1003, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 100006, 1003, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 300003, 1003, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 300002, 1002, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 200002, 1002, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 100004, 1002, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 100003, 1002, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 300001, 1001, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 200001, 1001, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 100002, 1001, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 100005, 1003, new DateTime(2020, 11, 10, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) }
                });

            migrationBuilder.InsertData(
                table: "Rentals",
                columns: new[] { "RentalId", "BikeId", "CardId", "RateContent", "RateNumber", "RenterId" },
                values: new object[,]
                {
                    { 100002, 100002, 100002, "Tuyệt vời.", 5, 100002 },
                    { 100001, 100001, 100001, "Mọi thứ đều tốt.", 5, 100001 },
                    { 100004, 200002, 100001, "Xe đi rất thoải mái.", 4, 100004 },
                    { 100005, 300001, 100001, "Mọi thứ đều tốt.", 5, 100005 },
                    { 100006, 100004, 100001, "Trải nghiệm thú vị.", 5, 100006 },
                    { 100003, 200001, 100003, "Mọi thứ đều tốt.", 5, 100003 }
                });

            migrationBuilder.InsertData(
                table: "Transactions",
                columns: new[] { "TransactionId", "ActualEndDateTime", "ActualStartDateTime", "BookedEndDateTime", "BookedStartDateTime", "PaymentStatus", "RentalId" },
                values: new object[,]
                {
                    { 100003, new DateTime(2020, 12, 3, 10, 14, 54, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 3, 8, 32, 54, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 6, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 6, 0, 0, 0, 0, DateTimeKind.Unspecified), 3, 100001 },
                    { 100004, new DateTime(2020, 12, 3, 10, 14, 54, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 3, 8, 32, 54, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 3, 0, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 12, 3, 0, 0, 0, 0, DateTimeKind.Unspecified), 3, 100002 }
                });

            migrationBuilder.CreateIndex(
                name: "IX_BikeInStations_StationId",
                table: "BikeInStations",
                column: "StationId");

            migrationBuilder.CreateIndex(
                name: "IX_Cards_RenterId",
                table: "Cards",
                column: "RenterId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Rentals_BikeId",
                table: "Rentals",
                column: "BikeId");

            migrationBuilder.CreateIndex(
                name: "IX_Rentals_CardId",
                table: "Rentals",
                column: "CardId");

            migrationBuilder.CreateIndex(
                name: "IX_Rentals_RenterId",
                table: "Rentals",
                column: "RenterId");

            migrationBuilder.CreateIndex(
                name: "IX_Stations_AddressId",
                table: "Stations",
                column: "AddressId");

            migrationBuilder.CreateIndex(
                name: "IX_Transactions_RentalId",
                table: "Transactions",
                column: "RentalId",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "BikeInStations");

            migrationBuilder.DropTable(
                name: "Transactions");

            migrationBuilder.DropTable(
                name: "Stations");

            migrationBuilder.DropTable(
                name: "Rentals");

            migrationBuilder.DropTable(
                name: "Addresses");

            migrationBuilder.DropTable(
                name: "Bikes");

            migrationBuilder.DropTable(
                name: "Cards");

            migrationBuilder.DropTable(
                name: "Renters");
        }
    }
}
