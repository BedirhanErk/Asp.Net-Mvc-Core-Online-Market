using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.Models
{
    public class CartModel
    {
        public int CartId { get; set; }
        public List<CartItemModel> CartItems { get; set; }
        public List<WishlistModel> WishlistModels { get; set; }

        public decimal TotalPrice()
        {
            return CartItems.Sum(i => i.DiscountedPrice * i.Qunatity);
        }
    }

    public class CartItemModel
    {
        public int CartItemId { get; set; }
        public int ProductId { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public decimal DiscountedPrice { get; set; }
        public string ImageUrl { get; set; }
        public int Qunatity { get; set; }
    }

    public class WishlistModel
    {
        public int WishlistId { get; set; }
        public int ProductId { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public decimal DiscountedPrice { get; set; }
        public string ImageUrl { get; set; }
        public int Qunatity { get; set; }
    }
}
