using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Entities
{
    public class Cart
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public List<CartItem> CartItems { get; set; }
        public List<Wishlist> Wishlists { get; set; }
    }
}
