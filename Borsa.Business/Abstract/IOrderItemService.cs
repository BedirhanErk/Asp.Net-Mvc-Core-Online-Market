using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Business.Abstract
{
    public interface IOrderItemService
    {
        List<OrderItem> GetAll();
    }
}
