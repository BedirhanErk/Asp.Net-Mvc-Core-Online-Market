using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Entities
{
    public class Order
    {
        public Order()
        {
            OrderItems = new List<OrderItem>();
        }
        public int Id { get; set; }
        public string OrderNumber { get; set; }
        public DateTime OrderDate { get; set; }
        public string UserId { get; set; }

        public string OrderState { get; set; }
        public EnumPaymentTypes PaymentTypes { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string OrderNote { get; set; }
        public bool Status { get; set; }

        public string CardName { get; set; }
        public string CardNumber { get; set; }
        public string ExpirationMonth { get; set; }
        public string ExpirationYear { get; set; }
        public string Cvv { get; set; }
        public string PaymentId { get; set; }
        public string PaymentToken { get; set; }
        public string ConversationId { get; set; }
        public List<OrderItem> OrderItems { get; set; }
    }
    public enum EnumPaymentTypes
    {
        CreditCart = 0,
        Eft = 1,
        PayAtTheDoor = 2
    }
}
