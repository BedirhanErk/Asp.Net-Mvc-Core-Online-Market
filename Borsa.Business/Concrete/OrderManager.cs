using Borsa.Business.Abstract;
using Borsa.DataAccess.Abstract;
using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Business.Concrete
{
    public class OrderManager : IOrderService
    {
        private IOrderRepository _orderService;
        public OrderManager(IOrderRepository orderService)
        {
            _orderService = orderService;
        }
        public void Create(Order entity)
        {
            _orderService.Create(entity);
        }

        public List<Order> GetAll()
        {
            return _orderService.GetAll();
        }

        public Order GetById(int id)
        {
            return _orderService.GetById(id);
        }

        public List<Order> GetOrders(string userId)
        {
            return _orderService.GetOrders(userId);
        }

        public void Update(Order entity)
        {
            _orderService.Update(entity);
        }
    }
}
