using Borsa.Business.Abstract;
using Borsa.DataAccess.Abstract;
using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Business.Concrete
{
    public class CartManager : ICartService
    {
        private ICartRepository _cartRepository;
        public CartManager(ICartRepository cartRepository)
        {
            _cartRepository = cartRepository;
        }

        public void AddToCart(string userId, int productId, int quantity)
        {
            var cart = GetCartByUserId(userId);
            if (cart != null)
            {
                var index = cart.CartItems.FindIndex(i => i.ProductId == productId);

                if (index < 0)
                {
                    cart.CartItems.Add(new CartItem()
                    {
                        ProductId = productId,
                        Quantity = quantity,
                        CartId = cart.Id
                    });
                }
                else
                {
                    cart.CartItems[index].Quantity += quantity;
                }

                _cartRepository.Update(cart);
            }
        }
        public void AddToWishlist(string userId, int productId)
        {
            var cart = GetCartByUserWishlistId(userId);
            if (cart != null)
            {
                var index = cart.Wishlists.FindIndex(i => i.ProductId == productId);

                if (index < 0)
                {
                    cart.Wishlists.Add(new Wishlist()
                    {
                        ProductId = productId,
                        CartId = cart.Id
                    });
                }
                else
                {

                }

                _cartRepository.Update(cart);
            }
        }

        public void ClearCart(string cartId)
        {
            _cartRepository.ClearCart(cartId);
        }

        public void DeleteFromCart(string userId, int productId)
        {
            var cart = GetCartByUserId(userId);
            if (cart != null)
            {
                var cardId = cart.Id;
                _cartRepository.DeleteFromCart(cart.Id, productId);
            }
        }

        public void DeleteFromWishlist(string userId, int productId)
        {
            var cart = GetCartByUserWishlistId(userId);
            if (cart != null)
            {
                var cardId = cart.Id;
                _cartRepository.DeleteFromWishlist(cart.Id, productId);
            }
        }

        public Cart GetCartByUserId(string userId)
        {
            return _cartRepository.GetByUserId(userId);
        }

        public Cart GetCartByUserWishlistId(string userId)
        {
            return _cartRepository.GetByUserWishlsitId(userId);
        }

        public void InitializeCart(string userId)
        {
            _cartRepository.Create(new Cart() { UserId = userId });
        }
    }
}
