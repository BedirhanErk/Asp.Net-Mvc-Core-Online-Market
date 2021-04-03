using Borsa.Business.Abstract;
using Borsa.Entities;
using Borsa.WebUI.Identity;
using Borsa.WebUI.Models;
using IyzipayCore;
using IyzipayCore.Model;
using IyzipayCore.Request;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.Controllers
{
    [Authorize]
    public class CartController : Controller
    {
        private ICartService _cartService;
        private IOrderService _orderService;
        private UserManager<ApplicationUser> _userManager;
        private ICustomerAddressService _customerAddressService;
        private ICustomerCardService _customerCardService;
        public CartController(ICartService cartService, IOrderService orderService, UserManager<ApplicationUser> userManager, ICustomerAddressService customerAddressService, ICustomerCardService customerCardService)
        {
            _cartService = cartService;
            _userManager = userManager;
            _orderService = orderService;
            _customerAddressService = customerAddressService;
            _customerCardService = customerCardService;
        }
        public IActionResult Index()
        {
            var cart = _cartService.GetCartByUserId(_userManager.GetUserId(User));
            return View(new CartModel()
            {
                CartId = cart.Id,
                CartItems = cart.CartItems.Select(i => new CartItemModel()
                {
                    CartItemId = i.Id,
                    ProductId = i.Product.Id,
                    Name = i.Product.Name,
                    Price = (decimal)i.Product.Price,
                    DiscountedPrice = (decimal)i.Product.DiscountedPrice,
                    ImageUrl = i.Product.ImageUrl,
                    Qunatity = i.Quantity
                }).ToList()
            });
        }
        public IActionResult Wishlist()
        {
            var cart = _cartService.GetCartByUserWishlistId(_userManager.GetUserId(User));
            return View(new CartModel()
            {
                CartId = cart.Id,
                WishlistModels = cart.Wishlists.Select(i => new WishlistModel()
                {
                    WishlistId = i.Id,
                    ProductId = i.Product.Id,
                    Name = i.Product.Name,
                    Price = (decimal)i.Product.Price,
                    DiscountedPrice = (decimal)i.Product.DiscountedPrice,
                    ImageUrl = i.Product.ImageUrl,
                }).ToList()
            });
        }
        [HttpPost]
        public IActionResult AddToCart(int productId, int quantity)
        {
            _cartService.AddToCart(_userManager.GetUserId(User), productId, quantity);
            return RedirectToAction("Index");
        }
        [HttpPost]
        public IActionResult AddToWishlist(int productId)
        {
            _cartService.AddToWishlist(_userManager.GetUserId(User), productId);
            return RedirectToAction("Wishlist");
        }
        [HttpPost]
        public IActionResult DeleteFromWishlist(int productId)
        {
            _cartService.DeleteFromWishlist(_userManager.GetUserId(User), productId);
            return RedirectToAction("Wishlist");
        }
        [HttpPost]
        public IActionResult DeleteFromCart(int productId)
        {
            _cartService.DeleteFromCart(_userManager.GetUserId(User), productId);
            return RedirectToAction("Index");
        }
        [HttpGet]
        public IActionResult Checkout()
        {
            var cart = _cartService.GetCartByUserId(_userManager.GetUserId(User));
            var orderModel = new OrderModel();
            orderModel.CartModel = new CartModel()
            {
                CartId = cart.Id,
                CartItems = cart.CartItems.Select(i => new CartItemModel()
                {
                    CartItemId = i.Id,
                    ProductId = i.Product.Id,
                    Name = i.Product.Name,
                    Price = (decimal)i.Product.Price,
                    DiscountedPrice = (decimal)i.Product.DiscountedPrice,
                    ImageUrl = i.Product.ImageUrl,
                    Qunatity = i.Quantity,
                }).ToList()
            };
            return View(orderModel);
        }
        [HttpPost]
        public IActionResult Checkout(OrderModel model)
        {
            if (ModelState.IsValid)
            {
                var userId = _userManager.GetUserId(User);
                var cart = _cartService.GetCartByUserId(userId);
                model.CartModel = new CartModel()
                {                   
                    CartId = cart.Id,
                    CartItems = cart.CartItems.Select(i => new CartItemModel()
                    {
                        CartItemId = i.Id,
                        ProductId = i.Product.Id,
                        Name = i.Product.Name,
                        Price = (decimal)i.Product.Price,
                        DiscountedPrice = (decimal)i.Product.DiscountedPrice,
                        ImageUrl = i.Product.ImageUrl,
                        Qunatity = i.Quantity
                    }).ToList()
                };
                // ÖDEME
                var payment = PaymentProcess(model);
                if (payment.Status == "success")
                {
                    SaveOrder(model, payment, userId);
                    ClearCart(cart.Id.ToString());
                    return View("Success");
                }
            }
            return View(model);
        }

        private void SaveOrder(OrderModel model, Payment payment, string userId)
        {
            var order = new Order();
            order.OrderNumber = new Random().Next(111111, 999999).ToString();
            order.OrderState = "Pending";
            order.PaymentTypes = EnumPaymentTypes.CreditCart;
            order.PaymentId = payment.PaymentId;
            order.ConversationId = payment.ConversationId;
            order.OrderDate = DateTime.Now;
            order.FirstName = model.FirstName;
            order.LastName = model.LastName;
            order.Email = model.Email;
            order.Phone = model.Phone;
            order.Address = model.Address;
            order.City = model.City;
            order.CardName = model.CardName;
            order.CardNumber = model.CardNumber;
            order.ExpirationMonth = model.ExpirationMonth;
            order.ExpirationYear = model.ExpirationYear;
            order.Cvv = model.Cvv;
            order.UserId = userId;
            order.Status = true;

            foreach (var x in model.CartModel.CartItems)
            {
                var orderitem = new OrderItem()
                {
                    Price = x.Price,
                    DiscountedPrice = x.DiscountedPrice,
                    Quantity = x.Qunatity,
                    ProductId = x.ProductId
                };
                order.OrderItems.Add(orderitem);
            }
            _orderService.Create(order);
        }

        private void ClearCart(string cartId)
        {
            _cartService.ClearCart(cartId);
        }

        private Payment PaymentProcess(OrderModel model)
        {
            Options options = new Options();
            options.ApiKey = "sandbox-Z5xplx8ztsKjPmzNS6y7WH86uBBGkshY";
            options.SecretKey = "sandbox-o1XGSGDjaNnorfWnqrYhaSeORBWfti1Z";
            options.BaseUrl = "https://sandbox-api.iyzipay.com";

            CreatePaymentRequest request = new CreatePaymentRequest();
            request.Locale = Locale.TR.ToString();
            request.ConversationId = Guid.NewGuid().ToString();
            request.Price = model.CartModel.TotalPrice().ToString().Split(",")[0];
            request.PaidPrice = model.CartModel.TotalPrice().ToString().Split(",")[0];
            request.Currency = Currency.TRY.ToString();
            request.Installment = 1;
            request.BasketId = model.CartModel.CartId.ToString();
            request.PaymentChannel = PaymentChannel.WEB.ToString();
            request.PaymentGroup = PaymentGroup.PRODUCT.ToString();

            PaymentCard paymentCard = new PaymentCard();
            paymentCard.CardHolderName = model.CardName;
            paymentCard.CardNumber = model.CardNumber;
            paymentCard.ExpireMonth = model.ExpirationMonth;
            paymentCard.ExpireYear = model.ExpirationYear;
            paymentCard.Cvc = model.Cvv;
            paymentCard.RegisterCard = 0;
            request.PaymentCard = paymentCard;


            //paymentCard.CardHolderName = "John Doe";
            //paymentCard.CardNumber = "5528790000000008";
            //paymentCard.ExpireMonth = "12";
            //paymentCard.ExpireYear = "2030";
            //paymentCard.Cvc = "123";

            Buyer buyer = new Buyer();
            buyer.Id = "BY789";
            buyer.Name = "John";
            buyer.Surname = "Doe";
            buyer.GsmNumber = "+905350000000";
            buyer.Email = "email@email.com";
            buyer.IdentityNumber = "74300864791";
            buyer.LastLoginDate = "2015-10-05 12:43:35";
            buyer.RegistrationDate = "2013-04-21 15:12:09";
            buyer.RegistrationAddress = "Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1";
            buyer.Ip = "85.34.78.112";
            buyer.City = "Istanbul";
            buyer.Country = "Turkey";
            buyer.ZipCode = "34732";
            request.Buyer = buyer;

            Address shippingAddress = new Address();
            shippingAddress.ContactName = "Jane Doe";
            shippingAddress.City = "Istanbul";
            shippingAddress.Country = "Turkey";
            shippingAddress.Description = "Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1";
            shippingAddress.ZipCode = "34742";
            request.ShippingAddress = shippingAddress;

            Address billingAddress = new Address();
            billingAddress.ContactName = "Jane Doe";
            billingAddress.City = "Istanbul";
            billingAddress.Country = "Turkey";
            billingAddress.Description = "Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1";
            billingAddress.ZipCode = "34742";
            request.BillingAddress = billingAddress;

            List<BasketItem> basketItems = new List<BasketItem>();
            BasketItem basketItem;
            foreach (var x in model.CartModel.CartItems)
            {
                basketItem = new BasketItem();
                basketItem.Id = x.ProductId.ToString();
                basketItem.Name = x.Name;
                basketItem.Category1 = "Food";
                basketItem.ItemType = BasketItemType.PHYSICAL.ToString();
                basketItem.Price = ((x.Qunatity * x.DiscountedPrice)).ToString().Split(",")[0];

                basketItems.Add(basketItem);
            }
            request.BasketItems = basketItems;
            return Payment.Create(request, options);
        }
    }
}
