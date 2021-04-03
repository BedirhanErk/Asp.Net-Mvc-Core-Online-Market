using Borsa.Business.Abstract;
using Borsa.Entities;
using Borsa.WebUI.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.Controllers
{
    public class HomePageController : Controller
    {
        private IProductService _productService;

        public HomePageController(IProductService productService)
        {
            _productService = productService;

        }
        public IActionResult Index()
        {
            return View(new ProductListModel
            {
                Products = _productService.GetAll()
            });
        }
        public PartialViewResult Slider()
        {
            return PartialView();
        }
        public PartialViewResult HomeCategory()
        {
            return PartialView();
        }
        public IActionResult ProductList(string category, int page = 1)
        {         
            const int pageSize = 9;
            return View(new ProductListModel
            {               
                PageInfo = new PageInfo()
                {
                    TotalItems = _productService.GetCountByCategory(category),
                    CurrentPage = page,
                    ItemsPerPage = pageSize,
                    CurrentCategory = category
                },
                Products = _productService.GetProductsByCategory(category, page, pageSize),
            });
           
        }
        public PartialViewResult PartialProductList()
        {
            return PartialView();
        }
        public IActionResult ProductDetails(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            Product product = _productService.GetProductDetails((int)id);
            if (product == null)
            {
                return NotFound();
            }
            return View(new ProductDetailsModel()
            {
                Product = product,
                Categories = product.ProductCategories.Select(x => x.Category).ToList()
            });
        }
        public IActionResult AboutUs()
        {
            return View();
        }
        public IActionResult SearchProduct(string q)
        {
            var word = HttpContext.Request.Query["q"].ToString();
            return View(new ProductListModel
            {
                Products = _productService.GetAll().Where(x=>x.Name.ToLower().Contains(word.ToLower()) == word.ToLower().Contains(word.ToLower())).ToList()
            });
        }
    }
}
