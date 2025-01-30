<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Property_Hub.Index" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PropertyHub</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Custom CSS -->
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <!-- Single Server-Side Form -->
    <form id="form1" runat="server">
        <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="assests/property-hub-high-resolution-logo.png" alt="Property Hub Logo" height="30" class="d-inline-block align-text-top">
                Property Hub
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#properties">Properties</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#agents">Agents</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#contact">Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Login.aspx">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Register.aspx">Register</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Hero Section -->
        <div class="hero" style="background-image: url('assests/pexels-pixabay-302769.jpg'); background-size: cover; background-position: center; position: relative; height: 100vh;">
            <div class="hero-overlay" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5);"></div>
            <div class="hero-content" style="position: relative; z-index: 1; text-align: center; color: white; top: 50%; transform: translateY(-50%);">
                <h1 class="display-4">Find Your Dream Property</h1>
                <p class="lead">Explore the best properties with Property Hub</p>
                <a href="#inquiry" class="btn btn-primary btn-lg">Get Started</a>
            </div>
        </div>

        <!-- Advanced Search Section -->
        <div class="container mt-5">
            <div class="advanced-search">
                <h4>Advanced Search</h4>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <asp:Label ID="lblSearchLocation" runat="server" Text="Location" CssClass="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlSearchLocation" runat="server" CssClass="form-select">
                            <asp:ListItem Text="All Locations" Value=""></asp:ListItem>
                            <asp:ListItem Text="Hyderabad" Value="Hyderabad"></asp:ListItem>
                            <asp:ListItem Text="Bangalore" Value="Bangalore"></asp:ListItem>
                            <asp:ListItem Text="Chennai" Value="Chennai"></asp:ListItem>
                            <asp:ListItem Text="Mumbai" Value="Mumbai"></asp:ListItem>
                            <asp:ListItem Text="Pune" Value="Pune"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="text-end">
                    <asp:Button ID="btnAdvancedSearch" runat="server" Text="Search" CssClass="btn btn-success"/>
                </div>
            </div>
        </div>

        <!-- Property Listings -->
        <div class="container mt-5" id="properties">
            <h2 class="text-center mb-4">Featured Properties</h2>
            <div class="row">
                <asp:Repeater ID="rptProperties" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 mb-4">
                            <div class="card h-100">
                                <img src='<%# "ImageHandler.ashx?id=" + Eval("Id") %>' class="card-img-top" alt='<%# Eval("Title") %>' />
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Title") %></h5>
                                    <p class="card-text"><%# Eval("Location") %></p>
                                    <p class="card-text text-success font-weight-bold"><%# Eval("Price") %></p>
                                    <p class="card-text"><%# Eval("Description") %></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <!-- Interactive Map -->
            <div class="mt-5">
                <h3 class="text-center mb-4">Property Locations</h3>
                <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d442622.0959602825!2d73.862967!3d18.524616!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2bf2e67461101%3A0x828d43bf9d9ee343!2sPune%2C%20Maharashtra!5e1!3m2!1sen!2sin!4v1737615270205!5m2!1sen!2sin" width="100%" height="450" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>

        <!-- Inquiry Form Section -->
        <div class="container mt-5" id="inquiry">
            <div class="row justify-content-center">
                <div class="col-lg-8 form-container">
                    <h2 class="form-header text-center">Property Inquiry Form</h2>
                    <div class="mb-3">
                        <asp:Label ID="lblname" runat="server" Text="Name" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvname" runat="server" ControlToValidate="txtname"
                            ErrorMessage="Name is required." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class="mb-3">
                        <asp:Label ID="lblphonenumber" runat="server" Text="Phone Number" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtphonenumber" runat="server" CssClass="form-control" placeholder="Enter your phone number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvphonenumber" runat="server" ControlToValidate="txtphonenumber"
                            ErrorMessage="Phone Number is required." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revphonenumber" runat="server" ControlToValidate="txtphonenumber"
                            ErrorMessage="Invalid phone number."
                            ValidationExpression="^\d{10}$" Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                    </div>
                    <div class="mb-3">
                        <asp:Label ID="lblemail" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvemail" runat="server" ControlToValidate="txtemail"
                            ErrorMessage="Email is required." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revemail" runat="server" ControlToValidate="txtemail"
                            ErrorMessage="Invalid email format."
                            ValidationExpression="^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$" Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                    </div>
                    <div class="mb-3">
                        <asp:Label ID="lblbudget" runat="server" Text="Budget" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtbudget" runat="server" CssClass="form-control" placeholder="Enter your budget"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvbudget" runat="server" ControlToValidate="txtbudget"
                            ErrorMessage="Budget is required." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class="mb-3">
                        <asp:Label ID="lbllocation" runat="server" Text="Location" CssClass="form-label"></asp:Label>
                        <asp:DropDownList ID="ddllocation" runat="server" AppendDataBoundItems="true" CssClass="form-select">
                            <asp:ListItem Value="" Text="--Select Location--"></asp:ListItem>
                            <asp:ListItem Value="Hyderabad">Hyderabad</asp:ListItem>
                            <asp:ListItem Value="Bangalore">Bangalore</asp:ListItem>
                            <asp:ListItem Value="Chennai">Chennai</asp:ListItem>
                            <asp:ListItem Value="Mumbai">Mumbai</asp:ListItem>
                            <asp:ListItem Value="Pune">Pune</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:Label ID="lblamenities" runat="server" Text="Amenities" CssClass="form-label"></asp:Label>
                        <asp:CheckBoxList ID="cbamenities" runat="server" CssClass="form-check">
                            <asp:ListItem Value="Parking">Parking</asp:ListItem>
                            <asp:ListItem Value="SwimmingPool">Swimming Pool</asp:ListItem>
                            <asp:ListItem Value="Clubhouse">Club House</asp:ListItem>
                            <asp:ListItem Value="Powerbackup">Power Backup</asp:ListItem>
                            <asp:ListItem Value="Security">Security</asp:ListItem>
                        </asp:CheckBoxList>
                    </div>
                    <div class="mb-3">
                        <asp:Label ID="lbflattype" runat="server" Text="Type of Flat" CssClass="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlflattype" runat="server" AppendDataBoundItems="true" CssClass="form-select">
                            <asp:ListItem Value="" Text="--Select Type--"></asp:ListItem>
                            <asp:ListItem Value="1bhk">1 BHK</asp:ListItem>
                            <asp:ListItem Value="2bhk">2 BHK</asp:ListItem>
                            <asp:ListItem Value="3bhk">3 BHK</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:Label ID="lblpossession" runat="server" Text="Possession" CssClass="form-label"></asp:Label>
                        <asp:CheckBoxList ID="cbpossession" runat="server" CssClass="form-check">
                            <asp:ListItem Value="1week">1 Week</asp:ListItem>
                            <asp:ListItem Value="1month">1 Month</asp:ListItem>
                            <asp:ListItem Value="3months">3 Months</asp:ListItem>
                        </asp:CheckBoxList>
                    </div>
                    <div class="d-grid gap-2">
                        <asp:Button ID="Submitbutton" runat="server" Text="Submit" CssClass="btn btn-primary btn-lg" OnClick="Submitbutton_Click" />
                    </div>
                    <div class="mt-3">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Green" CssClass="text-center d-block"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>

