<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="New_Edit_Profile.aspx.cs" Inherits="Library_Website.OMAR.New_Edit_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style>
        body {
            margin-top: 20px;
            background-color: #f2f6fc;
            color: #69707a;
        }

        .img-account-profile {
            height: 10rem;
        }

        .rounded-circle {
            border-radius: 50% !important;
        }

        .card {
            box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
        }

            .card .card-header {
                font-weight: 500;
            }

        .card-header:first-child {
            border-radius: 0.35rem 0.35rem 0 0;
        }

        .card-header {
            padding: 1rem 1.35rem;
            margin-bottom: 0;
            background-color: rgba(33, 40, 50, 0.03);
            border-bottom: 1px solid rgba(33, 40, 50, 0.125);
        }

        .form-control, .dataTable-input {
            display: block;
            width: 100%;
            padding: 0.875rem 1.125rem;
            font-size: 0.875rem;
            font-weight: 400;
            line-height: 1;
            color: #69707a;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #c5ccd6;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border-radius: 0.35rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        .nav-borders .nav-link.active {
            color: #0061f2;
            border-bottom-color: #0061f2;
        }

        .nav-borders .nav-link {
            color: #69707a;
            border-bottom-width: 0.125rem;
            border-bottom-style: solid;
            border-bottom-color: transparent;
            padding-top: 0.5rem;
            padding-bottom: 0.5rem;
            padding-left: 0;
            padding-right: 0;
            margin-left: 1rem;
            margin-right: 1rem;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <div>
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Profile Picture</div>
                        <div class="card-body text-center">
                            <!-- Profile picture image-->
                            <asp:Image ID="imgProfileImage" runat="server" CssClass="img-thumbnail" Width="150px" Height="150px" />
                            <!-- Profile picture help block-->
                            <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                            <!-- Profile picture upload button-->
                            <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-secondary" OnClick="btnUpload_Click" />
                        </div>
                    </div>
                </div>
        </div>

         <div class="col-xl-8">
     <!-- Account details card-->
     <div class="card mb-4">
         <div class="card-header">Account Details</div>
         <div class="card-body">
             <form runat="server">
                 <!-- Form Group (username)-->
                 <div class="mb-3">
                     <label class="small mb-1" for="inputUsername">Username (how your name will appear to other users on the site)</label>
                     <asp:TextBox ID="uName" class="form-control"   placeholder="Enter your username" runat="server" ></asp:TextBox>
                    
                 </div>
                 <!-- Form Row-->
                 <div class="row gx-3 mb-3">
                     <!-- Form Group (full name)-->
                     <div class="col-md-6">
                         <label class="small mb-1" for="inputFirstName">Full Name</label>
                         <asp:TextBox class="form-control"  placeholder="Enter your full name" ID="fName" runat="server"></asp:TextBox>
                        
                     </div>
                     <!-- Form Group (last name)-->
                   
                 </div>
                 <!-- Form Row        -->
                 <div class="row gx-3 mb-3">
                     <!-- Form Group (organization name)-->
                     <div class="col-md-6">
                         <label class="small mb-1" for="inputOrgName">Email address</label>
                         <asp:TextBox ID="email" runat="server"  class="form-control"  placeholder="Enter your email" ></asp:TextBox>
                        
                     </div>
                     <!-- Form Group (location)-->
                     <div class="col-md-6">
                         <label class="small mb-1" for="inputLocation">Password</label>
                         <asp:TextBox ID="password"  class="form-control" runat="server" placeholder="Enter your password" ></asp:TextBox>
                       
                     </div>
                 </div>
                 <!-- Form Group (email address)-->
                
                 <!-- Form Row-->
                 <div class="row gx-3 mb-3">
                     <!-- Form Group (phone number)-->
                     <div class="col-md-6">
                         <label class="small mb-1" for="inputPhone">Phone number</label>
                         <asp:TextBox  class="form-control" ID="tel" placeholder="+962 712 345 678" runat="server" ></asp:TextBox>
            
                     </div>
                     <!-- Form Group (birthday)-->
               <br />
                     <br />
                     <br />
                      <br />

                 <!-- Save changes button-->
               
                     <asp:Button  class="btn btn-primary"  runat="server" ID="button" Text="Save changes" OnClick="button_Click" />
                            
    </form>
</body>
</html>


 <%--<div class="form-group">
     <label for="fuProfileImage">Profile Image</label>
     <asp:FileUpload ID="fuProfileImage" runat="server" CssClass="form-control-file" />
 </div>
 <div class="form-group">
 </div>--%>