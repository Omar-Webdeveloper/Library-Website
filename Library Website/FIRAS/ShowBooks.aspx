<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowBooks.aspx.cs" Inherits="Library_Website.FIRAS.Files.ShowBooks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        #tableId {
            text-align: center;
            width: 100%;
        }

            #tableId tr {
                border-bottom: 1px solid #808080;
            }

                #tableId tr:last-child {
                    border-bottom: none;
                }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .card {
            align-items: center;
            background-color: #fff;
            border-radius: 20px;
            box-shadow: 0 0.4px 3.6px rgba(0, 0, 0, 0.004), 0 1px 8.5px rgba(0, 0, 0, 0.01), 0 1.9px 15.7px rgba(0, 0, 0, 0.019), 0 3.4px 28.2px rgba(0, 0, 0, 0.03), 0 6.3px 54.4px rgba(0, 0, 0, 0.047), 0 15px 137px rgba(0, 0, 0, 0.07);
            display: flex;
            flex-direction: column;
           
            top: auto;
            margin-bottom: 20px; 
            width: 50%; 
            top: auto;
            display:none;
            position:fixed;
            top:50%;
            right:25%;
            z-index:10;
        }

        .top {
            background-color: #eee;
            border-radius: 20px;
            margin: 16px 0;
            width: 260px;
        }

        .text {
            box-sizing: border-box;
            padding: 0 20px 20px;
            width: 100%;
        }

        .title {
            align-items: center;
            display: flex;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 4px;
            position: relative;
        }

        .tooltip {
            font-size: 16px;
            font-weight: normal;
            margin-top: 2px;
            position: relative;
        }

            .tooltip:hover {
                cursor: help;
            }

        .tooltip-spacing {
            height: 20px;
            margin: 8px;
            position: relative;
            width: 20px;
        }

        .tooltip-bg1 {
            background-color: #000;
            border-radius: 10px;
            content: " ";
            display: flex;
            height: 20px;
            position: absolute;
            top: 0;
            width: 20px;
        }

        .tooltip-bg2 {
            background-color: #fff;
            border-radius: 8px;
            content: " ";
            display: flex;
            height: 16px;
            left: 2px;
            position: absolute;
            top: 2px;
            width: 16px;
        }

        .tooltip-text {
            font-size: 14px;
            font-weight: bold;
            line-height: 20px;
            position: relative;
            text-align: center;
            width: 20px;
        }


        .buttons {
            display: flex;
            margin-top: 8px;
            width: 100%;
        }

        .button {
            align-items: center;
            background: #edf1f7;
            border-radius: 10px;
            cursor: pointer;
            display: flex;
            height: 50px;
            justify-content: center;
            margin: 0 5px 28px 20px;
            width: 100%;
        }

            .button:last-child {
                margin: 0 20px 20px 5px;
            }

        .button-primary {
            background-color: #0060f6;
            color: #fff;
        }

        .page-content {
            display: flex;
            flex-direction: column; 
            align-items: center; 
            width: 80%; 
            margin: 20px auto; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="page-content">
        <div class="container">
            <asp:Table runat="server" ID="tableId">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Title</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Author</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Category</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Status</asp:TableHeaderCell>

                </asp:TableHeaderRow>

            </asp:Table>

        </div>
        <div runat="server" class="card" ID="CardDiv">

            <asp:TextBox runat="server" ID="Title" PlaceHolder="Title"></asp:TextBox>
            <asp:TextBox runat="server" ID="Author" PlaceHolder="Author"></asp:TextBox>
            <asp:TextBox runat="server" ID="Category" PlaceHolder="Category"></asp:TextBox>

            <asp:DropDownList runat="server" ID="dropDownStatus">

                <asp:ListItem Value="0">-- Select Book Status --</asp:ListItem>
                <asp:ListItem Value="1">-- Available --</asp:ListItem>

                <asp:ListItem Value="2">-- Reserved --</asp:ListItem>

            </asp:DropDownList>

            <div class="text">      
                <div class="title">
                    Store your photos?
          <div class="tooltip">
              <div class="tooltip-spacing">
                  <div class="tooltip-bg1"></div>
                  <div class="tooltip-bg2"></div>
                  <div class="tooltip-text">?</div>
              </div>
          </div>

                </div>
                <div class="info">
                    Do you want to backup your precious moments securely in the cloud? If
          so, Thunderstorm Cloud Inc has got your back.
                </div>
            </div>
            <div class="buttons">
                
                <asp:Button runat="server" ID="cancelBtn" CssClass="button" OnClick="cancelBtn_Click" Text="Cancel"/>
                <asp:Button runat="server" CssClass="button button-primary" ID="confirmBtn" OnClick="confirmBtn_Click" Text="Do it!"/>

               
            </div>
        </div>
    </form>
</body>
</html>
