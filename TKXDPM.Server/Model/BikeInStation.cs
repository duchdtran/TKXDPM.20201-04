using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TKXDPM_API.Model
{
    public class BikeInStation
    {
        public int StationId { get; set; }
        public Station Station { get; set; }
        public int BikeId { get; set; }
        public Bike Bike { get; set; }
        public DateTime DateTimeIn { get; set; }
        public DateTime DateTimeOut { get; set; }
        
        public static List<BikeInStation> GetSeederData()
        {
            return new List<BikeInStation>
            {
                new BikeInStation() {StationId = 1001, Station = new Station(), BikeId = 100001, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                new BikeInStation() {StationId = 1001, Station = new Station(), BikeId = 100002, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                new BikeInStation() {StationId = 1001, Station = new Station(), BikeId = 200001, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                new BikeInStation() {StationId = 1001, Station = new Station(), BikeId = 300001, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                
                new BikeInStation() {StationId = 1002, Station = new Station(), BikeId = 100003, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                new BikeInStation() {StationId = 1002, Station = new Station(), BikeId = 100004, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                new BikeInStation() {StationId = 1002, Station = new Station(), BikeId = 200002, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                new BikeInStation() {StationId = 1002, Station = new Station(), BikeId = 300002, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                
                new BikeInStation() {StationId = 1003, Station = new Station(), BikeId = 100005, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                new BikeInStation() {StationId = 1003, Station = new Station(), BikeId = 100006, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                new BikeInStation() {StationId = 1003, Station = new Station(), BikeId = 200003, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                new BikeInStation() {StationId = 1003, Station = new Station(), BikeId = 300003, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                
                new BikeInStation() {StationId = 1004, Station = new Station(), BikeId = 200004, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                new BikeInStation() {StationId = 1004, Station = new Station(), BikeId = 200005, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                new BikeInStation() {StationId = 1004, Station = new Station(), BikeId = 300004, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                new BikeInStation() {StationId = 1004, Station = new Station(), BikeId = 300005, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                
                new BikeInStation() {StationId = 1005, Station = new Station(), BikeId = 200006, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
                new BikeInStation() {StationId = 1005, Station = new Station(), BikeId = 300006, Bike = new Bike(),DateTimeIn =new DateTime(2020,11,10),DateTimeOut = new DateTime(2020,12,12)},
            };
        }
    }
}