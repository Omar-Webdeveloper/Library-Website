using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Website.OMAR
{
    public partial class Last_Change_Password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ChangePasswordButton_Click(object sender, EventArgs e)
        {
            string email = EmailTextBox.Text.Trim();
            string oldPassword = OldPasswordTextBox.Text.Trim();
            string newPassword = NewPasswordTextBox.Text.Trim();
            string confirmPassword = ConfirmPasswordTextBox.Text.Trim();

            if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(oldPassword) &&
                !string.IsNullOrEmpty(newPassword) && !string.IsNullOrEmpty(confirmPassword))
            {
                if (newPassword == confirmPassword)
                {
                    bool isPasswordChanged = ChangePassword(email, oldPassword, newPassword);
                    if (isPasswordChanged)
                    {
                        // Display success message
                        Response.Write("<script>alert('Password changed successfully');</script>");
                    }
                    else
                    {
                        // Display error message
                        Response.Write("<script>alert('Error changing password');</script>");
                    }
                }
                else
                {
                    // Display error message
                    Response.Write("<script>alert('New passwords do not match');</script>");
                }
            }
        }

        private bool ChangePassword(string email, string oldPassword, string newPassword)
        {
            string registerFilePath = Server.MapPath("~/OMAR/App_Data/Rigster.txt");
            string[] lines = File.ReadAllLines(registerFilePath);
            List<string> updatedLines = new List<string>();
            bool passwordChanged = false;

            foreach (string line in lines)
            {
                string[] parts = line.Split(',');
                if (parts.Length == 6 && parts[3].Trim() == email && parts[4].Trim() == oldPassword)
                {
                    updatedLines.Add($"{parts[0]},{parts[1]},{parts[2]},{parts[3]},{newPassword},{parts[5]}");
                    passwordChanged = true;
                }
                else
                {
                    updatedLines.Add(line);
                }
            }

            if (passwordChanged)
            {
                File.WriteAllLines(registerFilePath, updatedLines);
            }

            return passwordChanged;
        }
    }
}
