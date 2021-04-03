using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Business.Abstract
{
    public interface ICustomerCardService
    {
        CustomerCard GetById(int id);
        List<CustomerCard> GetAll();
        void Create(CustomerCard entity);
        void Update(CustomerCard entity);
        void Delete(CustomerCard entity);
    }
}
