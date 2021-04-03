using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace Borsa.DataAccess.Abstract
{
    public interface IGenericRepository<T>
    {
        T GetById(int id);
        T GetOne(Expression<Func<T, bool>> filter);
        List<T> GetAll(Expression<Func<T, bool>> filter=null);
        void Create(T entity);
        void Update(T entity);
        void Delete(T entity);
    }
}
