using Borsa.Business.Abstract;
using Borsa.Entities;
using Borsa.WebUI.Identity;
using Borsa.WebUI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        private IProductService _productService;
        private UserManager<ApplicationUser> _userManager;
        private SignInManager<ApplicationUser> _signInManager;
        private ICampaignService _campaignService;
        public AdminController(IProductService productService, UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, ICampaignService campaignService)
        {
            _productService = productService;
            _userManager = userManager;
            _signInManager = signInManager;
            _campaignService = campaignService;
        }
        public IActionResult Dashboard()
        {
            var values1 = _productService.GetAll().Count().ToString();
            ViewBag.d1 = values1;
            var values2 = _productService.GetAll().Select(x => x.Brand).Distinct().Count().ToString();
            ViewBag.d2 = values2;
            var values3 = _productService.GetAll().Count(x => x.Stock < 60).ToString();
            ViewBag.d3 = values3;
            var values4 =_userManager.Users.Count().ToString();
            ViewBag.d4 = values4;
            return View();
        }
        public IActionResult HomeMonth()
        {
            return View(new ProductListModel()
            {
                Products = _productService.GetAll()
            });
        }
        [HttpGet]
        public IActionResult UpdateMonth(int id)
        {

            var entity = _productService.GetById(id);
            return View(new ProductModel()
            {
                Id = entity.Id,
                Name = entity.Name,
                HomeMonth = entity.HomeMonth,
            });
        }
        [HttpPost]
        public IActionResult UpdateMonth(ProductModel model)
        {
            var entity = _productService.GetById(model.Id);
            if (entity == null)
            {
                return NotFound();
            }
            entity.HomeMonth = model.HomeMonth;
            _productService.Update(entity);
            return RedirectToAction("HomeMonth");
        }

        public IActionResult HomeToday()
        {
            return View(new ProductListModel()
            {
                Products = _productService.GetAll()
            });
        }
        [HttpGet]
        public IActionResult UpdateToday(int id)
        {

            var entity = _productService.GetById(id);
            return View(new ProductModel()
            {
                Id = entity.Id,
                Name = entity.Name,
                HomeToday = entity.HomeToday,
            });
        }
        [HttpPost]
        public IActionResult UpdateToday(ProductModel model)
        {
            var entity = _productService.GetById(model.Id);
            if (entity == null)
            {
                return NotFound();
            }
            entity.HomeToday = model.HomeToday;
            _productService.Update(entity);
            return RedirectToAction("HomeToday");
        }
        public IActionResult HomePopular()
        {
            return View(new ProductListModel()
            {
                Products = _productService.GetAll()
            });
        }
        [HttpGet]
        public IActionResult UpdatePopular(int id)
        {

            var entity = _productService.GetById(id);
            return View(new ProductModel()
            {
                Id = entity.Id,
                Name = entity.Name,
                HomePopular = entity.HomePopular,
            });
        }
        [HttpPost]
        public IActionResult UpdatePopular(ProductModel model)
        {
            var entity = _productService.GetById(model.Id);
            if (entity == null)
            {
                return NotFound();
            }
            entity.HomePopular = model.HomePopular;
            _productService.Update(entity);
            return RedirectToAction("HomePopular");
        }
        public IActionResult HomeOffer()
        {
            return View(new ProductListModel()
            {
                Products = _productService.GetAll()
            });
        }
        [HttpGet]
        public IActionResult UpdateOffer(int id)
        {

            var entity = _productService.GetById(id);
            return View(new ProductModel()
            {
                Id = entity.Id,
                Name = entity.Name,
                HomeOffer = entity.HomeOffer,
            });
        }
        [HttpPost]
        public IActionResult UpdateOffer(ProductModel model)
        {
            var entity = _productService.GetById(model.Id);
            if (entity == null)
            {
                return NotFound();
            }
            entity.HomeOffer = model.HomeOffer;
            _productService.Update(entity);
            return RedirectToAction("HomeOffer");
        }    
        public IActionResult Campaigns()
        {
            return View(new CampaignsListModel()
            {
                Campaigns = _campaignService.GetAll()
            });
        }
        public IActionResult DeleteCampaigns(CampaignsModel model)
        {
            var entity = _campaignService.GetById(model.Id);
            _campaignService.Delete(entity);
            return RedirectToAction("Campaigns");
        }
        [HttpGet]
        public IActionResult CreateCampaigns()
        {
            return View();
        }
        [HttpPost]
        public IActionResult CreateCampaigns(CampaignsModel model)
        {
            var entity = new Campaign()
            {
                Description = model.Description
            };
            _campaignService.Create(entity);
            return RedirectToAction("Campaigns");
        }
        [HttpGet]
        public IActionResult UpdateCampaigns(int id)
        {
            var entity = _campaignService.GetById(id);

            return View(new CampaignsModel()
            {
                Id = entity.Id,
                Description = entity.Description,
            });
        }
        [HttpPost]
        public IActionResult UpdateCampaigns(CampaignsModel model)
        {
            var entity = _campaignService.GetById(model.Id);
            if (entity == null)
            {
                return NotFound();
            }
            entity.Description = model.Description;
            _campaignService.Update(entity);
            return RedirectToAction("Campaigns");
        }
    }
}
