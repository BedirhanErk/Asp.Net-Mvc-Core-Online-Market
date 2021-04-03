using Borsa.Business.Abstract;
using Borsa.DataAccess.Abstract;
using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Business.Concrete
{
    public class CustomerCardManager : ICustomerCardService
    {
        private ICustomerCardRepository _customerCardRepository;
        public CustomerCardManager(ICustomerCardRepository customerCardRepository)
        {
            _customerCardRepository = customerCardRepository;
        }
        public void Create(CustomerCard entity)
        {
            _customerCardRepository.Create(entity);
        }

        public void Delete(CustomerCard entity)
        {
            _customerCardRepository.Delete(entity);
        }

        public List<CustomerCard> GetAll()
        {
            return _customerCardRepository.GetAll();
        }

        public CustomerCard GetById(int id)
        {
            return _customerCardRepository.GetById(id);
        }

        public void Update(CustomerCard entity)
        {
            _customerCardRepository.Update(entity);
        }
    }
}
