using Microsoft.EntityFrameworkCore.Migrations;

namespace Borsa.WebUI.Migrations
{
    public partial class Errorsolution : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CustomerAddresses_AspNetUsers_ApplicationUserId",
                table: "CustomerAddresses");

            migrationBuilder.DropPrimaryKey(
                name: "PK_CustomerAddresses",
                table: "CustomerAddresses");

            migrationBuilder.RenameTable(
                name: "CustomerAddresses",
                newName: "CustomerAddress");

            migrationBuilder.RenameIndex(
                name: "IX_CustomerAddresses_ApplicationUserId",
                table: "CustomerAddress",
                newName: "IX_CustomerAddress_ApplicationUserId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_CustomerAddress",
                table: "CustomerAddress",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_CustomerAddress_AspNetUsers_ApplicationUserId",
                table: "CustomerAddress",
                column: "ApplicationUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CustomerAddress_AspNetUsers_ApplicationUserId",
                table: "CustomerAddress");

            migrationBuilder.DropPrimaryKey(
                name: "PK_CustomerAddress",
                table: "CustomerAddress");

            migrationBuilder.RenameTable(
                name: "CustomerAddress",
                newName: "CustomerAddresses");

            migrationBuilder.RenameIndex(
                name: "IX_CustomerAddress_ApplicationUserId",
                table: "CustomerAddresses",
                newName: "IX_CustomerAddresses_ApplicationUserId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_CustomerAddresses",
                table: "CustomerAddresses",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_CustomerAddresses_AspNetUsers_ApplicationUserId",
                table: "CustomerAddresses",
                column: "ApplicationUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
