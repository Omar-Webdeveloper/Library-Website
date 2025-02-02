using System;
using System.IO;
using System.Web.UI;

namespace Library_Website.SARA
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string filePath = Server.MapPath("registration.txt");
                if (File.Exists(filePath))
                {
                    string[] lines = File.ReadAllLines(filePath);
                    string[] loggedInUser = File.ReadAllLines(Server.MapPath("emailForLogin.txt"));
                    foreach (string line in lines)
                    {
                        string[] data = line.Split(',');

                        if (data[3] == loggedInUser[0])  // تأكد من وجود جميع الحقول
                        {
                            fName.Text =  data[0].Trim();
                            uName.Text =  data[1].Trim();
                            tel.Text =  data[2].Trim();
                            email.Text =  data[3].Trim();
                           
                            break; 
                        }
                    }
                }
                else
                {
                    lblMessage.Text = "File not found.";
                }
            }
        }
    }
}
