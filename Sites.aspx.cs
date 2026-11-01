using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using HeritageCare_Solution.backend;

namespace HeritageCare_Solution
{
    // sites page that shows, filters and deletes heritage sites
    public partial class Sites : System.Web.UI.Page
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

            // only load the sites on the first visit, not on postbacks
            if (!IsPostBack)
            {
                LoadSites();
            } // end of if block for first load
        } // end of Page_Load method

        // method that loads the current user's heritage sites into the repeater
        private void LoadSites()
        {
            // get the current user's id
            int userId = Convert.ToInt32(Session["UserId"]);

            // get all sites from the service, then filter to this user
            soap_methods service = new soap_methods();
            List<Site> sites = service.ViewSites();
            List<Site> mySites = sites.Where(s => s.UserId == userId).OrderByDescending(s => s.CreatedAt).ToList();

            // bind the list to the repeater
            rptSites.DataSource = mySites;
            rptSites.DataBind();
        } // end of LoadSites method

        // event handler that deletes a site after the popup is confirmed
        protected void confirm_delete_site(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(hiddenDeleteId.Value))
            {
                int siteId = Convert.ToInt32(hiddenDeleteId.Value);

                soap_methods service = new soap_methods();
                service.DeleteSite(siteId);
            } // end of if block for valid id

            LoadSites();
        } // end of confirm_delete_site method


        // event handler for buttons inside the repeater rows
        protected void rptSites_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            // if the delete button was clicked
            if (e.CommandName == "DeleteSite")
            {
                int siteId = Convert.ToInt32(e.CommandArgument);

                soap_methods service = new soap_methods();
                service.DeleteSite(siteId);

                LoadSites();
            } // end of if block for delete

            // if the update button was clicked
            if (e.CommandName == "UpdateSite")
            {
                RepeaterItem item = e.Item;

                // get the values from the editable row
                int siteId = Convert.ToInt32(e.CommandArgument);
                TextBox txtEditName = (TextBox)item.FindControl("txtEditName");
                TextBox txtEditLocation = (TextBox)item.FindControl("txtEditLocation");
                DropDownList ddlEditCondition = (DropDownList)item.FindControl("ddlEditCondition");
                TextBox txtEditDescription = (TextBox)item.FindControl("txtEditDescription");

                soap_methods service = new soap_methods();
                service.UpdateSite(siteId, txtEditName.Text, txtEditLocation.Text, ddlEditCondition.SelectedValue, txtEditDescription.Text);

                LoadSites();
            } // end of if block for update


        } // end of rptSites_ItemCommand method



    } // end of Sites class


} // end of HeritageCare_Solution namespace