using System;
using System.Collections.Generic;
using System.Linq;
using HeritageCare_Solution.backend;

namespace HeritageCare_Solution
{
    // overview page that greets the user and summarises their heritage sites
    public partial class DashboardHome : System.Web.UI.Page
    {

        //load all info on load
        protected void Page_Load(object sender, EventArgs e)
        {
            // if there is no session, redirect to login
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            } // end of if block for no session

            // show the user's name
            lblName.Text = Session["FullName"].ToString();

            // show the greeting based on the time of day
            lblGreeting.Text = GetGreeting();

            // get the current user's id
            int userId = Convert.ToInt32(Session["UserId"]);

            // get all sites from the service, then filter to this user
            soap_methods service = new soap_methods();
            List<Site> sites = service.ViewSites();
            List<Site> mySites = sites.Where(s => s.UserId == userId).ToList();

            // fill the cards
            lblSiteCount.Text = mySites.Count.ToString();
            lblGoodCount.Text = mySites.Count(s => s.Condition == "Good").ToString();
            lblPoorCount.Text = mySites.Count(s => s.Condition == "Poor").ToString();

            if (mySites.Count > 0)
            {
                Site latest = mySites.OrderByDescending(s => s.CreatedAt).First();
                lblLatest.Text = latest.SiteName;
            }


        } // end of Page_Load method



        // method that returns a greeting based on the current hour
        private string GetGreeting()
        {
            int hour = DateTime.Now.Hour;

            if (hour < 12) return "Good morning";
            if (hour < 17) return "Good afternoon";
            return "Good evening";
        } // end of GetGreeting method


    } // end of DashboardHome class


} // end of HeritageCare_Solution namespace