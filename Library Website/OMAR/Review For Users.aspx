<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Review For Users.aspx.cs" Inherits="Library_Website.OMAR.Review_For_Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Reviews</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .review-container {
            border: 1px solid #ccc;
            padding: 20px;
            margin: 10px 0;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-radius: 5px;
        }
        .review-container p {
            margin-bottom: 10px;
        }
        .page-title {
            margin-bottom: 20px;
            font-size: 24px;
            color: #007bff;
        }
        .form-container {
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container my-5">
            <h2 class="page-title">User Reviews</h2>
            <asp:Repeater ID="ReviewsRepeater" runat="server">
                <ItemTemplate>
                    <div class="review-container">
                        <p><strong>Name:</strong> <%# Eval("FirstName") %> <%# Eval("LastName") %></p>
                        <p><strong>Email:</strong> <%# Eval("Email") %></p>
                        <p><strong>Message:</strong> <%# Eval("MessageContent") %></p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <div class="form-container">
                <h3>Submit a Review</h3>
                <div class="form-group">
                    <label for="EmailTextBox">Email:</label>
                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="PasswordTextBox">Password:</label>
                    <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="FirstNameTextBox">First Name:</label>
                    <asp:TextBox ID="FirstNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="LastNameTextBox">Last Name:</label>
                    <asp:TextBox ID="LastNameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="MessageTextBox">Message:</label>
                    <asp:TextBox ID="MessageTextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                </div>
                <asp:Button ID="SubmitReviewButton" runat="server" Text="Submit Review" OnClick="SubmitReviewButton_Click" CssClass="btn btn-primary" />
            </div>
        </div>
    </form>
</body>
</html>