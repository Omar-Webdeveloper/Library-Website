<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="New Reset Password.aspx.cs" Inherits="Library_Website.OMAR.New_Reset_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style>
       @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap');

*:not(i) {
    font-family: "Montserrat", serif !important;
}

.navbar {
    background-color: #ECE4D3;
}

.navbar-nav .nav-link {
    position: relative;
    padding-bottom: 5px;
    transition: color 0.3s ease-in-out;
    margin-left: 40px;
    color: #CD7507;
    font-weight: 500;
}

    .navbar-nav .nav-link::after {
        content: "";
        position: absolute;
        left: 50%;
        bottom: 0;
        width: 0;
        height: 3px;
        background-color: #285f59;
        transition: all 0.3s ease-in-out;
        transform: translateX(-50%);
    }

    .navbar-nav .nav-link:hover::after {
        width: 100%;
    }

    /* .navbar-nav .nav-link:active::after {
    width: 100%;
    content: "";
    position: absolute;
    left: 50%;
    bottom: 0;
    height: 3px;
    background-color: #285f59; 
    transition: all 0.3s ease-in-out;
    transform: translateX(-50%);
} */

    .navbar-nav .nav-link:hover {
        color: #285f59;
    }

/*------- Footer Section Start -----------*/
footer {
    color: #caced1 !important;
    border: none;
}

    footer li {
        margin-top: 20px;
        margin-bottom: 20px;
    }

    footer .Careers {
        cursor: pointer;
        color: #1E88E5;
    }

    footer .row-1 {
        background-color: #1b3f3b !important;
        padding: 1%;
        width: 100%;
    }

    footer .row-2 {
        background-color: #285f59 !important;
    }

    footer i {
        font-size: 1.5rem;
        margin-left: 2%;
    }

    footer .nav-link {
        position: relative;
        padding-bottom: 5px;
        transition: color 0.3s ease-in-out;
        margin-left: 40px;
        /* color: #CD7507 ; */
        /* font-weight: 600; */
        width: fit-content;
    }

        footer .nav-link::after {
            content: "";
            position: absolute;
            left: 50%;
            bottom: 0;
            width: 0;
            height: 3px;
            background-color: #CD7507;
            transition: all 0.3s ease-in-out;
            transform: translateX(-50%);
        }

        footer .nav-link:hover::after {
            width: 100%;
        }

        footer .nav-link:hover {
            color: #CD7507;
        }

@media (max-width: 426px) {
    footer .nav-link {
        margin-left: 1% !important;
    }

    .navbar .nav-link {
        margin: 2% 0 2% 5%;
    }

    .navbar-toggler:focus,
    .navbar-toggler:active {
        outline: none !important;
        box-shadow: none !important;
        border: none;
    }

    .navbar-toggler {
        border: none;
    }

    .navbar {
        padding: 5%;
    }

    .navbar-brand {
        width: 17% !important;
    }
}

/*------- Footer Section End -----------*/ 
    </style>

</head>
<body>
    <form id="form1" runat="server">
                    <!--Navbar Start-->
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container">
            <a class="navbar-brand" href="#" style="width: 5%; padding: 0;"><img src="Images\logo.png" width="100%" /></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Home.aspx">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!--Navbar End-->
        <div>
            <div class="container my-5">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <asp:Button class="nav-link active" ID="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Profile</asp:Button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <asp:Button class="nav-link" ID="bookTab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Book Reservations</asp:Button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <asp:Button class="nav-link" ID="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Room Reservations</asp:Button>
                    </li>
                </ul>

                <div class="tab-content mt-3" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <div class="container mt-5">
                            <div class="card shadow-lg p-4">
                                <div class="text-center">

                                    <asp:Image ID="Image1" runat="server" ImageUrl="Images/logo.png" AlternateText="My Image" Width="300px" />
                                </div>
                                <div class="card-body">
                                    



                                    <h1>Reset Password</h1>
            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtOldPassword">Old Password</label>
                <asp:TextBox ID="txtOldPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtNewPassword">New Password</label>
                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtConfirmPassword">Confirm New Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" CssClass="btn btn-primary" OnClick="btnResetPassword_Click" />







                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <h2 class="mb-3">Current Bookings</h2>
                        <asp:Table runat="server" ID="currentBookingsTable">
                            <asp:TableRow>
                                <asp:TableHeaderCell>Book Name</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Borrow Date</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Status</asp:TableHeaderCell>
                            </asp:TableRow>
                        </asp:Table>

                        <h2 class="mb-3">Previous Bookings</h2>
                        <asp:Table runat="server" ID="previousBookingsTable">
                            <asp:TableRow>
                                <asp:TableHeaderCell>Book Name</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Borrow Date</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Return Date</asp:TableHeaderCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>

                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                        <h2 class="mb-3">Current Reservations</h2>
                        <asp:Table runat="server" ID="currentRooms">
                            <asp:TableRow>
                                <asp:TableHeaderCell>Room Type</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Reservations Date</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Status</asp:TableHeaderCell>
                            </asp:TableRow>
                        </asp:Table>

                        <h2 class="mb-3">Previous Reservations</h2>
                        <asp:Table runat="server" ID="previousRooms">
                            <asp:TableRow>
                                <asp:TableHeaderCell>Room Type</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Reservations Date</asp:TableHeaderCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                </div>
            </div>
        </div>
             <footer>
        <div class="justify-content-center mb-0 pt-5 pb-0 row-2 px-3">
            <div class="col-12">
                 <div class="row row-2">
                     <div class="col-sm-3 text-md-center"><img src="Images\logo.png" width="30%" /></div>
                     <div class="col-sm-3  my-sm-0 mt-5"><ul class="list-unstyled"><li class="mt-0 nav-item"><a class="nav-link" href="#">Home</a></li><li class="nav-item"><a class="nav-link" href="#">Services</a></li></ul></div>
                     <div class="col-sm-3  my-sm-0 mt-5"><ul class="list-unstyled"><li class="mt-0 nav-item"><a class="nav-link" href="#">Contact Us</a></li><li class="nav-item"><a class="nav-link" href="#">About Us</a></li><li class="nav-item" ><a class="nav-link" href="#">Location</a></li></ul></div>
                     <div class="col-sm-3  my-sm-0 mt-5"><ul class="list-unstyled"><li class="mt-0 ">Have Any Question?</li><li>
                         <i class="fa-regular fa-envelope" style="font-size: 1rem; margin-right: 2%;"></i>bookunity@email.com</li><li><i class="fa-solid fa-phone" style="font-size: 1rem; margin-right: 2%;"></i>+962-000000000</li></ul></div>
                 </div>  
            </div>
        </div>
        <div class=" justify-content-center mt-0 pt-0 row-1 mb-0 pb-0 px-sm-3 px-2">
             <div class="col-12">
                 <div class="row row-1 no-gutters">
                     <div class="col-sm-3 col-auto text-center"><small>&#9400; BookUnity 2025</small></div><div class="col-md-3 col-auto "></div><div class="col-md-3 col-auto"></div>
                     <div class="col  my-auto text-md-left text-right "> <small> Follow Us <span><i class="fa-brands fa-instagram"></i></span> <span><i class="fa-brands fa-square-facebook"></i></span><span><i class="fa-brands fa-whatsapp"></i></span></small>  </div> 
                 </div>
             </div>
         </div>
     </footer>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

