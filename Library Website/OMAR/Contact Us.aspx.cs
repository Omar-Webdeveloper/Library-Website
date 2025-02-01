using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;

namespace Library_Website.OMAR
{
    public partial class Contact_Us : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void SendButton_Click(object sender, EventArgs e)
        {
           
                // Write form data to a text file
                string filePath = Server.MapPath("~/OMAR/App_Data/User_Message_to_Admin.txt");
                using (StreamWriter writer = new StreamWriter(filePath, true))
                {
                    writer.WriteLine("First Name: " + FirstName.Text);
                    writer.WriteLine("Last Name: " + LastName.Text);
                    writer.WriteLine("Email: " + Email.Text);
                    writer.WriteLine("Message: " + Message.Text);
                    writer.WriteLine("-----");
                }

                // Display a success message to the user
                Response.Write("<script>alert('Thank you for contacting us. Your message has been saved successfully.');</script>");
        }
           
        

    }
}