using Borsa.DataAccess.Abstract;
using Borsa.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Borsa.DataAccess.Concrete.EfCore
{
    public class EfOrderRepository : EfGenericRepository<Order, BorsaContext>, IOrderRepository
    {
        public List<Order> GetOrders(string userId)
        {
            using (var context = new BorsaContext())
            {
                var orders = context.Orders.Include(i => i.OrderItems).ThenInclude(i => i.Product).AsQueryable();
                if (string.IsNullOrEmpty(userId))
                {
                    orders = orders.Where(i => i.UserId == userId);
                }
                return orders.ToList();
            }
        }
    }
}
