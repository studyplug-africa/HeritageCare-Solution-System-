using System;

namespace HeritageCare_Solution
{
    // logoff page that clears the user session and sends them back to login
    public partial class Logoff : System.Web.UI.Page
    {
        // runs when the page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            // clear all values stored in the session
            Session.Clear();

            // end the session and remove the session cookie
            Session.Abandon();

            // send the user back to the login page
            Response.Redirect("Login.aspx");
        } // end of Page_Load method


    } // end of Logoff class


} // end of HeritageCare_Solution namespace