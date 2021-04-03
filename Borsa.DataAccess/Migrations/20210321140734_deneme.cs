using Microsoft.EntityFrameworkCore.Migrations;

namespace Borsa.DataAccess.Migrations
{
    public partial class deneme : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "OrderId",
                table: "OrderLines",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_OrderLines_OrderId",
                table: "OrderLines",
                column: "OrderId");

            migrationBuilder.AddForeignKey(
                name: "FK_OrderLines_Orders_OrderId",
                table: "OrderLines",
                column: "OrderId",
                principalTable: "Orders",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_OrderLines_Orders_OrderId",
                table: "OrderLines");

            migrationBuilder.DropIndex(
                name: "IX_OrderLines_OrderId",
                table: "OrderLines");

            migrationBuilder.DropColumn(
                name: "OrderId",
                table: "OrderLines");
        }
    }
}
