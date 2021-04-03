using Borsa.Business.Abstract;
using Borsa.WebUI.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.ViewComponents
{
    public class HomeGalleryViewComponent : ViewComponent
    {
        private IProductService _productService;
        public HomeGalleryViewComponent(IProductService productService)
        {
            _productService = productService;
        }
        public IViewComponentResult Invoke()
        {
            return View(new ProductListModel
            {
                Products = _productService.GetAll().Where(x=>x.HomePopular==true).Take(8).ToList()
            });
        }
    }
}
