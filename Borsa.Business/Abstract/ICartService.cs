using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Business.Abstract
{
    public interface ICartService
    {
        void InitializeCart(string userId);
        Cart GetCartByUserId(string userId);
        void AddToCart(string userId, int productId, int quantity);
        void DeleteFromCart(string userId, int productId);
        void ClearCart(string cartId);
        Cart GetCartByUserWishlistId(string userId);
        void AddToWishlist(string userId, int productId);
        void DeleteFromWishlist(string userId, int productId);
    }
}
