using Borsa.Business.Abstract;
using Borsa.Entities;
using Borsa.WebUI.Identity;
using Borsa.WebUI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.Controllers
{
    public class CustomerController : Controller
    {
        private UserManager<ApplicationUser> _userManager;
        private ICustomerAddressService _customerAddressService;
        private ICustomerCardService _customerCardService;
        public CustomerController(UserManager<ApplicationUser> userManager, ICustomerAddressService customerAddressService, ICustomerCardService customerCardService)
        {
            _userManager = userManager;
            _customerAddressService = customerAddressService;
            _customerCardService = customerCardService;
        }

        [HttpGet]
        public IActionResult Profile()
        {
            var userid = _userManager.GetUserId(HttpContext.User);
            if (userid == null)
            {
                return RedirectToAction("Login", "Account");
            }
            else
            {
                ApplicationUser user = _userManager.FindByIdAsync(userid).Result;
                return View(user);
            }
        }
        [HttpPost]
        public async Task<IActionResult> Profile(ApplicationUser applicationUser, IFormFile file)
        {
            var userid = _userManager.GetUserId(HttpContext.User);
            ApplicationUser user = _userManager.FindByIdAsync(userid).Result;
            if (user == null)
            {
                return NotFound();
            }
            user.FullName = applicationUser.FullName;
            user.Email = applicationUser.Email;
            user.PhoneNumber = applicationUser.PhoneNumber;
            user.Birthday = applicationUser.Birthday;


            if (file != null)
            {
                user.Image = file.FileName;

                var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\img", file.FileName);
                using (var stream = new FileStream(path, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }
            }

            await _userManager.UpdateAsync(user);
            return RedirectToAction("Profile");
        }
        public IActionResult Address()
        {
            var userid = _userManager.GetUserId(HttpContext.User);
            return View(new CustomerAddressListModel()
            {
                CustomerAddresses = _customerAddressService.GetAll().Where(x => x.UserId == userid).ToList()
            });
        }
        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(CustomerAddressModel model)
        {
            var userid = _userManager.GetUserId(HttpContext.User);
            var entity = new CustomerAddress()
            {
                FirstName = model.FirstName,
                LastName = model.LastName,
                Address = model.Address,
                City = model.City,
                District = model.District,
                Phone = model.Phone,
                AddressTitle = model.AddressTitle,
                UserId = userid
            };
            _customerAddressService.Create(entity);
            return RedirectToAction("Address");
        }
        public IActionResult Delete(CustomerAddressModel model)
        {
            var entity = _customerAddressService.GetById(model.Id);
            _customerAddressService.Delete(entity);
            return RedirectToAction("Address");
        }
        [HttpGet]
        public IActionResult Update(int id)
        {
            var entity = _customerAddressService.GetById(id);

            return View(new CustomerAddressModel()
            {
                Id = entity.Id,
                FirstName = entity.FirstName,
                LastName = entity.LastName,
                Address = entity.Address,
                City = entity.City,
                District = entity.District,
                Phone = entity.Phone,
                AddressTitle = entity.AddressTitle
            });
        }
        [HttpPost]
        public IActionResult Update(CustomerAddressModel model)
        {
            var entity = _customerAddressService.GetById(model.Id);
            if (entity == null)
            {
                return NotFound();
            }
            entity.FirstName = model.FirstName;
            entity.LastName = model.LastName;
            entity.Address = model.Address;
            entity.City = model.City;
            entity.District = model.District;
            entity.Phone = model.Phone;
            entity.AddressTitle = model.AddressTitle;
            _customerAddressService.Update(entity);
            return RedirectToAction("Address");
        }
        public IActionResult Card()
        {
            var userid = _userManager.GetUserId(HttpContext.User);
            return View(new CustomerCardListModel()
            {
                CustomerCards = _customerCardService.GetAll().Where(x => x.UserId == userid).ToList()
            });
        }
        [HttpGet]
        public IActionResult CreateCard()
        {
            return View();
        }
        [HttpPost]
        public IActionResult CreateCard(CustomerCardModel model)
        {
            var userid = _userManager.GetUserId(HttpContext.User);
            var entity = new CustomerCard()
            {
                CardTitle = model.CardTitle,
                CardName = model.CardName,
                CardNumber = model.CardNumber,
                ExpirationMonth = model.ExpirationMonth,
                ExpirationYear = model.ExpirationYear,
                Cvv = model.Cvv,
                UserId = userid
            };
            _customerCardService.Create(entity);
            return RedirectToAction("Card");
        }
        public IActionResult DeleteCard(CustomerCardModel model)
        {
            var entity = _customerCardService.GetById(model.Id);
            _customerCardService.Delete(entity);
            return RedirectToAction("Card");
        }
        [HttpGet]
        public IActionResult UpdateCard(int id)
        {
            var entity = _customerCardService.GetById(id);

            return View(new CustomerCardModel()
            {
                Id = entity.Id,
                CardTitle = entity.CardTitle,
                CardName = entity.CardName,
                CardNumber = entity.CardNumber,
                ExpirationYear = entity.ExpirationYear,
                ExpirationMonth = entity.ExpirationMonth,
                Cvv = entity.Cvv
            });
        }
        [HttpPost]
        public IActionResult UpdateCard(CustomerCardModel model)
        {
            var entity = _customerCardService.GetById(model.Id);
            if (entity == null)
            {
                return NotFound();
            }
            entity.CardTitle = model.CardTitle;
            entity.CardName = model.CardName;
            entity.CardNumber = model.CardNumber;
            entity.ExpirationYear = model.ExpirationYear;
            entity.ExpirationMonth = model.ExpirationMonth;
            entity.Cvv = model.Cvv;
            _customerCardService.Update(entity);
            return RedirectToAction("Card");
        }
    }
}