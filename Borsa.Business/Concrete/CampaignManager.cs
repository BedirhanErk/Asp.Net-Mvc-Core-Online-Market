using Borsa.Business.Abstract;
using Borsa.DataAccess.Abstract;
using Borsa.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Borsa.Business.Concrete
{
    public class CampaignManager : ICampaignService
    {
        private ICampaignRepository _campaignRepository;
        public CampaignManager(ICampaignRepository campaignRepository)
        {
            _campaignRepository = campaignRepository;
        }

        public void Create(Campaign entity)
        {
            _campaignRepository.Create(entity);
        }

        public void Delete(Campaign entity)
        {
            _campaignRepository.Delete(entity);
        }

        public List<Campaign> GetAll()
        {
            return _campaignRepository.GetAll();
        }

        public Campaign GetById(int id)
        {
            return _campaignRepository.GetById(id);
        }

        public void Update(Campaign entity)
        {
            _campaignRepository.Update(entity);
        }
    }
}
