using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Business.Abstract
{
    public interface IValidator<T>
    {
        string ErorMessage { get; set; }
        bool Validate(T entity);
    }
}
