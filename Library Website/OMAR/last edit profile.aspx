<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="last edit profile.aspx.cs" Inherits="Library_Website.OMAR.last_edit_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Profile</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container my-5">
            <h2 class="page-title">Edit Profile</h2>
            <div class="form-group">
                <label for="FirstNameTextBox">First Name:</label>
                <asp:TextBox ID="FirstNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="LastNameTextBox">Last Name:</label>
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
            <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" CssClass="btn btn-primary" />
        </div>
    </form>
</body>
</html>