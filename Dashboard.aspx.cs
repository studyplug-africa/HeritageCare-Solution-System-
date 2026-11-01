using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeritageCare_Solution
{
    // dashboard page class
    public partial class Dashboard : System.Web.UI.Page
    {
        // load the page and check the session
        protected void Page_Load(object sender, EventArgs e)
        {
            // if there is no session, send the user back to login
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            } // end of if block for no session

            // show the user's name in the topbar
            lblUserName.Text = Session["FullName"].ToString();
        } // end of Page_Load method
    } // end of Dashboard class
} // end of HeritageCare_Solution namespace