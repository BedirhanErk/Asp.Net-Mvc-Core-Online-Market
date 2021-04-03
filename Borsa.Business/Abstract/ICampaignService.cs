using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Business.Abstract
{
    public interface ICampaignService
    {
        Campaign GetById(int id);
        List<Campaign> GetAll();
        void Create(Campaign entity);
        void Update(Campaign entity);
        void Delete(Campaign entity);
    }
}
