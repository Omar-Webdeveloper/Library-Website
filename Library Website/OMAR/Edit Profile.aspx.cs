
using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

                            // Check if profile image exists
                            string profileImagePath = Server.MapPath("~/OMAR/ProfileImages/" + userEmail + ".jpg");
                            if (File.Exists(profileImagePath))
                            {
                                imgProfileImage.ImageUrl = "~/OMAR/ProfileImages/" + userEmail + ".jpg";
                            }
                            else
                            {
                                // If no image, set a default image
                                imgProfileImage.ImageUrl = "~/OMAR/ProfileImages/default.jpg";
                            }

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

        protected void Password_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reset Password.aspx");
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fuProfileImage.HasFile)
            {
                try
                {
                    // Get the file extension of the uploaded file
                    string fileExtension = Path.GetExtension(fuProfileImage.FileName).ToLower();
                    // List of allowed file extensions
                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };

                    // Check if the uploaded file is an allowed image file
                    if (allowedExtensions.Contains(fileExtension))
                    {
                        // Ensure directory exists
                        string uploadDir = Server.MapPath("~/OMAR/ProfileImages/");
                        if (!Directory.Exists(uploadDir))
                        {
                            Directory.CreateDirectory(uploadDir);
                        }

                        // Use the user's email as the filename (ensure uniqueness)
                        string fileName = txtEmail.Text.Trim() + ".jpg"; // or you can use GUID if you prefer

                        // Save the uploaded file
                        string filePath = uploadDir + fileName;
                        fuProfileImage.SaveAs(filePath);

                        // Update profile image path in the session or database
                        Session["ProfileImage"] = filePath;

                        // Display the uploaded image
                        imgProfileImage.ImageUrl = "~/OMAR/ProfileImages/" + fileName;

                        // Show success message
                        Response.Write("<script>alert('Profile image uploaded successfully.');</script>");
                    }
                    else
                    {
                        // Display an error message if the file is not an image
                        Response.Write("<script>alert('Only image files (.jpg, .jpeg, .png, .gif) are allowed.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    // Display an error message if something goes wrong
                    Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
                }
            }
            else
            {
                // Display a message if no file is selected
                Response.Write("<script>alert('Please select an image file to upload.');</script>");
            }
        }

        protected void button_Click(object sender, EventArgs e)
        {

        }
    }
}
