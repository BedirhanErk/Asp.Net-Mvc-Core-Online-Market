using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Entities
{
    public class Wishlist
    {
        public int Id { get; set; }
        public Product Product { get; set; }
        public int ProductId { get; set; }
        public Cart Cart { get; set; }
        public int CartId { get; set; }
    }
}
