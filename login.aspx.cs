using System;
using System.Web.UI;
using HeritageCare_Solution.backend;

namespace HeritageCare_Solution
{
    // login page class
    public partial class login : System.Web.UI.Page
    {
        // auto create the database on load
        protected void Page_Load(object sender, EventArgs e)
        {
            // creating an instance for the class auto_createDatabase with an object name creates
            auto_createDatabase creates = new auto_createDatabase();
            creates.Create();
        } // end of Page_Load method

        // event handler to get the details when they submit the form
        protected void user_logging_in(object sender, EventArgs e)
        {
            // creating an instance for the class login_user with an object name user_login
            login_user user_login = new login_user();

            // temp variables
            string email = txtEmail.Text.ToString();
            string password = txtPassword.Text.ToString();
            loginResult result = user_login.ValidateLogin(email, password);

            // check if login failed
            if (!result.Success)
            {
                lblMessage.Text = result.Message;
                lblMessage.CssClass = "form-message error";
                return;
            } // end of if block for failed login

            // save user details in the session
            Session["UserId"] = result.UserId;
            Session["FullName"] = result.FullName;

            // show success message
            lblMessage.Text = result.Message;
            lblMessage.CssClass = "form-message success";

            // redirect to dashboard
            Response.Redirect("Dashboard.aspx");
        } // end of user_logging_in method


    } // end of login class


} // end of HeritageCare_Solution namespace