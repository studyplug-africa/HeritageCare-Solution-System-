using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeritageCare_Solution
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        //event handler for submitting the details from the form
        protected void contacting(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtName.Text) || string.IsNullOrWhiteSpace(txtEmail.Text) || string.IsNullOrWhiteSpace(txtSubject.Text) || string.IsNullOrWhiteSpace(txtMessage.Text))
            {
                lblMessage.Text = "Please fill in all fields.";
                lblMessage.CssClass = "form-message error";
                return;
            }

            lblMessage.Text = "Thank you, " + txtName.Text + ". Your message has been received.";
            lblMessage.CssClass = "form-message success";

            txtName.Text = "";
            txtEmail.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";
        }



    }
}