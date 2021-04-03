using Borsa.DataAccess.Concrete.EfCore;
using Borsa.WebUI.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.Controllers
{
    public class GraphicController : Controller
    {
        public IActionResult PieChart()
        {
            return View();
        }
        public IActionResult VisualizeProductResult()
        {
            return Json(ProdList());
        }
        public List<PieChartModel> ProdList()
        {
            List<PieChartModel> cls = new List<PieChartModel>();
            using (var c = new BorsaContext())
            {
                cls = c.Products.Select(x => new PieChartModel
                {
                    product = x.Name,
                    stock = x.Stock
                }).ToList();
            }
            return cls;
        }

        public IActionResult LineChart()
        {
            return View();
        }
        public IActionResult VisualizeProductResult2()
        {
            return Json(ProdList2());
        }
        public List<LineChartModel> ProdList2()
        {
            List<LineChartModel> cls = new List<LineChartModel>();
            using (var c = new BorsaContext())
            {
                cls = c.Products.Select(x => new LineChartModel
                {
                    brand = x.Brand,
                    stock = x.Stock
                    
                }).ToList();
            }
            return cls;
        }

        public IActionResult ColumnChart()
        {
            return View();
        }
        public IActionResult VisualizeProductResult3()
        {
            return Json(ProdList3());
        }
        public List<ColumnChartModel> ProdList3()
        {
            List<ColumnChartModel> cls = new List<ColumnChartModel>();
            using (var c = new BorsaContext())
            {
                cls = c.Products.Select(x => new ColumnChartModel
                {
                    product = x.Name,
                    stock = x.Stock
                }).ToList();
            }
            return cls;
        }

    }
}
