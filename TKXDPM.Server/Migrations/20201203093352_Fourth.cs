using Microsoft.EntityFrameworkCore.Migrations;

namespace TKXDPM_API.Migrations
{
    public partial class Fourth : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_Stations_AddressId",
                table: "Stations",
                column: "AddressId");

            migrationBuilder.AddForeignKey(
                name: "FK_Stations_Addresses_AddressId",
                table: "Stations",
                column: "AddressId",
                principalTable: "Addresses",
                principalColumn: "AddressId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Stations_Addresses_AddressId",
                table: "Stations");

            migrationBuilder.DropIndex(
                name: "IX_Stations_AddressId",
                table: "Stations");
        }
    }
}
