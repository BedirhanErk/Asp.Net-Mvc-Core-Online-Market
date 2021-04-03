using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.Models
{
    public class OrderListModel
    {
        public int OrderId { get; set; }
        public string OrderNumber { get; set; }
        public DateTime OrderDate { get; set; }

        public string OrderState { get; set; }
        public EnumPaymentTypes PaymentTypes { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string OrderNote {get; set;}
        public bool Status { get; set; }
        public List<OrderItemModel> OrderItems { get; set; }

        public decimal TotalPrice()
        {
            return OrderItems.Sum(i => i.DiscountedPrice * i.Qunatity);
        }
    }
    public class OrderItemModel
    {
        public int OrderItemId { get; set; }
        public decimal Price { get; set; }
        public decimal DiscountedPrice { get; set; }
        public string Name { get; set; }
        public string ImageUrl { get; set; }
        public int Qunatity { get; set; }
    }
}
