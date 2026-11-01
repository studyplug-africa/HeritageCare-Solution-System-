<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HeritageCare_Solution.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HeritageCare Solutions</title>
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
                        <li><a href="index.aspx" class="nav-link active">Home</a></li>
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
                
                <h1>Manage &amp; Protect Our <span class="highlight">Heritage Sites</span></h1>
                <p>
                    A secure, centralised platform to register, track and preserve
                    historical and heritage sites, replacing paper files with a
                    modern digital record system.
                </p>
                <div class="banner-buttons">
                    <a href="Register.aspx" class="btn btn-primary btn-lg"><i class="fa-solid fa-user-plus"></i> Get Started</a>
                    <a href="Login.aspx" class="btn btn-outline btn-lg"><i class="fa-solid fa-right-to-bracket"></i> Sign In</a>
                </div>
            </div>
        </section>



        <section class="features">
            <div class="all_divs">
                <div class="section-head">
                    <h2>What you can do</h2>
                    <p>A few things HeritageCare lets authorised users handle in one place.</p>
                </div>
                <div class="features-grid">
                    <div class="feature-card">
                        <div class="feature-icon"><i class="fa-solid fa-landmark"></i></div>
                        <h3>Site Registration</h3>
                        <p>Register heritage sites with complete details in a centralised database.</p>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon"><i class="fa-solid fa-magnifying-glass"></i></div>
                        <h3>Search &amp; Filter</h3>
                        <p>Locate sites quickly and filter by condition to spot what needs attention.</p>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon"><i class="fa-solid fa-lock"></i></div>
                        <h3>Secure Access</h3>
                        <p>Session-based login means only authorised users can manage records.</p>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon"><i class="fa-solid fa-chart-line"></i></div>
                        <h3>Live Dashboard</h3>
                        <p>Personal dashboard with a live count of all registered heritage sites.</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="how">
            <div class="all_divs">
                <div class="section-head">
                    <h2>How it works</h2>
                    <p>Three simple steps from paper files to a digital record system.</p>
                </div>
                <div class="how-grid">
                    <div class="how-step">
                        <span class="how-num">01</span>
                        <h3>Create an account</h3>
                        <p>Register with your name, email, password and contact number.</p>
                    </div>
                    <div class="how-step">
                        <span class="how-num">02</span>
                        <h3>Add heritage sites</h3>
                        <p>Capture each site's details and condition through the web service.</p>
                    </div>
                    <div class="how-step">
                        <span class="how-num">03</span>
                        <h3>Track and update</h3>
                        <p>Search, filter and update records anytime. All changes reflect instantly.</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="cta">
            <div class="all_divs cta-inner">
                <h2>Ready to preserve our heritage?</h2>
                <p>Join HeritageCare Solutions and start managing heritage sites digitally.</p>
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