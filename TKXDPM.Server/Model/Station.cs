using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TKXDPM_API.Model
{
    public class Station
    {
        [Key] public int StationId { get; set; }

        public int AddressId { get; set; }
        public AddressResponse Address { get; set; }
        [Column(TypeName = "varchar(255)")] public string ContactName { get; set; }
        [Column(TypeName = "varchar(255)")] public string Email { get; set; }
        [Column(TypeName = "varchar(255)")] public string Phone { get; set; }
        public float Area { get; set; }
        public static List<Station> GetSeederData()
        {
            return new List<Station>
            {
                new Station() {
                    StationId = 1001,
                    AddressId = 1001,
                    Address = new AddressResponse()
                    {
                        AddressName = "Phường Hạ Đình, Quận Thanh Xuân, TP Hà Nội", Latitude = 100, Longitude = 99   
                    },
                    ContactName = "Hạ Đình",
                    Email = "ecohadinh@gmail.ccom",
                    Phone = "0906232138",
                    Area = 500
                },
                new Station() {
                    StationId = 1002,
                    AddressId = 1002,
                    Address = new AddressResponse()
                    {
                        AddressName = "172 Lê Trọng Tấn, Thanh Xuân, Hà Nội", Latitude = 100, Longitude = 99   
                    },
                    ContactName = "Lê Trọng Tấn",
                    Email = "ecoletrongtan@gmail.com",
                    Phone = "0962610374",
                    Area = 500
                },
                new Station() {
                    StationId = 1003,
                    AddressId = 1003,
                    Address = new AddressResponse()
                    {
                        AddressName = "Lương Thế Vinh, Thanh Xuân, Hà Nội", Latitude = 100, Longitude = 99   
                    },
                    ContactName = "Lương Thế Vinh",
                    Email = "ecoluongthevinh@gmail.com",
                    Phone = "0936656669",
                    Area = 500
                },
                new Station() {
                    StationId = 1004,
                    AddressId = 1004,
                    Address = new AddressResponse()
                    {
                        AddressName = "Ngã tư Khuất Duy Tiến, Lê Văn Lương, Thanh Xuân, Hà Nội", Latitude = 100, Longitude = 99   
                    },
                    ContactName = "Khuất Duy Tiến",
                    Email = "ecokhuatduytien@gmail.com",
                    Phone = "0466519528",
                    Area = 500
                },
                new Station() {
                    StationId = 1005,
                    AddressId = 1005,
                    Address = new AddressResponse()
                    {
                        AddressName = "57 Nguyễn Trãi, Thanh Xuân, Hà Nội", Latitude = 100, Longitude = 99   
                    },
                    ContactName = "Nguyễn Trãi",
                    Email = "econguyentrai@gmail.com",
                    Phone = "0987866389",
                    Area = 500
                },
                new Station() {
                    StationId = 1006,
                    AddressId = 1006,
                    Address = new AddressResponse()
                    {
                        AddressName = "155 Trường Chinh, Khương Trung, Thanh Xuân, Hà Nội", Latitude = 100, Longitude = 99   
                    },
                    ContactName = "Trường Chinh",
                    Email = "ecotruongchinh@gmail.com",
                    Phone = "0987866389",
                    Area = 500
                },    
            };
        }
    }

    public class StationResponse
    {
        public StationResponse()
        {
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
        }
        public string ContactName { get; set; }
        public string Email { get; set; } 
        public string Phone { get; set; }
        public float Area { get; set; } = 10;
        public AddressResponse Address { get; set; }
        public List<BikeResponse> ListBike { get; set; }
        
       
    }
}