<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Library_Website.OMAR.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Messages</title>
    <style>
        .message-container {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px 0;
        }
        .reply-container {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>User Messages</h2>
            <asp:Repeater ID="MessagesRepeater" runat="server">
                <ItemTemplate>
                    <div class="message-container">
                        <p><strong>Name:</strong> <%# Eval("Name") %></p>
                        <p><strong>Message:</strong> <%# Eval("MessageContent") %></p>
                        <div class="reply-container">
                            <asp:TextBox ID="ReplyTextBox" runat="server" CssClass="form-control" Rows="3" TextMode="MultiLine"></asp:TextBox>
                            <asp:Button ID="ReplyButton" runat="server" Text="Reply" OnClick="ReplyButton_Click" CommandArgument='<%# Eval("Email") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>