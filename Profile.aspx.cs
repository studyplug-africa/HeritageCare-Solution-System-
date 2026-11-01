using System;
using HeritageCare_Solution.backend;

namespace HeritageCare_Solution
{
    // profile page that shows and updates the logged-in user's details
    public partial class Profile : System.Web.UI.Page
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

            // only load the profile on the first visit, not on postbacks
            if (!IsPostBack)
            {
                LoadProfile();
            } // end of if block for first load
        } // end of Page_Load method

        // method that loads the user's details into the card and the popup fields
        private void LoadProfile()
        {
            // get the current user's id
            int userId = Convert.ToInt32(Session["UserId"]);

            // load the user from the database
            soap_methods_support service = new soap_methods_support();
            User user = service.GetUser(userId);

            // if the user was found, fill the card and the form fields
            if (user != null)
            {
                lblFullName.Text = user.FullName;
                lblEmail.Text = user.Email;
                lblContact.Text = user.ContactNumber;
                lblJoined.Text = user.CreatedAt.ToString("MMMM yyyy");

                txtFullName.Text = user.FullName;
                txtEmail.Text = user.Email;
                txtContact.Text = user.ContactNumber;
            } // end of if block for valid user
        } // end of LoadProfile method

        // event handler that saves the personal info changes
        protected void info_saving(object sender, EventArgs e)
        {
            // get the current user's id
            int userId = Convert.ToInt32(Session["UserId"]);

            // save the changes through the service
            soap_methods_support service = new soap_methods_support();
            string result = service.UpdateProfile(userId, txtFullName.Text, txtContact.Text);

            // keep the popup open so the message is visible
            hfInfoOpen.Value = "true";

            // if the service returned an error, show it
            if (result.StartsWith("Please"))
            {
                lblInfoMessage.Text = result;
                lblInfoMessage.CssClass = "profile-message error";
                return;
            } // end of if block for failed update

            // update the session and the card so the change shows without a reload
            Session["FullName"] = txtFullName.Text.Trim();
            lblFullName.Text = txtFullName.Text.Trim();
            lblContact.Text = txtContact.Text.Trim();

            // show the success message
            lblInfoMessage.Text = result;
            lblInfoMessage.CssClass = "profile-message success";
        } // end of info_saving method

        // event handler that changes the user's password
        protected void password_changing(object sender, EventArgs e)
        {
            // get the current user's id
            int userId = Convert.ToInt32(Session["UserId"]);

            // try to change the password through the service
            soap_methods_support service = new soap_methods_support();
            string result = service.ChangePassword(userId, txtCurrentPassword.Text, txtNewPassword.Text);

            // keep the popup open so the message is visible
            hfPasswordOpen.Value = "true";

            // if the service returned an error, show it
            if (result.StartsWith("Please") || result.StartsWith("Current"))
            {
                lblPasswordMessage.Text = result;
                lblPasswordMessage.CssClass = "profile-message error";
                return;
            } // end of if block for failed change

            // show the success message
            lblPasswordMessage.Text = result;
            lblPasswordMessage.CssClass = "profile-message success";

            // clear the password fields
            txtCurrentPassword.Text = "";
            txtNewPassword.Text = "";
        } // end of password_changing method


    } // end of Profile class


} // end of HeritageCare_Solution namespace