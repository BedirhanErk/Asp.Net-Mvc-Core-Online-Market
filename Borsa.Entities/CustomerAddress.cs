using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Entities
{
    public class CustomerAddress
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string District { get; set; }
        public string Neighborhood { get; set; }
        public string Phone { get; set; }
        public string AddressTitle { get; set; }
    }
}
