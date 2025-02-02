<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Library_Website.SARA.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .header {
            background-color: #4a6c6f;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .logo {
            height: 50px;
        }
        .card {
            max-width: 600px;
            margin: auto;
            border-radius: 10px;
        }
        .user-image {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
            border: 4px solid #4a6c6f;
        }
        .list-group-item {
            background-color: #eef1f3;
            border: none;
        }
        .info-label {
            font-weight: bold;
            color: #2c3e50;
        }
    </style>
</head>
<body>

    <!-- الهيدر مع اللوقو -->
   
        <div></div> <!-- عنصر فارغ للموازنة -->
    

    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <div class="text-center">
             
                <asp:Image ID="Image1" runat="server" ImageUrl="Images/logo.png" AlternateText="My Image" Width="300px" />
            </div>
            <div class="card-body">
                <h3 class="text-center mb-4">User Information</h3>
                <ul class="list-group">
                    <li class="list-group-item"><span class="info-label">Name:</span> <asp:Label ID="fName" runat="server" /></li>
                    <li class="list-group-item"><span class="info-label">Username:</span> <asp:Label ID="uName" runat="server" /></li>
                    <li class="list-group-item"><span class="info-label">Phone:</span> <asp:Label ID="tel" runat="server" /></li>
                    <li class="list-group-item"><span class="info-label">Email:</span> <asp:Label ID="email" runat="server" /></li>
                 
                </ul>
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger mt-3 d-block text-center" />
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
