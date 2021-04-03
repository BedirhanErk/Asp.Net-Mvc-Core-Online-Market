using Borsa.Business.Abstract;
using Borsa.DataAccess.Abstract;
using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Business.Concrete
{
    public class OrderItemManager : IOrderItemService
    {
        private IOrderItemRepository _orderıtemService;
        public OrderItemManager(IOrderItemRepository orderıtemService)
        {
            _orderıtemService = orderıtemService;
        }
        public List<OrderItem> GetAll()
        {
            return _orderıtemService.GetAll();
        }
    }
}
