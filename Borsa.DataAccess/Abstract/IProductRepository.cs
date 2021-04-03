using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace Borsa.DataAccess.Abstract
{
    public interface IProductRepository : IGenericRepository<Product>
    {
        List<Product> GetProductsByCategory(string category, int page, int pageSize);

        Product GetProductDetails(int id);
        int GetProductsByCategory(string category);
        Product GetByIdWithCategories(int id);
        void Update(Product entity, int[] categoryIds);
    }
}
