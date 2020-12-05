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
        [Column(TypeName = "varchar(255)")]
        public string Name { get; set; }
        public int RenterId { get; set; }
        
        public static List<Renter> GetSeederData()
        {
            return new List<Renter>
            {
                new Renter() {Name ="Group 4",RenterId = 100001},
                new Renter() {Name ="Nguyễn Văn Linh",RenterId = 100002},
                new Renter() {Name ="Phạm Huy Hoàng",RenterId = 100003},
                new Renter() {Name ="Trần Đình Đức",RenterId = 100004},
                new Renter() {Name ="Vũ Duy Tiến",RenterId = 100005},
                new Renter() {Name ="Phạm Mạnh Cường",RenterId = 100006},
                new Renter() {Name ="Trần Văn Tâm",RenterId = 100007},
                new Renter() {Name ="Khổng Hoàng Phong",RenterId = 100008}
                
            };
        }
    }

}