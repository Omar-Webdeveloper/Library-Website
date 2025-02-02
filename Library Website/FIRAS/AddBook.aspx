<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="Library_Website.FIRAS.AddBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .add {
            display: flex;
            flex-direction: column;
            text-align: center;
            justify-content: center !important;
        }

        .button {
            background-color: #4CAF50;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }

        .input-field {
            width: 98%; /* Adjust width as needed */
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="add">

<%--            <label>#Book_ID</label>
            <asp:TextBox runat="server" ID="Id" CssClass="input-field"></asp:TextBox>--%>

            <label>#Book_Title</label>
            <asp:TextBox runat="server" ID="Title" CssClass="input-field"></asp:TextBox>

            <label>#Book_Author</label>
            <asp:TextBox runat="server" ID="Author" CssClass="input-field"></asp:TextBox>

            <label>#Book_Category</label>
            <asp:TextBox runat="server" ID="Category" CssClass="input-field"></asp:TextBox>

            <label>#Book_Status </label>
            <asp:DropDownList runat="server" ID="Status" CssClass="input-field">
                                <asp:ListItem Value="0">-- Select Status --</asp:ListItem>
                <asp:ListItem Value="1"> Available</asp:ListItem>
                <asp:ListItem Value="2"> Reserved</asp:ListItem>

            </asp:DropDownList>

            <asp:Button class="button" runat="server" ID="addBookBtn" OnClick="addBookBtn_Click" Text="Add New Book" />
              <label runat="server" ID="messegeId" visible="false"> </label>

        </div>
    </form>
</body>
</html>
