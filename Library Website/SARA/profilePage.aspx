<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="Library_Website.SARA.ProfilePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                                    <h3 class="text-center mb-4">Hi
                                        <asp:Label ID="userN" runat="server"></asp:Label></h3>
                                    <ul class="list-group">
                                        <li class="list-group-item"><span class="info-label">Name:</span>
                                            <asp:Label ID="fName" runat="server" /></li>
                                        <li class="list-group-item"><span class="info-label">Username:</span>
                                            <asp:Label ID="uName" runat="server" /></li>
                                        <li class="list-group-item"><span class="info-label">Phone:</span>
                                            <asp:Label ID="tel" runat="server" /></li>
                                        <li class="list-group-item"><span class="info-label">Email:</span>
                                            <asp:Label ID="email" runat="server" /></li>

                                    </ul>
                                    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger mt-3 d-block text-center" />
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
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
