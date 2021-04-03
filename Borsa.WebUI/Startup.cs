using Borsa.Business.Abstract;
using Borsa.Business.Concrete;
using Borsa.DataAccess.Abstract;
using Borsa.DataAccess.Concrete.EfCore;
using Borsa.WebUI.EmailServices;
using Borsa.WebUI.Identity;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<ApplicationIdentityDbContext>(options => options.UseSqlServer(Configuration.GetConnectionString("IdentityConnection")));

            services.AddIdentity<ApplicationUser, IdentityRole>().AddEntityFrameworkStores<ApplicationIdentityDbContext>().AddDefaultTokenProviders();

            services.Configure<IdentityOptions>(options =>
            {
                options.Password.RequireDigit = true;
                options.Password.RequireLowercase = true;
                options.Password.RequiredLength = 3;
                options.Password.RequireNonAlphanumeric = true;
                options.Password.RequireUppercase = true;

                options.Lockout.MaxFailedAccessAttempts = 5;
                options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromSeconds(5);
                options.Lockout.AllowedForNewUsers = true;

                options.User.RequireUniqueEmail = true;

                options.SignIn.RequireConfirmedEmail = true;
                options.SignIn.RequireConfirmedPhoneNumber = false;

            });

            services.ConfigureApplicationCookie(options =>
            {
                options.LoginPath = "/Account/Login";
                options.LogoutPath = "/Account/Logout";
                options.AccessDeniedPath = "/Account/AccessDenied";
                options.SlidingExpiration = false;

                options.ExpireTimeSpan = TimeSpan.FromDays(1);

                options.Cookie = new CookieBuilder
                {
                    HttpOnly = true,
                    Name = "Borsa.Security.Cookie",
                    SameSite = SameSiteMode.Strict
                };
            });


            services.AddScoped<IProductRepository, EfProductRepository>();
            services.AddScoped<ICategoryRepository, EfCategoryRepository>();
            services.AddScoped<ICartRepository, EfCartReposiory>();
            services.AddScoped<IOrderRepository, EfOrderRepository>();
            services.AddScoped<IContactRepository, EfContactRepository>();
            services.AddScoped<IOrderItemRepository, EfOrderItemRepository>();
            services.AddScoped<ICampaignRepository, EfCampaignRepository>();
            services.AddScoped<ICustomerAddressRepository, EfCustomerAddressRepository>();
            services.AddScoped<ICustomerCardRepository, EfCustomerCardRepository>();

            services.AddScoped<IProductService, ProductManager>();
            services.AddScoped<ICategoryService, CategoryManager>();
            services.AddScoped<ICartService, CartManager>();
            services.AddScoped<IOrderService, OrderManager>();
            services.AddScoped<IContactService, ContactManager>();
            services.AddScoped<IOrderItemService, OrderItemManager>();
            services.AddScoped<ICampaignService, CampaignManager>();
            services.AddScoped<ICustomerAddressService, CustomerAddressManager>();
            services.AddScoped<ICustomerCardService, CustomerCardManager>();

            services.AddScoped<IEmailSender, SmtpEmailSender>(x => new SmtpEmailSender(Configuration["EmailSender:Host"],
                Configuration.GetValue<int>("EmailSender:Port"), Configuration.GetValue<bool>("EmailSender:EnableSSL"),
                Configuration["EmailSender:UserName"],
                Configuration["EmailSender:Password"]
                ));

            services.AddControllersWithViews();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseAuthentication();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                  name: "admin",
                  pattern: "admin",
                  defaults: new { controller = "AdminLogin", action = "AdminLogin" }
                  );

                endpoints.MapControllerRoute(
                  name: "adminProducts",
                  pattern: "admin/products",
                  defaults: new { controller = "Admin", action = "ProductList" }
                  );

                endpoints.MapControllerRoute(
                 name: "adminProducts",
                 pattern: "admin/products/{id?}",
                 defaults: new { controller = "Admin", action = "EditProduct" }
                 );

                endpoints.MapControllerRoute(
                 name: "cart",
                 pattern: "cart",
                 defaults: new { controller = "Cart", action = "Index" }
                 );

                endpoints.MapControllerRoute(
                 name: "orders",
                 pattern: "orders",
                 defaults: new { controller = "Cart", action = "GetOrders" }
                 );

                endpoints.MapControllerRoute(
                 name: "checkout",
                 pattern: "checkout",
                 defaults: new { controller = "Cart", action = "Checkout" }
                 );

                endpoints.MapControllerRoute(
                   name: "products",
                   pattern: "products/{category?}",
                   defaults: new { controller = "HomePage", action = "ProductList" }
                   );

                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=HomePage}/{action=Index}/{id?}");
            });
        }
    }
}
