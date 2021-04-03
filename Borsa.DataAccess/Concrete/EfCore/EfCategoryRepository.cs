using Borsa.DataAccess.Abstract;
using Borsa.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace Borsa.DataAccess.Concrete.EfCore
{
    public class EfCategoryRepository : EfGenericRepository<Category, BorsaContext>, ICategoryRepository
    {
        public Category GetByIdWithProducts(int id)
        {
            using (var context = new BorsaContext())
            {
                return context.Categories.Where(x => x.Id == id).Include(x => x.ProductCategories).ThenInclude(x => x.Product).FirstOrDefault();
            }
        }
    }
}
