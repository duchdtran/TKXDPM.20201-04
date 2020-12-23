using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using TKXDPM_API.Model;
using TKXDPM_API.Seeder;

namespace TKXDPM_API
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext([NotNull] DbContextOptions options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BikeInStation>()
                .HasKey(key => new {key.BikeId, key.StationId});
            modelBuilder.Entity<Address>().HasData(AddressSeeder.GetSeederData());
            modelBuilder.Entity<Station>().HasData(StationSeeder.GetSeederData());
            modelBuilder.Entity<Bike>().HasData(BikeSeeder.GetSeederData());
            modelBuilder.Entity<BikeInStation>().HasData(BikeInStationSeeder.GetSeederData());
            modelBuilder.Entity<Renter>().HasData(RenterSeeder.GetSeederData());
            modelBuilder.Entity<Card>().HasData(CardSeeder.GetSeederData());
            modelBuilder.Entity<Rental>().HasData(RentalSeeder.GetSeederData());
            modelBuilder.Entity<Transaction>().HasData(TransactionSeeder.GetSeederData());
        }

        public DbSet<Address> Addresses { get; set; }
        public DbSet<Station> Stations { get; set; }
        public DbSet<Bike> Bikes { get; set; }
        public DbSet<BikeInStation> BikeInStations { get; set; }
        public DbSet<Renter> Renters { get; set; }
        public DbSet<Card> Cards { get; set; }
        public DbSet<Rental> Rentals { get; set; }
        public DbSet<Transaction> Transactions { get; set; }

        public async Task<Renter> FindRenter(string deviceCode)
        {
            var renter = await Renters.Where(r => r.DeviceCode == deviceCode).FirstOrDefaultAsync();
            return renter;
        }
    }
}