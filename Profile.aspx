<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="HeritageCare_Solution.Profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/landing.css" />
    <link rel="stylesheet" href="css/profile.css" />
</head>
<body>
    <form id="form1" runat="server">

        <section class="profile-head">
            <h1>My Profile</h1>
            <p>View and update your account information.</p>
        </section>

        <section class="profile-body">

            <div class="profile-card">

                <div class="card-actions">
               

                    <button type="button" class="card-icon-btn" data-target="infoPopup" title="Edit personal info">
                        <i class="fa-solid fa-user-pen"></i>
                    </button>
                    <button type="button" class="card-icon-btn" data-target="passwordPopup" title="Change password">
                        <i class="fa-solid fa-key"></i>
                    </button>
                </div>

                <table class="profile-table">
                    <tr>
                        <td class="profile-table-label"><i class="fa-solid fa-user"></i> Full Name</td>
                        <td class="profile-table-value">: <asp:Label ID="lblFullName" runat="server" /></td>
                    </tr>
                    <tr>
                        <td class="profile-table-label"><i class="fa-solid fa-envelope"></i> Email Address</td>
                        <td class="profile-table-value">: <asp:Label ID="lblEmail" runat="server" /></td>
                    </tr>
                    <tr>
                        <td class="profile-table-label"><i class="fa-solid fa-phone"></i> Contact Number</td>
                        <td class="profile-table-value">: <asp:Label ID="lblContact" runat="server" /></td>
                    </tr>
                    <tr>
                        <td class="profile-table-label"><i class="fa-solid fa-calendar"></i> Member Since</td>
                        <td class="profile-table-value">: <asp:Label ID="lblJoined" runat="server" /></td>
                    </tr>
                </table>

            </div>

        </section>

        <div class="popup-overlay" id="infoPopup">
            <div class="popup-box">
                <asp:HiddenField ID="hfInfoOpen" runat="server" />
                <div class="popup-head">
                    <h3>Update Personal Info</h3>
                    <button type="button" class="popup-close" data-close><i class="fa-solid fa-xmark"></i></button>
                </div>
                <div class="popup-body">
                    <label>Full Name</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="profile-input" />

                    <label>Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="profile-input" Enabled="false" />
                    <span class="profile-hint">Email cannot be changed.</span>

                    <label>Contact Number</label>
                    <asp:TextBox ID="txtContact" runat="server" CssClass="profile-input" />
                    
                    <asp:Label ID="lblInfoMessage" runat="server" CssClass="profile-message" />
                </div>
                <div class="popup-actions">
                         
  
                    <button type="button" class="btn btn-outline" data-close>Cancel</button>
                    <asp:Button ID="btnSaveInfo" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="info_saving" />
                </div>
            </div>
        </div>

        <div class="popup-overlay" id="passwordPopup">
            <div class="popup-box">
                <asp:HiddenField ID="hfPasswordOpen" runat="server" />
                <div class="popup-head">
                    <h3>Change Password</h3>
                    <button type="button" class="popup-close" data-close><i class="fa-solid fa-xmark"></i></button>
                </div>
                <div class="popup-body">
                    
                    <label>Current Password</label>
                    <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password" CssClass="profile-input" />

                    <label>New Password</label>
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="profile-input" />
                </div>
                
                <div class="popup-head">
<asp:Label ID="lblPasswordMessage" runat="server" CssClass="profile-message" />
                </div>

                <div class="popup-actions">
                  

                    <button type="button" class="btn btn-outline" data-close>Cancel</button>
                    <asp:Button ID="btnChangePassword" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="password_changing" />
                </div>
            </div>
        </div>

    </form>

    <script src="js/profile.js"></script>
</body>
</html>