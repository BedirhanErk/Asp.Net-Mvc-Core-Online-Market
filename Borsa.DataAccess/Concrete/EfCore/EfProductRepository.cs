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
    public class EfProductRepository : EfGenericRepository<Product, BorsaContext>, IProductRepository
    {
        public Product GetByIdWithCategories(int id)
        {
            using (var context = new BorsaContext())
            {
                return context.Products.Where(x => x.Id == id).Include(x => x.ProductCategories).ThenInclude(x => x.Category).FirstOrDefault();
            }
        }

        public Product GetProductDetails(int id)
        {
            using (var context = new BorsaContext())
            {
                return context.Products.Where(x => x.Id == id).Include(x => x.ProductCategories).ThenInclude(x => x.Category).FirstOrDefault();
            }
        }

        public List<Product> GetProductsByCategory(string category, int page, int pageSize)
        {
            using (var context = new BorsaContext())
            {
                var products = context.Products.AsQueryable();

                if (!string.IsNullOrEmpty(category))
                {
                    products = products.Include(x => x.ProductCategories).ThenInclude(x => x.Category).Where(x => x.ProductCategories.Any(z => z.Category.Name.ToLower() == category.ToLower()));
                }
                //paging
                return products.Skip((page - 1) * pageSize).Take(pageSize).ToList();
            }
        }

        public int GetProductsByCategory(string category)
        {
            using (var context = new BorsaContext())
            {
                var products = context.Products.AsQueryable();

                if (!string.IsNullOrEmpty(category))
                {
                    products = products.Include(x => x.ProductCategories).ThenInclude(x => x.Category).Where(x => x.ProductCategories.Any(z => z.Category.Name.ToLower() == category.ToLower()));
                }
                return products.Count();
            }

        }

        public void Update(Product entity, int[] categoryIds)
        {
            using (var context = new BorsaContext())
            {
                var product = context.Products.Include(x => x.ProductCategories).FirstOrDefault(x => x.Id == entity.Id);

                if (product != null)
                {
                    product.Name = entity.Name;
                    product.Brand = entity.Brand;
                    product.Description = entity.Description;
                    product.Stock = entity.Stock;
                    product.ImageUrl = entity.ImageUrl;
                    product.Price = entity.Price;
                    product.DiscountedPrice = entity.DiscountedPrice;


                    product.ProductCategories = categoryIds.Select(catid => new ProductCategory()
                    {
                        CategoryId = catid,
                        ProductId = entity.Id
                    }).ToList();

                    context.SaveChanges();
                }
            }
        }
    }
}
