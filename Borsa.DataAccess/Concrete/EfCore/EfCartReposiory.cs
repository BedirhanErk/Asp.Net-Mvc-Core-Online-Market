using Borsa.DataAccess.Abstract;
using Borsa.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Borsa.DataAccess.Concrete.EfCore
{
    public class EfCartReposiory : EfGenericRepository<Cart, BorsaContext>, ICartRepository
    {
        public override void Update(Cart entity)
        {
            using (var context = new BorsaContext())
            {
                context.Carts.Update(entity);
                context.SaveChanges();
            }
        }
        public Cart GetByUserId(string userId)
        {
            using (var context = new BorsaContext())
            {
                return context
                    .Carts
                    .Include(i => i.CartItems)
                    .ThenInclude(i => i.Product)
                    .FirstOrDefault(i => i.UserId == userId);
            }
        }

        public void DeleteFromCart(int cartId, int productId)
        {
            using (var context = new BorsaContext())
            {
                var cmd = @"delete from CartItem where CartId=@p0 And ProductId=@p1";
                context.Database.ExecuteSqlRaw(cmd, cartId, productId);
            }
        }

        public void ClearCart(string cartId)
        {
            using (var context = new BorsaContext())
            {
                var cmd = @"delete from CartItem where CartId=@p0";
                context.Database.ExecuteSqlRaw(cmd, cartId);
            }
        }

        public void DeleteFromWishlist(int cartId, int productId)
        {
            using (var context = new BorsaContext())
            {
                var cmd = @"delete from Wishlist where CartId=@p0 And ProductId=@p1";
                context.Database.ExecuteSqlRaw(cmd, cartId, productId);
            }
        }

        public Cart GetByUserWishlsitId(string userId)
        {
            using (var context = new BorsaContext())
            {
                return context
                    .Carts
                    .Include(i => i.Wishlists)
                    .ThenInclude(i => i.Product)
                    .FirstOrDefault(i => i.UserId == userId);
            }
        }
    }
}
