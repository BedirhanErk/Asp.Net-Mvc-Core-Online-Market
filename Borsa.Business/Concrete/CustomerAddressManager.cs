using Borsa.Business.Abstract;
using Borsa.DataAccess.Abstract;
using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Business.Concrete
{
    public class CustomerAddressManager : ICustomerAddressService
    {
        private ICustomerAddressRepository _addressRepository;
        public CustomerAddressManager(ICustomerAddressRepository addressRepository)
        {
            _addressRepository = addressRepository;
        }
        public void Create(CustomerAddress entity)
        {
            _addressRepository.Create(entity);
        }

        public void Delete(CustomerAddress entity)
        {
            _addressRepository.Delete(entity);
        }

        public List<CustomerAddress> GetAll()
        {
            return _addressRepository.GetAll();
        }

        public CustomerAddress GetById(int id)
        {
            return _addressRepository.GetById(id);
        }

        public void Update(CustomerAddress entity)
        {
            _addressRepository.Update(entity);
        }
    }
}
