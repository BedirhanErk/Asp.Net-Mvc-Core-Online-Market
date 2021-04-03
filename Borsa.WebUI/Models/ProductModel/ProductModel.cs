using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.Models
{
    public class ProductModel
    {
        public int Id { get; set; }
        //[Required(ErrorMessage = "This field cannot be empty.")]
        //[StringLength(60, MinimumLength = 2, ErrorMessage = "Product name minimum 2 characters and maximum 60 characters.")]
        public string Name { get; set; }
        public string Brand { get; set; }
        public string ImageUrl { get; set; }
        [StringLength(1000000, MinimumLength = 15, ErrorMessage = "Product name minimum 20 characters and maximum 300 characters.")]
        [Required(ErrorMessage = "This field cannot be empty.")]

        public string Description { get; set; }
        [Required(ErrorMessage = "Specify price.")]
        public short Stock { get; set; }
        public bool HomeMonth { get; set; }
        public bool HomeToday { get; set; }
        public bool HomeOffer { get; set; }
        public bool HomePopular { get; set; }
        public bool Status { get; set; }
        public decimal? Price { get; set; }
        public decimal? DiscountedPrice { get; set; }
        public List<Category> SelectedCategories { get; set; }
    }
}
