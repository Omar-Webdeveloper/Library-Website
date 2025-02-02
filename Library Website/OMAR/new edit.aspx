<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new edit.aspx.cs" Inherits="Library_Website.OMAR.new_edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Edit Profile</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Edit Profile</h2>
            <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" ReadOnly="true"></asp:TextBox><br />

            <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><br />

            <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />

            <asp:Label ID="lblYearOfBirth" runat="server" Text="Year of Birth:"></asp:Label>
            <asp:TextBox ID="txtYearOfBirth" runat="server"></asp:TextBox><br />

            <asp:Label ID="lblGender" runat="server" Text="Gender:"></asp:Label>
            <asp:DropDownList ID="ddlGender" runat="server">
                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
            </asp:DropDownList><br />

            <asp:Label ID="lblCountry" runat="server" Text="Country:"></asp:Label>
            <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox><br />

            <asp:Label ID="lblProfileImage" runat="server" Text="Profile Image:"></asp:Label><br />
            <asp:Image ID="imgProfileImage" runat="server" Width="100px" Height="100px" /><br />
            <asp:FileUpload ID="fuProfileImage" runat="server" /><br />
            <asp:Button ID="btnUpload" runat="server" Text="Upload Image" OnClick="btnUpload_Click" /><br /><br />

            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            <asp:Button ID="btnPassword" runat="server" Text="Reset Password" OnClick="Password_Click" />
        </div>
    </form>
</body>
</html>