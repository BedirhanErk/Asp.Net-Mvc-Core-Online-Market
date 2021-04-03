using Borsa.DataAccess.Abstract;
using Borsa.Entities;
using Borsa.WebUI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.Controllers
{
    public class ContactController : Controller
    {
        private IContactRepository _contactRepository;
        public ContactController(IContactRepository contactRepository)
        {
            _contactRepository = contactRepository;
        }
        [Authorize(Roles = "Admin")]
        public IActionResult Index()
        {
            return View(new ContactListModel()
            {
                Contacts = _contactRepository.GetAll()
            });
        }
        public IActionResult Delete(ContactModel model)
        {
            var entity =_contactRepository.GetById(model.Id);
            _contactRepository.Delete(entity);
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(ContactModel model)
        {
            var entity = new Contact()
            {
                Name = model.Name,
                Email = model.Email,
                Message = model.Message
            };
            _contactRepository.Create(entity);

            return RedirectToAction("Create");
        }
    }
}
