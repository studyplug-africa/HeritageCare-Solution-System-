<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="HeritageCare_Solution.contact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact</title>
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
                        <li><a href="Contact.aspx" class="nav-link active">Contact</a></li>
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
                <h1>Get in <span class="highlight">Touch</span></h1>
                <p>
                    Have a question about managing your heritage sites?
                    Send us a message and we will get back to you.
                </p>
                <div class="banner-buttons">
                    <a href="Register.aspx" class="btn btn-primary btn-lg"><i class="fa-solid fa-user-plus"></i> Get Started</a>
                    <a href="Login.aspx" class="btn btn-outline btn-lg"><i class="fa-solid fa-right-to-bracket"></i> Sign In</a>
                </div>
            </div>
        </section>

        <section class="contact-section">
            <div class="all_divs contact-grid">

                <div class="contact-info">
                    <span class="news-tag">Contact Details</span>
                    <h2>Reach HeritageCare</h2>
                    <p>We are here to help with any questions about heritage site management.</p>

                    <div class="contact-item">
                        <div class="service-icon"><i class="fa-solid fa-location-dot"></i></div>
                        <div>
                            <h4>Address</h4>
                            <p>123 Heritage Avenue, Cape Town, South Africa</p>
                        </div>
                    </div>

                    <div class="contact-item">
                        <div class="service-icon"><i class="fa-solid fa-phone"></i></div>
                        <div>
                            <h4>Phone</h4>
                            <p>+27 21 555 0123</p>
                        </div>
                    </div>

                    <div class="contact-item">
                        <div class="service-icon"><i class="fa-solid fa-envelope"></i></div>
                        <div>
                            <h4>Email</h4>
                            <p>info@heritagecare.co.za</p>
                        </div>
                    </div>

                    <div class="contact-item">
                        <div class="service-icon"><i class="fa-solid fa-clock"></i></div>
                        <div>
                            <h4>Hours</h4>
                            <p>Monday to Friday, 08:00 to 16:30</p>
                        </div>
                    </div>
                </div>

                <div class="contact-form-card">
                    <h2>Send a Message</h2>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="txtName">Full Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your name" />
                        </div>
                        <div class="form-group">
                            <label for="txtEmail">Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="you@example.com" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="txtSubject">Subject</label>
                        <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="How can we help?" />
                    </div>

                    <div class="form-group">
                        <label for="txtMessage">Message</label>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Write your message..." />
                    </div>

                    <asp:Button ID="btnSend" runat="server" Text="Send Message" CssClass="btn btn-primary btn-lg" OnClick="contacting" />

                    <asp:Label ID="lblMessage" runat="server" CssClass="form-message" />
                </div>

            </div>
        </section>

        <section class="cta">
            <div class="all_divs cta-inner">
                <h2>Ready to get started?</h2>
                <p>Create an account and start managing heritage sites digitally today.</p>
                <a href="Register.aspx" class="btn btn-primary btn-lg"><i class="fa-solid fa-arrow-right"></i> Create an Account</a>
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