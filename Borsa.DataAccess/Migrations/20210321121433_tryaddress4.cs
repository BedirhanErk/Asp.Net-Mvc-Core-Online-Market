using Microsoft.EntityFrameworkCore.Migrations;

namespace Borsa.DataAccess.Migrations
{
    public partial class tryaddress4 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_OrderItem_Carts_CartId",
                table: "OrderItem");

            migrationBuilder.DropForeignKey(
                name: "FK_OrderItem_CustomerAddresses_CustomerAddressId",
                table: "OrderItem");

            migrationBuilder.DropIndex(
                name: "IX_OrderItem_CartId",
                table: "OrderItem");

            migrationBuilder.DropIndex(
                name: "IX_OrderItem_CustomerAddressId",
                table: "OrderItem");

            migrationBuilder.DropColumn(
                name: "AddressId",
                table: "OrderItem");

            migrationBuilder.DropColumn(
                name: "CartId",
                table: "OrderItem");

            migrationBuilder.DropColumn(
                name: "CustomerAddressId",
                table: "OrderItem");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "AddressId",
                table: "OrderItem",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "CartId",
                table: "OrderItem",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CustomerAddressId",
                table: "OrderItem",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_OrderItem_CartId",
                table: "OrderItem",
                column: "CartId");

            migrationBuilder.CreateIndex(
                name: "IX_OrderItem_CustomerAddressId",
                table: "OrderItem",
                column: "CustomerAddressId");

            migrationBuilder.AddForeignKey(
                name: "FK_OrderItem_Carts_CartId",
                table: "OrderItem",
                column: "CartId",
                principalTable: "Carts",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_OrderItem_CustomerAddresses_CustomerAddressId",
                table: "OrderItem",
                column: "CustomerAddressId",
                principalTable: "CustomerAddresses",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
