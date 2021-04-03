using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Business.Abstract
{
    public interface ICustomerAddressService
    {
        CustomerAddress GetById(int id);
        List<CustomerAddress> GetAll();
        void Create(CustomerAddress entity);
        void Update(CustomerAddress entity);
        void Delete(CustomerAddress entity);
    }
}
