<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="HeritageCare_Solution.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/landing.css" />
    <link rel="stylesheet" href="css/dashboard.css" />  
    
    <style>
    .dash-main {
    position: absolute;
    left: 240px;
    right: 0;
    bottom: 0;
    background: var(--white);
    padding: 0;
    margin: 0;
    height:95vh;
    overflow: hidden;
}
    </style>
</head>
  
<body>
    <form id="form1" runat="server">

        <header class="dash-topbar">
            <div class="dash-topbar-left">
                <a href="index.aspx" class="logo" aria-label="HeritageCare home">
                    <img src="Images/logo.png" alt="HeritageCare" />
                </a>
                <button type="button" class="dash-toggle" id="dashToggle" aria-label="Menu">
                    <i class="fa-solid fa-bars"></i>
                </button>
            </div>
            <div class="dash-topbar-right">
                <span class="dash-username">
                    <asp:Label ID="lblUserName" runat="server" Text="" />
                </span>
                <span class="dash-usericon">
                    <i class="fa-solid fa-user"></i>
                </span>
            </div>
        </header>

        <div class="dash-layout">

            <aside class="dash-sidebar" id="dashSidebar">
                <ul>
                    <li><a href="Dashboard.aspx" class="dash-nav active"><i class="fa-solid fa-house"></i> Dashboard</a></li>
                    <li><a href="Dashboard.aspx?page=Sites" class="dash-nav"><i class="fa-solid fa-landmark"></i> Heritage Sites</a></li>
                    <li><a href="Dashboard.aspx?page=AddSite" class="dash-nav"><i class="fa-solid fa-plus"></i> Add Site</a></li>
                    <li><a href="Dashboard.aspx?page=Profile" class="dash-nav"><i class="fa-solid fa-user-pen"></i> My Profile</a></li>
                    <li><a href="Dashboard.aspx?page=Reports" class="dash-nav"><i class="fa-solid fa-chart-line"></i> Reports</a></li>
<li><a href="Logoff.aspx" class="dash-nav dash-logout" id="logoutLink"><i class="fa-solid fa-right-from-bracket"></i> Log Off</a></li>                </ul>
            </aside>

            <main class="dash-main">
                <iframe id="dashFrame" class="dash-frame" src="DashboardHome.aspx" title="Dashboard content"></iframe>
            </main>

        </div>


<div class="confirm-overlay" id="logoutModal">
    <div class="confirm-box">
        <h3>Log off now?</h3>
        <p>You will need to sign in again to access your dashboard.</p>
        <div class="confirm-actions">
            <button type="button" class="btn btn-outline" id="logoutCancel">Cancel</button>
            <button type="button" class="btn btn-primary" id="logoutConfirm">Log Off</button>
        </div>
    </div>
</div>
    </form>

    <script src="js/dashboard.js"></script>
</body>
</html>