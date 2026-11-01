<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="HeritageCare_Solution.about" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About</title>
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
                    <img src="images\logo.png" alt="HeritageCare" />
                </a>

                <button type="button" class="nav-toggle" id="navToggle" aria-label="Menu">
                    <span></span><span></span><span></span>
                </button>

                <nav class="nav-menu" id="navMenu">
                    <ul>
                        <li><a href="index.aspx" class="nav-link">Home</a></li>
                        <li><a href="Services.aspx" class="nav-link">Services</a></li>
                        <li><a href="About.aspx" class="nav-link active">About</a></li>
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
                <h1>Our <span class="highlight">Story</span></h1>
                <p>
                    HeritageCare Solutions helps organisations manage and preserve
                    historical and heritage sites through one secure digital platform.
                </p>
                <div class="banner-buttons">
                    <a href="Register.aspx" class="btn btn-primary btn-lg"><i class="fa-solid fa-user-plus"></i> Get Started</a>
                    <a href="Login.aspx" class="btn btn-outline btn-lg"><i class="fa-solid fa-right-to-bracket"></i> Sign In</a>
                </div>
            </div>
        </section>

        <section class="about-news">
            <div class="all_divs about-news-inner">
                <div class="about-news-logo">
                    <img src="Images/logo.png" alt="HeritageCare" />
                </div>
                <div class="about-news-content">
                    <span class="news-tag">Latest News</span>
                    <h2>HeritageCare moves all site records online</h2>
                    <p>
                        HeritageCare Solutions has completed the move from paper files and
                        spreadsheets to a centralised web-based system. Site records are now
                        stored in a single SQL Server database, so authorised users can add,
                        view, search, update and delete site information from one place.
                    </p>
                    <ul class="news-list">
                        <li><i class="fa-solid fa-circle-check"></i> No more misplaced information or duplicate records</li>
                        <li><i class="fa-solid fa-circle-check"></i> Site conditions can be tracked and filtered at any time</li>
                        <li><i class="fa-solid fa-circle-check"></i> All changes reflect immediately in the database</li>
                    </ul>
                </div>
            </div>
        </section>

        <section class="services-list">
            <div class="all_divs">
                <div class="services-grid">

                    <div class="service-card">
                        <div class="service-icon"><i class="fa-solid fa-landmark"></i></div>
                        <h3>Who We Are</h3>
                        <p>HeritageCare Solutions is a small organisation that manages and preserves historical and heritage sites across the region.</p>
                    </div>

                    <div class="service-card">
                        <div class="service-icon"><i class="fa-solid fa-folder-open"></i></div>
                        <h3>Why We Changed</h3>
                        <p>As the number of sites grew, paper files and spreadsheets caused misplaced information, duplicate records and slow tracking.</p>
                    </div>

                    <div class="service-card">
                        <div class="service-icon"><i class="fa-solid fa-database"></i></div>
                        <h3>What We Built</h3>
                        <p>A web-based system with a centralised database where authorised users register, log in and manage heritage site information.</p>
                    </div>

                    <div class="service-card">
                        <div class="service-icon"><i class="fa-solid fa-users"></i></div>
                        <h3>Who It Serves</h3>
                        <p>Authorised users who need to add, view, search, update and delete site records, and keep their own profile up to date.</p>
                    </div>

                    <div class="service-card">
                        <div class="service-icon"><i class="fa-solid fa-code"></i></div>
                        <h3>How It Works</h3>
                        <p>An ASP.NET website for users, a SQL Server database for records, and an ASMX web service that exposes site management operations.</p>
                    </div>

                    <div class="service-card">
                        <div class="service-icon"><i class="fa-solid fa-shield-halved"></i></div>
                        <h3>Our Promise</h3>
                        <p>Accurate records, real-time updates and secure access, so the history we protect stays safe for the future.</p>
                    </div>

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