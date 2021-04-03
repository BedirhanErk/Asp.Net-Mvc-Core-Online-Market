using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Business.Abstract
{
    public interface ICategoryService : IValidator<Category>
    {
        Category GetById(int id);
        Category GetByIdWithProducts(int id);
        List<Category> GetAll();
        void Create(Category entity);
        void Update(Category entity);
        void Delete(Category entity);
    }
}
