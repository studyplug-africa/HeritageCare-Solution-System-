using HeritageCare_Solution.backend;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeritageCare_Solution
{
    public partial class register : System.Web.UI.Page
    {
        //auto create the database on load
        protected void Page_Load(object sender, EventArgs e)
        {
            //creating an instance for the class auto_createDatabase with an object name creates
            auto_createDatabase creates = new auto_createDatabase();
            creates.Create();
        }

        //event handler to submit user's info from the form
        protected void user_registering(object sender, EventArgs e)
        {

            //validating user's input
            if (string.IsNullOrWhiteSpace(txtFullName.Text) || string.IsNullOrWhiteSpace(txtEmail.Text) || string.IsNullOrWhiteSpace(txtPassword.Text) || string.IsNullOrWhiteSpace(txtContact.Text))
            {
                lblMessage.Text = "Please fill in all fields.";
                lblMessage.CssClass = "form-message error";
                return;
            }

            //create an instance of register_user to handle the database insert
            register_user user_register = new register_user();

            //call the Register method and store the result
            registerResult result = user_register.Register(txtFullName.Text, txtEmail.Text, txtPassword.Text, txtContact.Text);

            //if registration failed show the error message
            if (!result.Success)
            {
                lblMessage.Text = result.Message;
                lblMessage.CssClass = "form-message error";
                return;
            }

            lblMessage.Text = result.Message;
            lblMessage.CssClass = "form-message success";

            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtContact.Text = "";
        }




    }
}