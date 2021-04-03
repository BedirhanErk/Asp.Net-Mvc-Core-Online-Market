using Borsa.DataAccess.Abstract;
using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.DataAccess.Concrete.EfCore
{
    public class EfOrderItemRepository : EfGenericRepository<OrderItem, BorsaContext>, IOrderItemRepository
    {
    }
}
