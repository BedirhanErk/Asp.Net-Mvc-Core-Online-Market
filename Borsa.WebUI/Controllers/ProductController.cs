using Borsa.Business.Abstract;
using Borsa.Entities;
using Borsa.WebUI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ProductController : Controller
    {
        private IProductService _productService;
        private ICategoryService _categoryService;
        public ProductController(IProductService productService, ICategoryService categoryService)
        {
            _productService = productService;
            _categoryService = categoryService;
        }
        public IActionResult Index()
        {
            return View(new ProductListModel()
            {
                Products = _productService.GetAll().Where(x => x.Status == true).ToList()
            });
        }
        [HttpGet]
        public IActionResult Create()
        {
            return View(new ProductModel());
        }
        [HttpPost]
        public async Task<IActionResult> Create(ProductModel model, IFormFile file)
        {
            if (ModelState.IsValid)
            {
                var entity = new Product()
                {
                    Name = model.Name,
                    Brand = model.Brand,
                    Price = model.Price,
                    DiscountedPrice = model.DiscountedPrice,
                    Description = model.Description,
                    Stock = model.Stock,
                    Status = model.Status =true
                };

                if (file != null)
                {
                    entity.ImageUrl = file.FileName;

                    var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\img", file.FileName);
                    using (var stream = new FileStream(path, FileMode.Create))
                    {
                        await file.CopyToAsync(stream);
                    }
                }

                if (_productService.Create(entity))
                {
                    return RedirectToAction("Index");
                }

                ViewBag.ErrorMessage = _productService.ErorMessage;
                return View(model);
            }

            return View(model);
        }
        public IActionResult Delete(ProductModel model)
        {
            var entity = _productService.GetById(model.Id);
            entity.Status = false;
            _productService.Update(entity);
            return RedirectToAction("Index");
        }
        [HttpGet]
        public IActionResult Update(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var entity = _productService.GetByIdWithCategories((int)id);
            if (entity == null)
            {
                return NotFound();
            }

            var model = new ProductModel()
            {
                Id = entity.Id,
                Name = entity.Name,
                Brand = entity.Brand,
                Price = entity.Price,
                DiscountedPrice = entity.DiscountedPrice,
                Description = entity.Description,
                Stock = entity.Stock,
                ImageUrl = entity.ImageUrl,
                SelectedCategories = entity.ProductCategories.Select(x => x.Category).ToList()
            };
            ViewBag.Categories = _categoryService.GetAll();

            return View(model);
        }
        [HttpPost]
        public async Task<IActionResult> Update(ProductModel model, int[] categoryIds, IFormFile file)
        {
            if (ModelState.IsValid)
            {
                var entity = _productService.GetById(model.Id);
                if (entity == null)
                {
                    return NotFound();
                }

                entity.Name = model.Name;
                entity.Brand = model.Brand;
                entity.Description = model.Description;
                entity.Stock = model.Stock;
                entity.Price = model.Price;
                entity.DiscountedPrice = model.DiscountedPrice;

                if (file != null)
                {
                    entity.ImageUrl = file.FileName;

                    var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\img", file.FileName);
                    using (var stream = new FileStream(path, FileMode.Create))
                    {
                        await file.CopyToAsync(stream);
                    }
                }

                _productService.Update(entity, categoryIds);

                return RedirectToAction("Index");
            }

            ViewBag.Categories = _categoryService.GetAll();

            return View(model);
        }
    }
}
