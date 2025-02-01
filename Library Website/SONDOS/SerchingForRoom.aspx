<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SerchingForRoom.aspx.cs" Inherits="Library_Website.SONDOS.SerchingForRoom" %>

<!DOCTYPE html>   
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Rooms</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="author" content="colorlib.com">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,800" rel="stylesheet" />
    <link href="/SONDOS/assets/css/index.css" rel="stylesheet" />
    <link href="/Styles/roomSearch.css" rel="stylesheet" />
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <!-- ***** Header Area Start ***** -->
        <div class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s" style="color: azure !important;">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <a href="index.html" class="logo">
                                <img src="/SONDOS/images/logo.png" alt="Logo" style="height: 115px;">
                            </a>
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li><a href="index.html" style="color: azure;">Home</a></li>
                                <li><a href="roomReser.html" class="active">Room</a></li>
                                <li><a href="bookReservations.html" style="color: azure;">Book</a></li>
                                <li><a href="index.html" style="color: azure;">Services</a></li>
                                <li><a href="index.html" style="color: azure;">About</a></li>
                                <li><a href="index.html" style="color: azure;">Newsletter</a></li>
                                <li>
                                    <div class="gradient-button"><a id="modal_trigger" href="#modal">logIn</a></div>
                                </li>
                            </ul>
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Header Area End ***** -->

        <div class="s006">
            <fieldset>
                <legend>What Kind of Rooms are you looking for?</legend>
                <div class="inner-form">
                    <div class="input-field">
                        <asp:Button ID="btnSearch" runat="server" CssClass="btn-search" Text="&#128269;" OnClick="btnSearch_Click" />
                        <asp:TextBox ID="searchBar" runat="server" placeholder="Search for rooms..." />
                    </div>
                </div>
                <div class="suggestion-wrap">
                    <span>Single</span>
                    <span>Double</span>
                    <span>Meeting</span>
                    <span>Studying</span>
                </div>
            </fieldset>
        </div>

      
        <div id="services" class="services section">
            <div class="container">
                <div class="row">
                    <!-- Single Room -->
                    <div class="col-lg-3">
                        <div class="service-item first-service">
                            <h4>Single Rooms</h4>
                            <p>A cozy and quiet room perfect for focused individual study or personal work. Ideal for those who need a peaceful space to concentrate.</p><br />
                            <asp:Label ID="singleLabel" runat="server" Text="" Visible="false"></asp:Label> 
                            <asp:Button ID="singleBook" runat="server" OnClick="singleBook_Click" Text="Book Now!!" />
                        </div>
                    </div>

           
                    <div class="col-lg-3">
                        <div class="service-item second-service">
                            <h4>Double Rooms</h4>
                            <p>A spacious room designed for two, perfect for collaborative study or discussions. A great choice for partners working on projects together.</p><br />
                            <asp:Label ID="doubleLabel" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Button ID="doubleRoom" runat="server" OnClick="doubleRoom_Click" Text="Book Now!!" />

                        </div>
                    </div>

        
                    <div class="col-lg-3">
                        <div class="service-item third-service">
                            <h4>Meeting Rooms</h4>
                            <p>A dedicated study room with all the essentials for an optimal learning environment. Quiet, comfortable, and designed to help you focus on your studies.</p><br />
                            <asp:Label ID="meetingLabel" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Button ID="meetingRoom" runat="server" OnClick="meetingRoom_Click" Text="Book Now!!" />

                        </div>
                    </div>

           
                    <div class="col-lg-3">
                        <div class="service-item fourth-service">
                            <h4>Studying Rooms</h4>
                            <p>A professional and well-equipped meeting room, ideal for group discussions, workshops, or business meetings. Everything you need to have a productive session.</p>
                            <asp:Label ID="studyingLabel" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Button ID="studyingRoom" runat="server" OnClick="studyingRoom_Click" Text="Book Now!!" />

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Room cards end -->

        <!-- Footer section -->
        <footer id="newsletter">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="section-heading">
                            <h4>Join our community for book updates, events, and community news!</h4>
                        </div>
                    </div>
                    <div class="col-lg-6 offset-lg-3">
                        <form id="search" action="#" method="GET">
                            <div class="row">
                                <div class="col-lg-6 col-sm-6">
                                    <fieldset>
                                        <input type="address" name="address" class="email" placeholder="Email Address..." autocomplete="on" required>
                                    </fieldset>
                                </div>
                                <div class="col-lg-6 col-sm-6">
                                    <fieldset>
                                        <button type="submit" class="main-button">Subscribe Now <i class="fa fa-angle-right"></i></button>
                                    </fieldset>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3">
                        <div class="footer-widget">
                            <h4>Contact Us</h4>
                            <p>BookUnity - RJ, 22795-008, Irbid</p>
                            <p><a href="#">010-020-0340</a></p>
                            <p><a href="#">info@BookUnity.co</a></p>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="footer-widget">
                            <h4>About Us</h4>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Services</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Testimonials</a></li>
                                <li><a href="#">Pricing</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="footer-widget">
                            <h4>Useful Links</h4>
                            <ul>
                                <li><a href="#">Free Apps</a></li>
                                <li><a href="#">App Engine</a></li>
                                <li><a href="#">Programming</a></li>
                                <li><a href="#">Development</a></li>
                                <li><a href="#">App News</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="footer-widget">
                            <h4>About Our Company</h4>
                            <div class="logo">
                                <img src="assets/images/logo.png" alt="">
                            </div>
                            <p>Join our community newsletter to stay updated on new book arrivals, upcoming events, and the latest trends in reading and collaboration!</p>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="copyright-text">
                            <p>Copyright © 2022 Bookunity Company. All Rights Reserved.</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer section end -->

        <!-- Scripts -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="/SONDOS/assets/js/owl-carousel.js"></script>
        <script src="/SONDOS/assets/js/animation.js"></script>
        <script src="/SONDOS/assets/js/imagesloaded.js"></script>
        <script src="/SONDOS/assets/js/popup.js"></script>
        <script src="/SONDOS/assets/js/custom.js"></script>
    </form>
s



        </div>
   
</body>
</html>
