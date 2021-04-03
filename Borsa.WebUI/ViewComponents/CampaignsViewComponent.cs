using Borsa.Business.Abstract;
using Borsa.WebUI.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Borsa.WebUI.ViewComponents
{
    public class CampaignsViewComponent : ViewComponent
    {
        private ICampaignService _campaignService;
        public CampaignsViewComponent(ICampaignService campaignService)
        {
            _campaignService = campaignService;
        }
        public IViewComponentResult Invoke()
        {
            return View(new CampaignsListModel()
            {
                Campaigns = _campaignService.GetAll()
            });
        }
    }
}
