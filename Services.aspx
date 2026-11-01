<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="HeritageCare_Solution.Services" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Services </title>
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
                        <li><a href="Services.aspx" class="nav-link active">Services</a></li>
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
           
           <h1> Our <span class="highlight">Services</span></h1>
                           <p>Everything you need to manage heritage site records in one place.</p>

           <div class="banner-buttons">
               <a href="Register.aspx" class="btn btn-primary btn-lg"><i class="fa-solid fa-user-plus"></i> Get Started</a>
               <a href="Login.aspx" class="btn btn-outline btn-lg"><i class="fa-solid fa-right-to-bracket"></i> Sign In</a>
           </div>
       </div>
   </section>



        <section class="services-list">
            <div class="all_divs">
                <div class="services-grid">

                    <div class="service-card">
                        <div class="service-icon"><i class="fa-solid fa-landmark"></i></div>
                        <h3>Site Registration</h3>
                        <p>Register new heritage sites with complete details and link each record to your account for easy tracking.</p>
                        <ul class="service-points">
                            <li><i class="fa-solid fa-check"></i> Full site details captured</li>
                            <li><i class="fa-solid fa-check"></i> Linked to your user profile</li>
                            <li><i class="fa-solid fa-check"></i> Saved to the central database</li>
                        </ul>
                    </div>

                    <div class="service-card">
                        <div class="service-icon"><i class="fa-solid fa-magnifying-glass"></i></div>
                        <h3>Search and Filter</h3>
                        <p>Find sites quickly by name or filter them by condition to spot the ones that need urgent attention.</p>
                        <ul class="service-points">
                            <li><i class="fa-solid fa-check"></i> Search by site name</li>
                            <li><i class="fa-solid fa-check"></i> Filter by condition</li>
                            <li><i class="fa-solid fa-check"></i> Instant results</li>
                        </ul>
                    </div>

                    <div class="service-card">
                        <div class="service-icon"><i class="fa-solid fa-pen-to-square"></i></div>
                        <h3>Record Updates</h3>
                        <p>Update site information at any time. All additions, updates and deletions reflect instantly in the database.</p>
                        <ul class="service-points">
                            <li><i class="fa-solid fa-check"></i> Edit existing records</li>
                            <li><i class="fa-solid fa-check"></i> Live database updates</li>
                            <li><i class="fa-solid fa-check"></i> Delete outdated entries</li>
                        </ul>
                    </div>

                    <div class="service-card">
                        <div class="service-icon"><i class="fa-solid fa-lock"></i></div>
                        <h3>Secure Access</h3>
                        <p>Session-based login means only authorised users can manage sensitive heritage records.</p>
                        <ul class="service-points">
                            <li><i class="fa-solid fa-check"></i> Email and password login</li>
                            <li><i class="fa-solid fa-check"></i> Unique user accounts</li>
                            <li><i class="fa-solid fa-check"></i> Safe logoff</li>
                        </ul>
                    </div>

                    <div class="service-card">
                        <div class="service-icon"><i class="fa-solid fa-chart-line"></i></div>
                        <h3>Live Dashboard</h3>
                        <p>A personalised dashboard with a live count of registered sites and quick links to all functions.</p>
                        <ul class="service-points">
                            <li><i class="fa-solid fa-check"></i> Welcome message with your name</li>
                            <li><i class="fa-solid fa-check"></i> Total site count</li>
                            <li><i class="fa-solid fa-check"></i> One-click navigation</li>
                        </ul>
                    </div>

                    <div class="service-card">
                        <div class="service-icon"><i class="fa-solid fa-code"></i></div>
                        <h3>Web Service API</h3>
                        <p>An ASMX SOAP web service exposes site management operations for integration with other systems.</p>
                        <ul class="service-points">
                            <li><i class="fa-solid fa-check"></i> ViewSites method</li>
                            <li><i class="fa-solid fa-check"></i> AddSite and DeleteSite</li>
                            <li><i class="fa-solid fa-check"></i> FilterSitesByCondition</li>
                        </ul>
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