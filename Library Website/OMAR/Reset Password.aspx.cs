using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Website.OMAR
{
    public partial class Reset_Password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void btnResetPassword_Click(object sender, EventArgs e)
        //{
        //    string email = txtEmail.Text.Trim();
        //    string oldPassword = txtOldPassword.Text.Trim();
        //    string newPassword = txtNewPassword.Text.Trim();
        //    string confirmPassword = txtConfirmPassword.Text.Trim();

        //    if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(oldPassword) || string.IsNullOrEmpty(newPassword) || string.IsNullOrEmpty(confirmPassword))
        //    {
        //        Response.Write("<script>alert('All fields are required.');</script>");
        //        return;
        //    }

        //    if (newPassword != confirmPassword)
        //    {
        //        Response.Write("<script>alert('New password and confirm password do not match.');</script>");
        //        return;
        //    }

        //    string loginPath = Server.MapPath("~/OMAR/App_Data/loginned_User.txt");
        //    if (!File.Exists(loginPath))
        //    {
        //        Response.Write("<script>alert('No user is currently logged in.');</script>");
        //        return;
        //    }

        //    string[] loggedInUserLines = File.ReadAllLines(loginPath);
        //    if (loggedInUserLines.Length == 0 || loggedInUserLines[0].Substring(6).Trim() != email || loggedInUserLines[1].Substring(9).Trim() != oldPassword)
        //    {
        //        Response.Write("<script>alert('Invalid email or old password.');</script>");
        //        return;
        //    }

        //    string path = Server.MapPath("~/OMAR/App_Data/Registered_User.txt");
        //    string[] lines = File.ReadAllLines(path);
        //    for (int i = 0; i < lines.Length; i++)
        //    {
        //        if (lines[i].StartsWith("Email:") && lines[i].Substring(6).Trim() == email && lines[i + 1].Substring(9).Trim() == oldPassword)
        //        {
        //            lines[i + 1] = "Password: " + newPassword;
        //            File.WriteAllLines(path, lines);

        //            // Update loginned_user.txt
        //            string updatedUserInfo = $"Email: {email}\nPassword: {newPassword}\nName: {loggedInUserLines[2].Substring(6).Trim()}\nYearOfBirth: {loggedInUserLines[3].Substring(13).Trim()}\nGender: {loggedInUserLines[4].Substring(7).Trim()}\nCountry: {loggedInUserLines[5].Substring(8).Trim()}";
        //            File.WriteAllText(loginPath, updatedUserInfo);

        //            Response.Write("<script>alert('Password updated successfully!');</script>");
        //            Response.Redirect("User_Profile.aspx");
        //            return;
        //        }
        //    }

        //    Response.Write("<script>alert('Failed to update password.');</script>");
        //}
        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string oldPassword = txtOldPassword.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(oldPassword) || string.IsNullOrEmpty(newPassword) || string.IsNullOrEmpty(confirmPassword))
            {
                Response.Write("<script>alert('All fields are required.');</script>");
                return;
            }

            if (newPassword != confirmPassword)
            {
                Response.Write("<script>alert('New password and confirm password do not match.');</script>");
                return;
            }

            string loginPath = Server.MapPath("~/OMAR/App_Data/loginned_User.txt");
            string registeredUsersPath = Server.MapPath("~/OMAR/App_Data/Registered_User.txt");

            if (!File.Exists(registeredUsersPath))
            {
                Response.Write("<script>alert('Registered users file not found.');</script>");
                return;
            }

            string[] registeredUsersLines = File.ReadAllLines(registeredUsersPath);
            bool userFound = false;

            for (int i = 0; i < registeredUsersLines.Length; i++)
            {
                if (registeredUsersLines[i].StartsWith("Email:") && registeredUsersLines[i].Substring(6).Trim() == email &&
                    registeredUsersLines[i + 1].Substring(9).Trim() == oldPassword)
                {
                    registeredUsersLines[i + 1] = "Password: " + newPassword;
                    userFound = true;
                    break;
                }
            }

            if (!userFound)
            {
                Response.Write("<script>alert('Invalid email or old password.');</script>");
                return;
            }

            // Update registered_users.txt
            File.WriteAllLines(registeredUsersPath, registeredUsersLines);

            // Update loginned_user.txt if the email matches
            if (File.Exists(loginPath))
            {
                string[] loggedInUserLines = File.ReadAllLines(loginPath);
                if (loggedInUserLines.Length > 0 && loggedInUserLines[0].Substring(6).Trim() == email)
                {
                    loggedInUserLines[1] = "Password: " + newPassword;
                    File.WriteAllLines(loginPath, loggedInUserLines);
                }
            }

            Response.Write("<script>alert('Password updated successfully!');</script>");
            Response.Redirect("User_Profile.aspx");
        }
    }
}