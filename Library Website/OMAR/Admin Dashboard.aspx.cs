using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Website.OMAR
{
    public partial class Admin_Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dash(object sender, EventArgs e)
        {
            Response.Redirect("~/OMAR/Admin Dashboarx.aspx");
        }

        protected void Reset(object sender, EventArgs e)
        {
            Response.Redirect("~/OMAR/Admin Dashboarx.aspx");

        }

        protected void messages(object sender, EventArgs e)
        {
            Response.Redirect("~/OMAR/WebForm1.aspx");

        }
    }
}