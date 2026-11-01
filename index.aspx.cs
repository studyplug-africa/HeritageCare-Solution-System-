using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HeritageCare_Solution.backend;
namespace HeritageCare_Solution
{
    public partial class index : System.Web.UI.Page
    {


        //auto create the database on load
        protected void Page_Load(object sender, EventArgs e)
        {
            //creating an instance for the class auto_createDatabase with an object name creates
            auto_createDatabase creates = new auto_createDatabase();
            creates.Create();
        }


    }
}