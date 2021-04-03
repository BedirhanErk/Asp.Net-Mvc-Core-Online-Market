using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.DataAccess.Abstract
{
    public interface IOrderRepository : IGenericRepository<Order>
    {
        List<Order> GetOrders(string userId);
    }
}
