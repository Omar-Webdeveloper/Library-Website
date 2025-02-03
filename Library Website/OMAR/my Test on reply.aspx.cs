//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace Library_Website.OMAR
//{
//    public partial class my_Test_on_reply : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {
//        }

//        protected void ReplyButton_Click(object sender, EventArgs e)
//        {
//            Button replyButton = (Button)sender;
//            string email = replyButton.CommandArgument;
//            TextBox replyTextBox = (TextBox)replyButton.Parent.FindControl("ReplyTextBox");
//            string message = replyTextBox.Text;

//            string mailto = string.Format("mailto:{0}?subject={1}&body={2}", email, "Reply to your message", HttpUtility.UrlEncode(message));
//            ClientScript.RegisterStartupScript(this.GetType(), "mailto", "window.location.href='" + mailto + "';", true);
//        }
//    }
//}
using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Website.OMAR
{
    public partial class my_Test_on_reply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<UserMessage> userMessages = ReadUserMessagesFromFile();
                MessagesRepeater.DataSource = userMessages;
                MessagesRepeater.DataBind();
            }
        }

        protected void ReplyButton_Click(object sender, EventArgs e)
        {
            Button replyButton = (Button)sender;
            string email = replyButton.CommandArgument;
            TextBox replyTextBox = (TextBox)replyButton.Parent.FindControl("ReplyTextBox");
            string message = replyTextBox.Text;

            string mailto = string.Format("mailto:{0}?subject={1}&body={2}", email, "Reply to your message", HttpUtility.UrlEncode(message));
            ClientScript.RegisterStartupScript(this.GetType(), "mailto", "window.location.href='" + mailto + "';", true);
        }

        private List<UserMessage> ReadUserMessagesFromFile()
        {
            List<UserMessage> userMessages = new List<UserMessage>();
            string[] lines = File.ReadAllLines(Server.MapPath("~/OMAR/App_Data/User_Message_to_Admin.txt"));
            UserMessage userMessage = null;

            foreach (string line in lines)
            {
                if (line.StartsWith("First Name:"))
                {
                    if (userMessage != null)
                    {
                        userMessages.Add(userMessage);
                    }
                    userMessage = new UserMessage();
                    userMessage.FirstName = line.Substring(11).Trim();
                }
                else if (line.StartsWith("Last Name:"))
                {
                    userMessage.LastName = line.Substring(10).Trim();
                }
                else if (line.StartsWith("Email:"))
                {
                    userMessage.Email = line.Substring(6).Trim();
                }
                else if (line.StartsWith("Message:"))
                {
                    userMessage.MessageContent = line.Substring(8).Trim();
                }
            }

            if (userMessage != null)
            {
                userMessages.Add(userMessage);
            }

            return userMessages;
        }
    }

    public class UserMessage
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string MessageContent { get; set; }
    }
}
