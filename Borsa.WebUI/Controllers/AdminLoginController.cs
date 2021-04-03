using Borsa.WebUI.Identity;
using Borsa.WebUI.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.Controllers
{
    public class AdminLoginController : Controller
    {
        private UserManager<ApplicationUser> _userManager;
        private SignInManager<ApplicationUser> _signInManager;
        public AdminLoginController(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager)
        {
            _userManager = userManager;
            _signInManager = signInManager;
        }
        public IActionResult AdminLogin(string ReturnUrl = null)
        {

            return View(new LoginModel()
            {
                ReturnUrl = ReturnUrl
            });
        }
        [HttpPost]
        public async Task<IActionResult> AdminLogin(LoginModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var user = await _userManager.FindByEmailAsync(model.Email);

            if (user == null)
            {
                ModelState.AddModelError("", "No user has been created with this e-mail address before.");
                return View(model);
            }

            if (!await _userManager.IsEmailConfirmedAsync(user))
            {
                ModelState.AddModelError("", "Please confirm your account by mail.");
                return View(model);
            }


            var result = await _signInManager.PasswordSignInAsync(user, model.Password, true, false);

            if (result.Succeeded)
            {
                return Redirect(model.ReturnUrl ?? "~/Admin/Dashboard");
            }
            ModelState.AddModelError("", "Your password or email address is incorrect.");



            return View(model);
        }
    }
}
