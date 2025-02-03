using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Website.OMAR
{
    public partial class last_edit_profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string email = ReadLoginEmail();
                if (!string.IsNullOrEmpty(email))
                {
                    UserProfile userProfile = GetUserProfileByEmail(email);
                    if (userProfile != null)
                    {
                        PopulateFields(userProfile);
                    }
                }
            }
        }

        private string ReadLoginEmail()
        {
            string loginFilePath = Server.MapPath("~/OMAR/App_Data/Login.txt");
            return File.ReadAllText(loginFilePath).Trim();
        }

        private UserProfile GetUserProfileByEmail(string email)
        {
            string registerFilePath = Server.MapPath("~/OMAR/App_Data/Rigster.txt");
            string[] lines = File.ReadAllLines(registerFilePath);

            foreach (string line in lines)
            {
                string[] parts = line.Split(',');
                if (parts.Length == 6 && parts[3].Trim() == email)
                {
                    return new UserProfile
                    {
                        FirstName = parts[0].Trim(),
                        LastName = parts[1].Trim(),
                        PhoneNumber = parts[2].Trim(),
                        Email = parts[3].Trim(),
                        Password = parts[4].Trim(),
                        ProfileImagePath = parts[5].Trim()
                    };
                }
            }
            return null;
        }

        private void PopulateFields(UserProfile userProfile)
        {
            FirstNameTextBox.Text = userProfile.FirstName;
            LastNameTextBox.Text = userProfile.LastName;
            PhoneNumberTextBox.Text = userProfile.PhoneNumber;
            EmailTextBox.Text = userProfile.Email;
            PasswordTextBox.Text = userProfile.Password; // Read-only field
            ProfileImagePathTextBox.Text = userProfile.ProfileImagePath;
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            string email = ReadLoginEmail();
            if (!string.IsNullOrEmpty(email))
            {
                UserProfile updatedProfile = new UserProfile
                {
                    FirstName = FirstNameTextBox.Text.Trim(),
                    LastName = LastNameTextBox.Text.Trim(),
                    PhoneNumber = PhoneNumberTextBox.Text.Trim(),
                    Email = EmailTextBox.Text.Trim(),
                    // Password is not editable
                    ProfileImagePath = ProfileImagePathTextBox.Text.Trim()
                };

                UpdateUserProfile(updatedProfile);
            }
        }

        private void UpdateUserProfile(UserProfile updatedProfile)
        {
            string registerFilePath = Server.MapPath("~/OMAR/App_Data/Rigster.txt");
            string[] lines = File.ReadAllLines(registerFilePath);
            List<string> updatedLines = new List<string>();

            foreach (string line in lines)
            {
                string[] parts = line.Split(',');
                if (parts.Length == 6 && parts[3].Trim() == updatedProfile.Email)
                {
                    updatedLines.Add($"{updatedProfile.FirstName},{updatedProfile.LastName},{updatedProfile.PhoneNumber},{updatedProfile.Email},{parts[4]},{updatedProfile.ProfileImagePath}");
                }
                else
                {
                    updatedLines.Add(line);
                }
            }

            File.WriteAllLines(registerFilePath, updatedLines);
        }

        public class UserProfile
        {
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string PhoneNumber { get; set; }
            public string Email { get; set; }
            public string Password { get; set; }
            public string ProfileImagePath { get; set; }
        }
    }
}
