using Borsa.Business.Abstract;
using Borsa.DataAccess.Abstract;
using Borsa.DataAccess.Concrete.EfCore;
using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Borsa.Business.Concrete
{
    public class ProductManager : IProductService
    {
        private IProductRepository _productrepo;

        public ProductManager(IProductRepository productrepo)
        {
            _productrepo = productrepo;
        }
        public bool Create(Product entity)
        {
            if (Validate(entity))
            {
                _productrepo.Create(entity);
                return true;
            }
            return false;
        }

        public void Delete(Product entity)
        {
            _productrepo.Delete(entity);
        }

        public List<Product> GetAll()
        {
            return _productrepo.GetAll();
        }

        public Product GetById(int id)
        {
            return _productrepo.GetById(id);
        }

        public Product GetByIdWithCategories(int id)
        {
            return _productrepo.GetByIdWithCategories(id);
        }

        public int GetCountByCategory(string category)
        {
            return _productrepo.GetProductsByCategory(category);
        }

        public Product GetProductDetails(int id)
        {
            return _productrepo.GetProductDetails(id);
        }

        public List<Product> GetProductsByCategory(string category, int page,int pageSize)
        {
            return _productrepo.GetProductsByCategory(category ,page, pageSize);
        }

        public void Update(Product entity)
        {
            _productrepo.Update(entity);
        }

        public void Update(Product entity, int[] categoryIds)
        {
            _productrepo.Update(entity,categoryIds);
        }

        public bool Validate(Product entity)
        {
            var isValid = true;

            if (string.IsNullOrEmpty(entity.Name))
            {
                ErorMessage += "The product name cannot be blank.";
                isValid = false;
            }
            return isValid; 
        }

        public string ErorMessage { get; set; }
    }
}
