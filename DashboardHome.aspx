<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardHome.aspx.cs" Inherits="HeritageCare_Solution.DashboardHome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Overview</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/landing.css" />
    <link rel="stylesheet" href="css/overview.css" />
</head>
<body>
    <form id="form1" runat="server">

        <section class="overview-welcome">
            <div class="overview-welcome-inner">
                <span class="overview-greeting"><asp:Label ID="lblGreeting" runat="server" Text="Good morning" /></span>
                <h1>Welcome back, <asp:Label ID="lblName" runat="server" /></h1>
                <p>Here is a quick look at your heritage site records.</p>
            </div>
        </section>

        <section class="overview-cards">
            <div class="overview-card">
                <div class="overview-icon"><i class="fa-solid fa-landmark"></i></div>
                <div>
                    <h3><asp:Label ID="lblSiteCount" runat="server" Text="0" /></h3>
                    <p>Your Heritage Sites</p>
                </div>
            </div>

            <div class="overview-card">
                <div class="overview-icon"><i class="fa-solid fa-circle-check"></i></div>
                <div>
                    <h3><asp:Label ID="lblGoodCount" runat="server" Text="0" /></h3>
                    <p>In Good Condition</p>
                </div>
            </div>

            <div class="overview-card">
                <div class="overview-icon"><i class="fa-solid fa-triangle-exclamation"></i></div>
                <div>
                    <h3><asp:Label ID="lblPoorCount" runat="server" Text="0" /></h3>
                    <p>Needing Attention</p>
                </div>
            </div>

            <div class="overview-card">
                <div class="overview-icon"><i class="fa-solid fa-clock"></i></div>
                <div>
                    <h3><asp:Label ID="lblLatest" runat="server" Text="None" /></h3>
                    <p>Last Added Site</p>
                </div>
            </div>
        </section>

        <section class="overview-news">
            <div class="overview-news-head">
                <h2><i class="fa-solid fa-newspaper"></i> Latest News</h2>
                <div class="overview-news-controls">
                    <button type="button" class="overview-nav-btn" id="newsPrev" aria-label="Previous"><i class="fa-solid fa-chevron-left"></i></button>
                    <button type="button" class="overview-nav-btn" id="newsNext" aria-label="Next"><i class="fa-solid fa-chevron-right"></i></button>
                </div>
            </div>

            <div class="overview-slider" id="newsSlider">

                <div class="news-slide">
                    <div class="news-slide-image">
                        <img src="https://www.macadamiacare.com/wp-content/uploads/2022/12/300120_MC20_WhiteRiverCenter-38.jpg" alt="Archives and records" />
                    </div>
                    <div class="news-slide-text">
                        <h3>All records now online</h3>
                        <p>HeritageCare has moved all site records from paper files to a centralised database. No more misplaced information or duplicates.</p>
                    </div>
                </div>

                <div class="news-slide">
                    <div class="news-slide-image">
                        <img src="https://wisecampus.org.uk/wp-content/uploads/2025/01/Impact-of-the-Health-and-Social-Care-Act-2012.jpg" alt="Heritage site" />
                    </div>
                    <div class="news-slide-text">
                        <h3>Track site conditions in real time</h3>
                        <p>Filter sites by their condition to spot those that need urgent attention, and update records instantly.</p>
                    </div>
                </div>

                <div class="news-slide">
                    <div class="news-slide-image">
                        <img src="https://tse3.mm.bing.net/th/id/OIP.AWus2WwiLlfZDKw1JOBMvgHaHZ?r=0&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Secure access" />
                    </div>
                    <div class="news-slide-text">
                        <h3>Secure access for authorised users</h3>
                        <p>Session-based login ensures only authorised users can add, update or delete heritage site records.</p>
                    </div>
                </div>

            </div>

            <div class="overview-dots" id="newsDots"></div>
        </section>

    </form>

    <script src="js/overview.js"></script>
</body>
</html>