using Borsa.Business.Abstract;
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
    [Authorize(Roles = "Admin")]
    public class CategoryController : Controller
    {
        private ICategoryService _categoryService;
        public CategoryController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }
        public IActionResult Index()
        {
            return View(new CategoryListModel()
            {
                Categories = _categoryService.GetAll().Where(x=>x.Status==true).ToList()
            });
        }
        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(CategoryModel model)
        {
            var entity = new Category()
            {
                Name = model.Name,
                Status = model.Status = true
            };
            _categoryService.Create(entity);
            return RedirectToAction("Index");
        }
        [HttpGet]
        public IActionResult Update(int id)
        {
            var entity = _categoryService.GetByIdWithProducts(id);

            return View(new CategoryModel()
            {
                Id = entity.Id,
                Name = entity.Name,
                Products = entity.ProductCategories.Select(x => x.Product).ToList()
            });
        }
        [HttpPost]
        public IActionResult Update(CategoryModel model)
        {
            var entity = _categoryService.GetById(model.Id);
            if (entity == null)
            {
                return NotFound();
            }
            entity.Name = model.Name;
            _categoryService.Update(entity);
            return RedirectToAction("Index");
        }
        public IActionResult Delete(CategoryModel model)
        {
            var entity = _categoryService.GetById(model.Id);
            entity.Status = false;
            _categoryService.Update(entity);
            return RedirectToAction("Index");
        }
    }
}
