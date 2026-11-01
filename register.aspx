<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="HeritageCare_Solution.register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/landing.css" />
</head>
<body>
    <form id="form1" runat="server">

        <header class="navbar" id="navbar">
            <div class="all_divs nav-container">
                <a href="index.aspx" class="logo" aria-label="HeritageCare home">
                    <img src="Images/logo.png" alt="HeritageCare" />
                </a>

                <button type="button" class="nav-toggle" id="navToggle" aria-label="Menu">
                    <span></span><span></span><span></span>
                </button>

                <nav class="nav-menu" id="navMenu">
                    <ul>
                        <li><a href="index.aspx" class="nav-link">Home</a></li>
                        <li><a href="Services.aspx" class="nav-link">Services</a></li>
                        <li><a href="About.aspx" class="nav-link">About</a></li>
                        <li><a href="Contact.aspx" class="nav-link">Contact</a></li>
                    </ul>
                    <div class="nav-actions">
                        <a href="Login.aspx" class="btn btn-outline">Login</a>
                        <a href="Register.aspx" class="btn btn-primary">Register</a>
                    </div>
                </nav>
            </div>
        </header>

        <section class="banner">
            <div class="all_divs banner-inner">
                <h1>Create an <span class="highlight">Account</span></h1>
                <p>
                    Register to start managing and preserving heritage site records.
                </p>
                <div class="banner-buttons">
                    <a href="Login.aspx" class="btn btn-outline btn-lg"><i class="fa-solid fa-right-to-bracket"></i> Already have an account? Sign In</a>
                </div>
            </div>
        </section>

        <section class="auth-section">
            <div class="all_divs auth-grid">

                <div class="auth-info">
                    <span class="news-tag">Join Us</span>
                    <h2>Why register?</h2>
                    <p>An account gives you secure access to the HeritageCare management system.</p>

                    <ul class="auth-list">
                        <li><i class="fa-solid fa-circle-check"></i> Register and track heritage sites</li>
                        <li><i class="fa-solid fa-circle-check"></i> Search and filter sites by condition</li>
                        <li><i class="fa-solid fa-circle-check"></i> Update or delete your own records</li>
                        <li><i class="fa-solid fa-circle-check"></i> View your personal dashboard</li>
                        <li><i class="fa-solid fa-circle-check"></i> Keep your profile information up to date</li>
                    </ul>
                </div>

                <div class="auth-card">
                    <h2>Registration</h2>

                    <div class="form-group">
                        <label for="txtFullName">Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Your full name" />
                    </div>

                    <div class="form-group">
                        <label for="txtEmail">Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="your email @gmail.com" />
                    </div>

                    <div class="form-group">
                        <label for="txtPassword">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Create a password" />
                    </div>

                    <div class="form-group">
                        <label for="txtContact">Contact Number</label>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" placeholder="e.g. 082 123 4567" />
                    </div>

<asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary btn-lg btn-block" OnClick="user_registering" />

                    <asp:Label ID="lblMessage" runat="server" CssClass="form-message" />

                    <p class="auth-foot">Already registered? <a href="Login.aspx">Sign in here</a></p>
                </div>

            </div>
        </section>

        <section class="cta">
            <div class="all_divs cta-inner">
                <h2>Ready to get started?</h2>
                <p>Create an account and start managing heritage sites digitally today.</p>
                <a href="Login.aspx" class="btn btn-primary btn-lg"><i class="fa-solid fa-right-to-bracket"></i> Go to Login</a>
            </div>
        </section>

        <footer class="footer">
            <div class="all_divs footer-container">
                <div class="footer-col">
                    <a href="index.aspx" class="logo" aria-label="HeritageCare home">
                        <img src="Images/logo.png" alt="HeritageCare" />
                    </a>
                    <p>Managing and preserving historical and heritage sites through a secure digital platform.</p>
                </div>
                <div class="footer-col">
                    <h4>Quick Links</h4>
                    <ul>
                        <li><a href="index.aspx">Home</a></li>
                        <li><a href="Services.aspx">Services</a></li>
                        <li><a href="About.aspx">About</a></li>
                        <li><a href="Contact.aspx">Contact</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Account</h4>
                    <ul>
                        <li><a href="Register.aspx">Register</a></li>
                        <li><a href="Login.aspx">Login</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Contact</h4>
                    <ul class="footer-contact">
                        <li><i class="fa-solid fa-location-dot"></i> 123 Heritage Avenue, Cape Town</li>
                        <li><i class="fa-solid fa-phone"></i> +27 21 555 0123</li>
                        <li><i class="fa-solid fa-envelope"></i> info@heritagecare.co.za</li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; <%= DateTime.Now.Year %> HeritageCare Solutions. All rights reserved.</p>
            </div>
        </footer>

    </form>

    <script src="js/menu.js"></script>
</body>
</html>