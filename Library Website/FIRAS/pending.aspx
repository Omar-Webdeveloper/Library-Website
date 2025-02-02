<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pending.aspx.cs" Inherits="Library_Website.FIRAS.pending" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="tableId" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Email</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Book_ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Book_Title</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Date-End</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Time-End</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Status</asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
