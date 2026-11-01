</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSite.aspx.cs" Inherits="HeritageCare_Solution.AddSite" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add Site</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/landing.css" />
    <link rel="stylesheet" href="css/addsite.css" />
</head>
<body>
    <form id="form2" runat="server">

        <section class="addsite-head">
            <h1>Add a Heritage Site</h1>
            <p>Register a new heritage site and link it to your account.</p>
        </section>

        <section class="addsite-body">
            <div class="addsite-card">

                <div class="addsite-group">
                    <label for="txtSiteName">Site Name <span>*</span></label>
                    <asp:TextBox ID="txtSiteName" runat="server" CssClass="addsite-input" placeholder="e.g. Castle of Good Hope" />
                </div>

                <div class="addsite-row">
                    <div class="addsite-group">
                        <label for="txtLocation">Location <span>*</span></label>
                        <asp:TextBox ID="txtLocation" runat="server" CssClass="addsite-input" placeholder="e.g. Cape Town" />
                    </div>

                    <div class="addsite-group">
                        <label for="ddlCondition">Condition <span>*</span></label>
                        <asp:DropDownList ID="ddlCondition" runat="server" CssClass="addsite-input">
                            <asp:ListItem Text="Select condition" Value="" />
                            <asp:ListItem Text="Good" Value="Good" />
                            <asp:ListItem Text="Fair" Value="Fair" />
                            <asp:ListItem Text="Poor" Value="Poor" />
                            <asp:ListItem Text="Restoration" Value="Restoration" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="addsite-group">
                    <label for="txtDescription">Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" CssClass="addsite-input" placeholder="Short description of the site" MaxLength="150" />
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="addsite-message" />

                <div class="addsite-actions">
                    <asp:Button ID="btnSave" runat="server" Text="Save Site" CssClass="btn btn-primary" OnClick="site_saving" />
                </div>

            </div>
        </section>

    </form>

    <script src="js/addsite.js"></script>
</body>
</html>