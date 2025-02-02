<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit Profile.aspx.cs" Inherits="Library_Website.OMAR.Edit_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body {
            background-color: #f7f7f7;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .profile-container {
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            border-radius: 10px;
            width: 100%;
            max-width: 500px;
            animation: fadeIn 1s ease;
            text-align: center;
        }

        .profile-container h1 {
            margin-bottom: 1rem;
            color: #333;
            font-size: 2rem;
        }

        .profile-container .form-group {
            text-align: left;
        }

        .profile-container label {
            font-weight: bold;
            color: #333;
        }

        .profile-container input[type="text"],
        .profile-container input[type="email"],
        .profile-container input[type="password"],
        .profile-container input[type="number"] {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: border-color 0.2s ease;
        }

        .profile-container input[type="text"]:focus,
        .profile-container input[type="email"]:focus,
        .profile-container input[type="password"]:focus,
        .profile-container input[type="number"]:focus {
            border-color: #0096FF;
            outline: none;
        }

        .profile-container button {
            width: 100%;
            padding: 0.75rem;
            background-color: #0096FF;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 1.1rem;
            cursor: pointer;
            font-weight: 700;
            transition: background-color 0.3s ease;
        }

        .profile-container button:hover {
            background-color: #0071BC;
        }

        .profile-container .img-thumbnail {
            margin-bottom: 1rem;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .btn-secondary {
            margin-top: 0.5rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="profile-container">
            <h1>User Profile</h1>
            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtName">Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtYearOfBirth">Year of Birth</label>
                <asp:TextBox ID="txtYearOfBirth" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="ddlGender">Gender</label>
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                    <asp:ListItem Value="Other">Other</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="fuProfileImage">Profile Image</label>
                <asp:FileUpload ID="fuProfileImage" runat="server" CssClass="form-control-file" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-secondary" OnClick="btnUpload_Click" />
            </div>
            <div class="form-group">
                <asp:Image ID="imgProfileImage" runat="server" CssClass="img-thumbnail" Width="150px" Height="150px" />
            </div>
            <div class="form-group">
                <label for="txtCountry">Country</label>
                <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
            <asp:Button ID="Changed_Password" runat="server" Text="Change My Password" CssClass="btn btn-secondary" OnClick="Password_Click" />
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

