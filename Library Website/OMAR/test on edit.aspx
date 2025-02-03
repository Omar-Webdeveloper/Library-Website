<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test on edit.aspx.cs" Inherits="Library_Website.OMAR.test_on_edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        /* Your custom styles here */
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg sticky-top">
            <!-- Navbar content here -->
        </nav>

        <!-- Edit Profile Section -->
        <div class="profile-container">
            <h2 class="text-center">Edit Profile</h2>

            <div class="form-group">
                <label for="FirstNameTextBox">First Name:</label>
                <asp:TextBox ID="FirstNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="LastNameTextBox">User Name:</label>
                <asp:TextBox ID="LastNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="PhoneNumberTextBox">Phone Number:</label>
                <asp:TextBox ID="PhoneNumberTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="EmailTextBox">Email:</label>
                <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="PasswordTextBox">Password:</label>
                <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="ProfileImagePathTextBox">Profile Image Path:</label>
                <asp:TextBox ID="ProfileImagePathTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="FileUpload1">Profile Image:</label>
                <div style="display:flex; flex-direction:row;">
                    <asp:FileUpload ID="FileUpload1" runat="server" Style="display: block; flex:1;" CssClass="input-field"/>
                    <asp:Button ID="Button1" runat="server" Text="Upload File" style="flex:1;" CssClass="input-field" OnClick="Button1_Click"/>
                </div>
            </div>

            <asp:Button ID="SaveButton" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="SaveButton_Click"/>
        </div>

        <!-- Footer -->
        <footer>
            <!-- Footer content here -->
        </footer>
    </form>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>