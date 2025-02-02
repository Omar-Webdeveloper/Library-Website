using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.ComponentModel.DataAnnotations;

namespace Library_Website.SARA
{
    public partial class profilePage : System.Web.UI.Page
    {
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserData();
            }
        }

        protected void LoadUserData()
        {
            string filePath = Server.MapPath("registration.txt");
            string fileLoged = Server.MapPath("emailForLogin.txt");
            if (File.Exists(filePath) && File.Exists(fileLoged))
            {
                string[] content = File.ReadAllLines(filePath);
                string userEmail = File.ReadAllText(fileLoged).Trim();

                foreach (string line in content)
                {
                    string[] user = line.Split(',');
                    if (user.Length > 5 && user[4].Trim().Equals(userEmail, StringComparison.OrdinalIgnoreCase))
                    {
                        fName.Text = user[0];
                        uName.Text = user[1];
                        tel.Text = user[3];
                        email.Text = user[4];
                        password.Text = user[5];
                        break;
                    }
                }
            }
        }

        protected void button_Click(object sender, EventArgs e)
        {
            // Code to save changes
        }
    }
    //protected void button_Click(object sender, EventArgs e) { 




    //{
    //    string filePath = Server.MapPath("registration.txt");
    //    string fileLoged = Server.MapPath("emailForLogin.txt");
    //    if (File.Exists(filePath))
    //    {
    //        string[] content = File.ReadAllLines(filePath);
    //        string userEmail = File.ReadAllText(fileLoged);

    //        foreach (string line in content)
    //        {
    //            string[] user = line.Split(',');
    //            if (user[4] == userEmail)
    //            {
    //                fName.Text = user[0];
    //                uName.Text = user[1];
    //                tel.Text = user[3];
    //                email.Text = user[4];
    //               password.Text = user[5];
    //            }
    //        }
    //    }
    //}

}