<!-- Testimonials Section -->
<div class="container mt-5" id="testimonials">
    <h2 class="text-center mb-4">What Our Clients Say</h2>
    <div class="row">
        <!-- Testimonial 1 -->
        <div class="col-md-6">
            <div class="testimonial">
                <p>"Property Hub helped me find my dream home effortlessly. The team was professional and attentive."</p>
                <h5>- Rajesh Kumar</h5>
            </div>
        </div>
        <!-- Testimonial 2 -->
        <div class="col-md-6">
            <div class="testimonial">
                <p>"Excellent service and a wide range of properties to choose from. Highly recommend!"</p>
                <h5>- Priya Sharma</h5>
            </div>
        </div>
    </div>
</div>


    <!-- Footer -->
    <footer class="footer mt-5">
        <div class="container text-center">
            <p>&copy; 2024 Property Hub. All rights reserved.</p>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#" class="text-white">Privacy Policy</a></li>
                <li class="list-inline-item"><a href="#" class="text-white">Terms of Service</a></li>
                <li class="list-inline-item"><a href="#" class="text-white">Contact Us</a></li>
            </ul>
            <!-- Social Media Links -->
            <div class="social-media mt-3">
                <a href="#" class="text-white me-2"><i class="bi bi-facebook"></i>Facebook</a>
                <a href="#" class="text-white me-2"><i class="bi bi-twitter"></i>Twitter</a>
                <a href="#" class="text-white"><i class="bi bi-instagram"></i>Instagram</a>
            </div>
        </div>
    </footer>
</body>
</html>
