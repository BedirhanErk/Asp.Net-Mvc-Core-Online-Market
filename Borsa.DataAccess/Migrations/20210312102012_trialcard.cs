using Microsoft.EntityFrameworkCore.Migrations;

namespace Borsa.DataAccess.Migrations
{
    public partial class trialcard : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "CardName",
                table: "Orders",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "CardNumber",
                table: "Orders",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Cvv",
                table: "Orders",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ExpirationMonth",
                table: "Orders",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ExpirationYear",
                table: "Orders",
                type: "nvarchar(max)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CardName",
                table: "Orders");

            migrationBuilder.DropColumn(
                name: "CardNumber",
                table: "Orders");

            migrationBuilder.DropColumn(
                name: "Cvv",
                table: "Orders");

            migrationBuilder.DropColumn(
                name: "ExpirationMonth",
                table: "Orders");

            migrationBuilder.DropColumn(
                name: "ExpirationYear",
                table: "Orders");
        }
    }
}
