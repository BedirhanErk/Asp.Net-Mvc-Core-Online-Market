using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.DataAccess.Abstract
{
    public interface ICartRepository : IGenericRepository<Cart>
    {
        Cart GetByUserId(string userId);
        void DeleteFromCart(int cartId, int productId);
        void ClearCart(string cartId);
        void DeleteFromWishlist(int cartId, int productId);
        Cart GetByUserWishlsitId(string userId);
    }
}
