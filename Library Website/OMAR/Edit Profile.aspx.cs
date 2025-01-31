using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Library_Website.OMAR
{
    public partial class Edit_Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserProfile();
            }
        }

        private void LoadUserProfile()
        {
            string loginPath = Server.MapPath("~/OMAR/App_Data/loginned_User.txt");
            if (!File.Exists(loginPath))
            {
                Response.Redirect("login.aspx");
                return;
            }

            string[] loggedInUserLines = File.ReadAllLines(loginPath);
            if (loggedInUserLines.Length == 0)
            {
                Response.Redirect("login.aspx");
                return;
            }

            string userEmail = loggedInUserLines[0].Substring(6).Trim();
            string userPassword = loggedInUserLines[1].Substring(9).Trim();

            string path = Server.MapPath("~/OMAR/App_Data/Registered_User.txt");
            using (StreamReader reader = new StreamReader(path))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    if (line.StartsWith("Email:"))
                    {
                        string fileEmail = line.Substring(6).Trim();
                        string filePassword = reader.ReadLine().Substring(9).Trim();

                        if (fileEmail == userEmail && filePassword == userPassword)
                        {
                            txtEmail.Text = fileEmail;
                            txtPassword.Text = filePassword;
                            txtName.Text = reader.ReadLine().Substring(6).Trim();
                            txtYearOfBirth.Text = reader.ReadLine().Substring(13).Trim();
                            ddlGender.SelectedValue = reader.ReadLine().Substring(7).Trim();
                            txtCountry.Text = reader.ReadLine().Substring(8).Trim();
                            break;
                        }
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string loginPath = Server.MapPath("~/OMAR/App_Data/loginned_User.txt");
            string[] loggedInUserLines = File.ReadAllLines(loginPath);

            string userEmail = loggedInUserLines[0].Substring(6).Trim();
            string userPassword = loggedInUserLines[1].Substring(9).Trim();

            string newName = txtName.Text.Trim();
            string newYearOfBirth = txtYearOfBirth.Text.Trim();
            string newGender = ddlGender.SelectedValue;
            string newCountry = txtCountry.Text.Trim();

            string path = Server.MapPath("~/OMAR/App_Data/Registered_User.txt");
            string[] lines = File.ReadAllLines(path);
            for (int i = 0; i < lines.Length; i++)
            {
                if (lines[i].StartsWith("Email:") && lines[i].Substring(6).Trim() == userEmail &&
                    lines[i + 1].Substring(9).Trim() == userPassword)
                {
                    lines[i + 2] = "Name: " + newName;
                    lines[i + 3] = "YearOfBirth: " + newYearOfBirth;
                    lines[i + 4] = "Gender: " + newGender;
                    lines[i + 5] = "Country: " + newCountry;
                    break;
                }
            }
            File.WriteAllLines(path, lines);

            // Update loginned_user.txt
            string updatedUserInfo = $"Email: {userEmail}\nPassword: {userPassword}\nName: {newName}\nYearOfBirth: {newYearOfBirth}\nGender: {newGender}\nCountry: {newCountry}";
            File.WriteAllText(loginPath, updatedUserInfo);

            Response.Write("<script>alert('Profile updated successfully!');</script>");
        }
        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    string loginPath = Server.MapPath("~/App_Data/loginned_user.txt");
        //    string[] loggedInUserLines = File.ReadAllLines(loginPath);

        //    string userEmail = loggedInUserLines[0].Substring(6).Trim();
        //    string userPassword = loggedInUserLines[1].Substring(9).Trim();

        //    string newName = txtName.Text.Trim();
        //    string newYearOfBirth = txtYearOfBirth.Text.Trim();
        //    string newGender = ddlGender.SelectedValue;
        //    string newCountry = txtCountry.Text.Trim();

        //    string path = Server.MapPath("~/App_Data/omar.txt");
        //    string[] lines = File.ReadAllLines(path);

        //    for (int i = 0; i < lines.Length; i++)
        //    {
        //        if (lines[i].StartsWith("Email:") && lines[i].Substring(6).Trim() == userEmail &&
        //            lines[i + 1].Substring(9).Trim() == userPassword)
        //        {
        //            lines[i + 2] = "Name: " + newName;
        //            lines[i + 3] = "YearOfBirth: " + newYearOfBirth;
        //            lines[i + 4] = "Gender: " + newGender;
        //            lines[i + 5] = "Country: " + newCountry;
        //            break;
        //        }
        //    }

        //    try
        //    {
        //        // Writing the updated profile information to the files
        //        File.WriteAllLines(path, lines);  // Save changes to the profile file
        //        File.WriteAllText(loginPath, $"Email: {userEmail}\nPassword: {userPassword}\nName: {newName}\nYearOfBirth: {newYearOfBirth}\nGender: {newGender}\nCountry: {newCountry}"); // Update the login file with new info

        //        // Show success message
        //        Response.Write("<script>alert('Profile updated successfully!');</script>");
        //    }
        //    catch (Exception ex)
        //    {
        //        // If an error occurs during file writing, show an error message
        //        Response.Write($"<script>alert('Error: {ex.Message}');</script>");
        //    }
        //}


        protected void Cards_Click(object sender, EventArgs e)
        {
            Response.Redirect("user_cards.aspx");
        }
    }
}