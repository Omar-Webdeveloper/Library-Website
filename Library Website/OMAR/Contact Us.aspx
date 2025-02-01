<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact Us.aspx.cs" Inherits="Library_Website.OMAR.Contact_Us" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style>
        .contact-section {
            padding: 60px 0;
            background-color: #f8f9fa;
        }

        .contact-section h2 {
            margin-bottom: 40px;
            font-size: 2.5em;
            color: #343a40;
        }

        .contact-section .form-container {
            max-width: 700px;
            margin: auto;
            background: #ffffff;
            padding: 30px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .contact-section .form-container .form-group {
            margin-bottom: 20px;
        }

        .contact-section .form-container .send-button {
            background-color: #007bff;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
        }

        .contact-section .form-container .send-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar Section -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Dropdown
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                        </li>
                    </ul>
                  
                </div>
            </div>
        </nav>
    
        <!-- Contact Us Section -->
        <section class="contact-section">
            <div class="container">
                <h2>Contact Us</h2>
                <div class="form-container">
                    <asp:Panel ID="ContactFormPanel" runat="server">
                        <div class="form-group">
                            <label for="first-name">First Name</label>
                            <asp:TextBox ID="FirstName" runat="server" CssClass="form-control"  required="required"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="last-name">Last Name</label>
                            <asp:TextBox ID="LastName" runat="server" CssClass="form-control"  required="required"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <asp:TextBox ID="Email" runat="server" CssClass="form-control"  TextMode="Email" required="required"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="message">Message</label>
                            <asp:TextBox ID="Message" runat="server" CssClass="form-control"  Rows="4" required="required"></asp:TextBox>
                        </div>
                        <asp:Button ID="SendButton" runat="server" CssClass="send-button" Text="Send" OnClick="SendButton_Click" />
                    </asp:Panel>
                </div>
            </div>
        </section>
    
        <!-- Section: Social media -->
        <!-- Section: Links  -->
        <section class="">
          <div class="container text-center text-md-start mt-5">
            <div class="row mt-3">
              <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                <h6 class="text-uppercase fw-bold mb-4">
                  <i class="fas fa-gem me-3"></i>Company name
                </h6>
                <p>
                  Here you can use rows and columns to organize your footer content. Lorem ipsum
                  dolor sit amet, consectetur adipisicing elit.
                </p>
              </div>
              <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                <h6 class="text-uppercase fw-bold mb-4">
                  Products
                </h6>
                <p>
                  <a href="#!" class="text-reset">Angular</a>
                </p>
                <p>
                  <a href="#!" class="text-reset">React</a>
                </p>
                <p>
                  <a href="#!" class="text-reset">Vue</a>
                </p>
                <p>
                  <a href="#!" class="text-reset">Laravel</a>
                </p>
              </div>
              <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                <h6 class="text-uppercase fw-bold mb-4">
                  Useful links
                </h6>
                <p>
                  <a href="#!" class="text-reset">Pricing</a>
                </p>
                <p>
                  <a href="#!" class="text-reset">Settings</a>
                </p>
                <p>
                  <a href="#!" class="text-reset">Orders</a>
                </p>
                <p>
                  <a href="#!" class="text-reset">Help</a>
                </p>
              </div>
              <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
                <p>
                  <i class="fas fa-envelope me-3"></i>
                  info@example.com
                </p>
                <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
                <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
              </div>
            </div>
          </div>
        </section>
         
     
<!-- Copyright -->
<div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2021 Copyright:
    <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
</div>
<!-- Copyright -->

</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>