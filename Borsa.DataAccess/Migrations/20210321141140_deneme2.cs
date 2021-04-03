using Microsoft.EntityFrameworkCore.Migrations;

namespace Borsa.DataAccess.Migrations
{
    public partial class deneme2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "CartId",
                table: "OrderLines",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_OrderLines_CartId",
                table: "OrderLines",
                column: "CartId");

            migrationBuilder.AddForeignKey(
                name: "FK_OrderLines_Carts_CartId",
                table: "OrderLines",
                column: "CartId",
                principalTable: "Carts",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_OrderLines_Carts_CartId",
                table: "OrderLines");

            migrationBuilder.DropIndex(
                name: "IX_OrderLines_CartId",
                table: "OrderLines");

            migrationBuilder.DropColumn(
                name: "CartId",
                table: "OrderLines");
        }
    }
}
