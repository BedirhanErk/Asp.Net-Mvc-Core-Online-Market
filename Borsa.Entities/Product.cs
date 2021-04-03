using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Entities
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Brand { get; set; }
        public string ImageUrl { get; set; }
        public string Description { get; set; }
        public short Stock { get; set; }
        public bool HomeMonth { get; set; }
        public bool HomeToday { get; set; }
        public bool HomeOffer { get; set; }
        public bool HomePopular { get; set; }
        public bool Status { get; set; }
        public decimal? Price { get; set; }
        public decimal? DiscountedPrice { get; set; }
        public List<ProductCategory> ProductCategories { get; set; }
    }
}
