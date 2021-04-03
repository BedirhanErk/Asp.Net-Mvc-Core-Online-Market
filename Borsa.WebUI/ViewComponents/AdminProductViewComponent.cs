using Borsa.Business.Abstract;
using Borsa.WebUI.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.ViewComponents
{

    public class AdminProductViewComponent : ViewComponent
    {
        private IProductService _productService;
        public AdminProductViewComponent(IProductService productService)
        {
            _productService = productService;
        }
        public IViewComponentResult Invoke()
        {
            return View(new ProductListModel()
            {
                Products = _productService.GetAll().OrderByDescending(x=>x.Price).Take(4).ToList()
            });
        }
    }
}
