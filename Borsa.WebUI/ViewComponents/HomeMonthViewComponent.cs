using Borsa.Business.Abstract;
using Borsa.WebUI.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.ViewComponents
{
    public class HomeMonthViewComponent : ViewComponent
    {
        private IProductService _productService;
        public HomeMonthViewComponent(IProductService productService)
        {
            _productService = productService;
        }
        public IViewComponentResult Invoke()
        {
            return View(new ProductListModel
            {
                Products = _productService.GetAll().Where(x => x.HomeMonth==true).Take(6).ToList()
            });
        }
    }
}
