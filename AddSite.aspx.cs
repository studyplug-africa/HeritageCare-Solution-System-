using System;
using HeritageCare_Solution.backend;

namespace HeritageCare_Solution
{
    // add site page that lets the user register a new heritage site
    public partial class AddSite : System.Web.UI.Page
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


        } // end of Page_Load method


        // event handler that saves the new site to the database
        protected void site_saving(object sender, EventArgs e)
        {
            // collect the form values
            string siteName = txtSiteName.Text.Trim();
            string location = txtLocation.Text.Trim();
            string condition = ddlCondition.SelectedValue;
            string description = txtDescription.Text.Trim();

            // if any required field is empty, show an error
            if (string.IsNullOrWhiteSpace(siteName) || string.IsNullOrWhiteSpace(location) || string.IsNullOrWhiteSpace(condition) || string.IsNullOrWhiteSpace(description))
            {
                lblMessage.Text = "Please fill in all required fields.";
                lblMessage.CssClass = "addsite-message error";
                return;
            } // end of if block for empty fields

            // get the current user's id
            int userId = Convert.ToInt32(Session["UserId"]);

            // save the site through the service
            soap_methods service = new soap_methods();
            string result = service.AddSite(userId, siteName, location, condition, description);

            // if the service returned an error, show it
            if (result.StartsWith("Please"))
            {
                lblMessage.Text = result;
                lblMessage.CssClass = "addsite-message error";
                return;
            } // end of if block for service error

            // success: clear the form and show a message
            lblMessage.Text = "Site saved successfully.";
            lblMessage.CssClass = "addsite-message success";

            txtSiteName.Text = "";
            txtLocation.Text = "";
            ddlCondition.SelectedIndex = 0;
            txtDescription.Text = "";
        } // end of site_saving method


    } // end of AddSite class


} // end of HeritageCare_Solution namespace