using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Website.OMAR
{
    public partial class Review_For_Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<UserReview> userReviews = ReadUserReviewsFromFile();
                if (userReviews != null && userReviews.Count > 0)
                {
                    ReviewsRepeater.DataSource = userReviews.FindAll(review => review.Status == "accepted");
                    ReviewsRepeater.DataBind();
                }
                else
                {
                    // Handle the case where no reviews are available
                    // Optionally display a message to the user
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('No accepted reviews available.');", true);
                }
            }
        }

        protected void SubmitReviewButton_Click(object sender, EventArgs e)
        {
            string email = EmailTextBox.Text.Trim();
            string password = PasswordTextBox.Text.Trim();

            if (IsValidUser(email, password))
            {
                string firstName = FirstNameTextBox.Text.Trim();
                string lastName = LastNameTextBox.Text.Trim();
                string messageContent = MessageTextBox.Text.Trim();

                if (!string.IsNullOrEmpty(firstName) && !string.IsNullOrEmpty(lastName) &&
                    !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(messageContent))
                {
                    string review = $"First Name: {firstName}\r\nLast Name: {lastName}\r\nEmail: {email}\r\nMessage: {messageContent}\r\nStatus: pending\r\n-----\r\n";
                    File.AppendAllText(Server.MapPath("~/OMAR/App_Data/User_Message_to_Admin.txt"), review);

                    List<UserReview> userReviews = ReadUserReviewsFromFile();
                    if (userReviews != null && userReviews.Count > 0)
                    {
                        ReviewsRepeater.DataSource = userReviews.FindAll(r => r.Status == "accepted");
                        ReviewsRepeater.DataBind();
                    }

                    // Clear the form fields
                    EmailTextBox.Text = string.Empty;
                    PasswordTextBox.Text = string.Empty;
                    FirstNameTextBox.Text = string.Empty;
                    LastNameTextBox.Text = string.Empty;
                    MessageTextBox.Text = string.Empty;
                }
            }
            else
            {
                // Display an error message
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Invalid email or password.');", true);
            }
        }

        private bool IsValidUser(string email, string password)
        {
            string registerFilePath = Server.MapPath("~/OMAR/App_Data/Rigster.txt");
            string[] lines = File.ReadAllLines(registerFilePath);

            foreach (string line in lines)
            {
                string[] parts = line.Split(',');
                if (parts.Length == 6 && parts[3].Trim() == email && parts[4].Trim() == password)
                {
                    return true;
                }
            }
            return false;
        }

        private List<UserReview> ReadUserReviewsFromFile()
        {
            List<UserReview> userReviews = new List<UserReview>();
            string[] lines = File.ReadAllLines(Server.MapPath("~/OMAR/App_Data/User_Message_to_Admin.txt"));
            UserReview userReview = null;

            foreach (string line in lines)
            {
                if (line.StartsWith("First Name:"))
                {
                    if (userReview != null)
                    {
                        userReviews.Add(userReview);
                    }
                    userReview = new UserReview();
                    userReview.FirstName = line.Substring(11).Trim();
                }
                else if (line.StartsWith("Last Name:"))
                {
                    userReview.LastName = line.Substring(10).Trim();
                }
                else if (line.StartsWith("Email:"))
                {
                    userReview.Email = line.Substring(6).Trim();
                }
                else if (line.StartsWith("Message:"))
                {
                    userReview.MessageContent = line.Substring(8).Trim();
                }
                else if (line.StartsWith("Status:"))
                {
                    userReview.Status = line.Substring(7).Trim();
                }
                else if (line == "-----")
                {
                    if (userReview != null)
                    {
                        userReviews.Add(userReview);
                        userReview = null;
                    }
                }
            }

            if (userReview != null)
            {
                userReviews.Add(userReview);
            }

            return userReviews;
        }
    }

    public class UserReview
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string MessageContent { get; set; }
        public string Status { get; set; }
    }
}
