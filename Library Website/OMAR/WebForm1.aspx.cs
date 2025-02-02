using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Library_Website.OMAR
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMessages();
            }
        }

        private void LoadMessages()
        {
            List<Message> messages = new List<Message>();
            string filePath = Server.MapPath("~/OMAR/App_Data/User_Message_to_Admin.txt");

            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                Message message = null;

                foreach (string line in lines)
                {
                    if (line.StartsWith("First Name:"))
                    {
                        message = new Message();
                        message.Name = line.Replace("First Name: ", string.Empty);
                    }
                    else if (line.StartsWith("Last Name:"))
                    {
                        message.Name += " " + line.Replace("Last Name: ", string.Empty);
                    }
                    else if (line.StartsWith("Email:"))
                    {
                        message.Email = line.Replace("Email: ", string.Empty);
                    }
                    else if (line.StartsWith("Message:"))
                    {
                        message.MessageContent = line.Replace("Message: ", string.Empty);
                    }
                    else if (line == "-----" && message != null)
                    {
                        messages.Add(message);
                        message = null;
                    }
                }

                MessagesRepeater.DataSource = messages;
                MessagesRepeater.DataBind();
            }
        }

        protected void ReplyButton_Click(object sender, EventArgs e)
        {
            Button replyButton = (Button)sender;
            string recipientEmail = replyButton.CommandArgument;
            RepeaterItem item = (RepeaterItem)replyButton.NamingContainer;
            TextBox replyTextBox = (TextBox)item.FindControl("ReplyTextBox");

            string replyMessage = replyTextBox.Text;

            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("omarabojolban@gmail.com"); // Admin's email address
                mail.To.Add(recipientEmail); // The recipient's email address
                mail.Subject = "Reply to Your Message";
                mail.Body = replyMessage;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.Credentials = new System.Net.NetworkCredential("omarabojolban9@gmail.com", "OMar@@1212");
                smtpClient.EnableSsl = true;
                smtpClient.Send(mail);

                // Display a success message to the admin
                Response.Write("<script>alert('Reply sent successfully.');</script>");
            }
            catch (Exception ex)
            {
                // Display an error message to the admin
                Response.Write($"<script>alert('An error occurred while sending your reply: {ex.Message}');</script>");
            }
        }
    }

    public class Message
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public string MessageContent { get; set; }
    }
}
