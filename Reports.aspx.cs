using System;
using System.Collections.Generic;
using System.Linq;
using HeritageCare_Solution.backend;

namespace HeritageCare_Solution
{
    // reports page that summarises and filters heritage sites by condition
    public partial class Reports : System.Web.UI.Page
    {
        // runs when the page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            // if there is no session, redirect to login
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            } // end of if block for no session

            // load the report on the first visit and after filter changes
            if (!IsPostBack)
            {
                LoadReport();
            } // end of if block for first load
        } // end of Page_Load method

        // method that loads the summary cards and the filtered table
        private void LoadReport()
        {
            // get the current user's id
            int userId = Convert.ToInt32(Session["UserId"]);

            // get all of this user's sites from the service
            soap_methods service = new soap_methods();
            List<Site> allSites = service.ViewSites().Where(s => s.UserId == userId).ToList();

            // fill the summary cards
            lblGood.Text = allSites.Count(s => s.Condition == "Good").ToString();
            lblFair.Text = allSites.Count(s => s.Condition == "Fair").ToString();
            lblPoor.Text = allSites.Count(s => s.Condition == "Poor").ToString();
            lblRestoration.Text = allSites.Count(s => s.Condition == "Restoration").ToString();

            // get the selected condition
            string condition = ddlCondition.SelectedValue;

            // pick the list to show
            List<Site> display;

            if (string.IsNullOrEmpty(condition))
            {
                display = allSites;
            } // end of if block for all sites
            else
            {
                display = service.FilterSitesByCondition(condition).Where(s => s.UserId == userId).ToList();
            } // end of else block for filtered sites

            // bind the list to the repeater
            rptFiltered.DataSource = display;
            rptFiltered.DataBind();

            // update the total count
            lblTotal.Text = display.Count.ToString();

            // show the table when there are rows, otherwise show the empty message
            tableInner.Visible = display.Count > 0;
            reportsEmpty.Visible = display.Count == 0;
        } // end of LoadReport method

        // event handler that reloads the report when the condition changes
        protected void filter_changed(object sender, EventArgs e)
        {
            LoadReport();
        } // end of filter_changed method


    } // end of Reports class


} // end of HeritageCare_Solution namespace