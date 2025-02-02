using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Website.SARA
{
    public partial class regestrationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registar_Click(object sender, EventArgs e)            // parameter so we can deal with all the content in html page using runat server   "constant structur"
        {
            string file = Server.MapPath("registration.txt");               // search based on my solotion Is there a file called regestration.txt ?   "virtual path to file"

            if (!File.Exists(file))
            {
                using (StreamWriter sw = File.CreateText(file))
                {
                    sw.WriteLine($"{fName.Text},{uName.Text},{phone.Text},{email.Text},{password.Text}");
                }

            }
            else 
            {
                using (StreamWriter ss = new StreamWriter(file, true))
                {
                    ss.WriteLine($"{fName.Text},{uName.Text},{phone.Text},{email.Text},{password.Text}");
                }

            }
            Response.Redirect("loginPage.aspx");


        }
    }
}