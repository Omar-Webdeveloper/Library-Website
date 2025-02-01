using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Website.SARA
{
    public partial class loginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sigIn_Click(object sender, EventArgs e)

        {

            //string file = Server.MapPath("registration.txt");

            if (email.Text == "admin@gmail.com" && password.Text == "123")
            {
                storLoged();
                Response.Redirect("adminPage.aspx");
            }
            else
            {
                string files = Server.MapPath("emailForLogin.txt");
                string[] users = File.ReadAllLines(files); //["user1","user2","user3",....] array of objects
                foreach (string user in users)
                {



                    string[] userData = user.Split(',');
                    if (email.Text == userData[3] && password.Text == userData[4])
                    {
                        result.Text = "login successifuly";
                       result.Visible = true;
                        storLoged();
                        
                        Response.Redirect(".aspx");
                    }




                }
                result.Text = "Invalid username or password ";
                result.Visible = true;
            }
        }
        private void storLoged()
        {
            string filePath = Server.MapPath("emailForLogin.txt");
            if (File.Exists(filePath))
            {
                File.WriteAllText(filePath, email.Text);
            }
            else
            {
                File.WriteAllText(filePath, email.Text);

            }
        }









        //string file = Server.MapPath("registration.txt");

        //string[] userData=File.ReadAllLines(file);

        //foreach (var user in userData)
        //{
        //    string[] usersData = user.Split(',');

        //    if (email.Text == usersData[3] && password.Text == userData[4])
        //    {
        //        result.Text = "login successfully";
        //        result.Visible= true;
        //        return;
        //    }
        //}
        //result.Text = "valid user name or password";
        //result.Visible = true;
    }
    }
