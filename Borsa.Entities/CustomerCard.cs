using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Entities
{
    public class CustomerCard
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public string CardTitle { get; set; }
        public string CardName { get; set; }
        public string CardNumber { get; set; }
        public string ExpirationMonth { get; set; }
        public string ExpirationYear { get; set; }
        public string Cvv { get; set; }
    }
}
