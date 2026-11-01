
using System.Collections.Generic;
using System.Web.Services;
using HeritageCare_Solution.backend;
//<%@ WebService Language = "C#" Class="HeritageCare_Solution.soap_methods" %>

namespace HeritageCare_Solution
{
    // SOAP web service that exposes the heritage site methods
    [WebService(Namespace = "http://localhost/HeritageCare_Solution/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class soap_methods : System.Web.Services.WebService
    {
        // soap method that returns all heritage sites
        [WebMethod]
        public List<Site> ViewSites()
        {
            return new HeritageCare_Solution.backend.soap_methods_support().ViewSites();
        } // end of ViewSites method

        // soap method that adds a new heritage site
        [WebMethod]
        public string AddSite(int userId, string siteName, string location, string condition, string description)
        {
            return new HeritageCare_Solution.backend.soap_methods_support().AddSite(userId, siteName, location, condition, description);
        } // end of AddSite method

        // soap method that deletes a heritage site by id
        [WebMethod]
        public string DeleteSite(int siteId)
        {
            return new HeritageCare_Solution.backend.soap_methods_support().DeleteSite(siteId);
        } // end of DeleteSite method

        // soap method that returns sites filtered by condition
        [WebMethod]
        public List<Site> FilterSitesByCondition(string condition)
        {
            return new HeritageCare_Solution.backend.soap_methods_support().FilterSitesByCondition(condition);
        } // end of FilterSitesByCondition method

        // soap method that updates an existing heritage site
        [WebMethod]
        public string UpdateSite(int siteId, string siteName, string location, string condition, string description)
        {
            return new HeritageCare_Solution.backend.soap_methods_support().UpdateSite(siteId, siteName, location, condition, description);
        } // end of UpdateSite method


    } // end of soap_method class


} // end of HeritageCare_Solution namespace