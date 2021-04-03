using Borsa.Business.Abstract;
using Borsa.WebUI.Identity;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.Controllers
{
    public class StatisticController : Controller
    {
        private IOrderService _orderService;
        private IOrderItemService _orderıtemService;
        private IProductService _productService;
        private ICategoryService _categoryService;
        private UserManager<ApplicationUser> _userManager;
        private RoleManager<IdentityRole> _roleManager;
        public StatisticController(IOrderService orderService, IOrderItemService orderıtemService, IProductService productService, ICategoryService categoryService, UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            _orderService = orderService;
            _orderıtemService = orderıtemService;
            _productService = productService;
            _categoryService = categoryService;
            _userManager = userManager;
            _roleManager = roleManager;
        }
        public IActionResult Index()
        {
            // Order Statistics
            var values1 = _orderService.GetAll().Count().ToString();
            ViewBag.d1 = values1;
            var values2 = _orderService.GetAll().GroupBy(x => x.FirstName).OrderByDescending(y => y.Count()).Select(z => z.Key).FirstOrDefault();
            ViewBag.d2 = values2;
            var values3 = _orderService.GetAll().GroupBy(x => x.City).OrderByDescending(y => y.Count()).Select(z => z.Key).FirstOrDefault();
            ViewBag.d3 = values3;
            var values4 = _orderıtemService.GetAll().Sum(x => x.Price).ToString();
            ViewBag.d4 = values4;

            // Product Statistics
            var values5 = _productService.GetAll().Count().ToString();
            ViewBag.d5 = values5;
            var values6 = _productService.GetAll().OrderByDescending(x => x.Price).Select(y => y.Name).FirstOrDefault();
            ViewBag.d6 = values6;
            var values7 = _productService.GetAll().OrderBy(x => x.Price).Select(y => y.Name).FirstOrDefault();
            ViewBag.d7 = values7;
            var values8 = _productService.GetAll().Select(x => x.Brand).Distinct().Count().ToString();
            ViewBag.d8 = values8;

            // Stock Statistics,
            var values9 = _productService.GetAll().Sum(x => x.Stock).ToString();
            ViewBag.d9 = values9;
            var values10 = _productService.GetAll().OrderBy(x => x.Stock).Select(y => y.Name).FirstOrDefault();
            ViewBag.d10 = values10;
            var values11 = _productService.GetAll().OrderByDescending(x => x.Stock).Select(y => y.Name).FirstOrDefault();
            ViewBag.d11 = values11;
            var values12 = _productService.GetAll().Count(x => x.Stock < 60).ToString();
            ViewBag.d12 = values12;

            // Mixed Statistics
            var values13 = _categoryService.GetAll().Count().ToString();
            ViewBag.d13 = values13;
            var values14 = _productService.GetAll().GroupBy(x => x.Brand).OrderByDescending(y => y.Count()).Select(z => z.Key).FirstOrDefault();
            ViewBag.d14 = values14;
            var values15 = _roleManager.Roles.Count().ToString();
            ViewBag.d15 = values15;
            var values16 = _userManager.Users.Count().ToString();
            ViewBag.d16 = values16;         

            return View();
        }
    }
}
