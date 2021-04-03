using Microsoft.EntityFrameworkCore.Migrations;

namespace Borsa.DataAccess.Migrations
{
    public partial class DeleteDprice : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DiscountedPrice",
                table: "Products");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "DiscountedPrice",
                table: "Products",
                type: "decimal(18,2)",
                nullable: true);
        }
    }
}
