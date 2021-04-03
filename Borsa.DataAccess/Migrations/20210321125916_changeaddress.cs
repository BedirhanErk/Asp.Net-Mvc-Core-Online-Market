using Microsoft.EntityFrameworkCore.Migrations;

namespace Borsa.DataAccess.Migrations
{
    public partial class changeaddress : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "CustomerAddresses",
                newName: "UsersId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "UsersId",
                table: "CustomerAddresses",
                newName: "UserId");
        }
    }
}
