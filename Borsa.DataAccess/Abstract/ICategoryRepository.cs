using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace Borsa.DataAccess.Abstract
{
    public interface ICategoryRepository : IGenericRepository<Category>
    {
        Category GetByIdWithProducts(int id);
    }
}
