<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Last Change Password.aspx.cs" Inherits="Library_Website.OMAR.Last_Change_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container my-5">
            <h2 class="page-title">Change Password</h2>
            <div class="form-group">
                <label for="EmailTextBox">Email:</label>
                <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="OldPasswordTextBox">Old Password:</label>
                <asp:TextBox ID="OldPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="NewPasswordTextBox">New Password:</label>
                <asp:TextBox ID="NewPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="ConfirmPasswordTextBox">Confirm New Password:</label>
                <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <asp:Button ID="ChangePasswordButton" runat="server" Text="Change Password" OnClick="ChangePasswordButton_Click" CssClass="btn btn-primary" />
        </div>
    </form>
</body>
</html>
