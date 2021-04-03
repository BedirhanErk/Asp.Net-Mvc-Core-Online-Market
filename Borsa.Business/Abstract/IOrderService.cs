using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Business.Abstract
{
    public interface IOrderService
    {
        void Create(Order entity);
        List<Order> GetOrders(string userId);
        List<Order> GetAll();
        Order GetById(int id);
        void Update(Order entity);
    }
}
