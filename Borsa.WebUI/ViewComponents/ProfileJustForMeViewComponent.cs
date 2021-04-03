using Borsa.Business.Abstract;
using Borsa.WebUI.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.ViewComponents
{
    public class ProfileJustForMeViewComponent : ViewComponent
    {
        private IProductService _productService;
        public ProfileJustForMeViewComponent(IProductService productService)
        {
            _productService = productService;
        }
        public IViewComponentResult Invoke()
        {
            return View(new ProductListModel
            {
                Products = _productService.GetAll().OrderByDescending(x => x.Id).Take(2).ToList()
            });
        }
    }
}
