<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin Dashboard.aspx.cs" Inherits="Library_Website.OMAR.Admin_Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .header {
            background-color: #4CAF50;
            padding: 10px;
            text-align: right;
            color: white;
        }
        .header .inbox, .header .profile {
            display: inline-block;
            margin-left: 20px;
        }
        .sidebar {
            width: 200px;
            height: 100%;
            background-color: #f1f1f1;
            position: fixed;
            top: 50px;
            left: 0;
            padding: 10px;
        }
        .content {
            margin-left: 220px;
            padding: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <span class="inbox">📥 Inbox</span>
            <span class="profile">👤 Admin Profile</span>
        </div>
        <div class="sidebar">
            <ul>
                <li><asp:Button runat="server" Text="dash" onclick="dash" /></li>
                <li><asp:Button runat="server" Text="Reset"  onclick="Reset"/></li>
                <li><asp:Button runat="server" Text="messages" onclick="messages"/></li>
            </ul>
        </div>
        <div class="content">
            <h1>Welcome to Admin Dashboard</h1>
            <p>This is the main content area.</p>
        </div>
    </form>
</body>

</html>
