<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sites.aspx.cs" Inherits="HeritageCare_Solution.Sites" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sites</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/landing.css" />

    <link rel="stylesheet" href="css/sites.css" />   
  

    <style>
        .sites-head h1 {
    color:white;
}

.sites-head p {
    font-size: .95rem;
    color:white;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <section class="sites-head">
            <h1 style="color:white">Heritage Sites</h1>
            <p style="color:white">View, search, filter and manage your registered heritage sites.</p>
        </section>

        <section class="sites-toolbar">
            <div class="sites-search">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="text" id="searchInput" placeholder="Search by name, location or description..." />
            </div>

            <div class="sites-filter">
                <label for="filterCondition"><i class="fa-solid fa-filter"></i> Condition</label>
                <select id="filterCondition">
                    <option value="">All</option>
                    <option value="Good">Good</option>
                    <option value="Fair">Fair</option>
                    <option value="Poor">Poor</option>
                    <option value="Restoration">Restoration</option>
                </select>
            </div>

            <a href="AddSite.aspx" class="btn btn-primary"><i class="fa-solid fa-plus"></i> Add Site</a>
        </section>

        <section class="sites-table-wrap">
            <table class="sites-table" id="sitesTable">
                <thead>
                    <tr>
                        <th>Site Name</th>
                        <th>Location</th>
                        <th>Condition</th>
                        <th>Description</th>
                        <th>Added On</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="sitesBody">

                    <asp:Repeater ID="rptSites" runat="server" OnItemCommand="rptSites_ItemCommand">
    <ItemTemplate>
        <tr class="site-row"
            data-siteid='<%# Eval("SiteId") %>'
            data-sitename='<%# Eval("SiteName") %>'
            data-location='<%# Eval("Location") %>'
            data-condition='<%# Eval("Condition") %>'
            data-description='<%# Eval("Description") %>'
            data-created='<%# Eval("CreatedAt", "{0:yyyy-MM-dd}") %>'>

            <td class="view-mode"><%# Eval("SiteName") %></td>
            <td class="view-mode"><%# Eval("Location") %></td>
            <td class="view-mode">
                <span class="condition-badge condition-<%# Eval("Condition") %>"><%# Eval("Condition") %></span>
            </td>
            <td class="view-mode desc-cell"><%# Eval("Description") %></td>
            <td class="view-mode"><%# Eval("CreatedAt", "{0:yyyy-MM-dd}") %></td>

            <td class="edit-mode" style="display:none;">
                <asp:TextBox ID="txtEditName" runat="server" CssClass="inline-input" Text='<%# Eval("SiteName") %>' />
            </td>
            <td class="edit-mode" style="display:none;">
                <asp:TextBox ID="txtEditLocation" runat="server" CssClass="inline-input" Text='<%# Eval("Location") %>' />
            </td>
            <td class="edit-mode" style="display:none;">
                <asp:DropDownList ID="ddlEditCondition" runat="server" CssClass="inline-input" SelectedValue='<%# Eval("Condition") %>'>
                    <asp:ListItem Text="Good" Value="Good" />
                    <asp:ListItem Text="Fair" Value="Fair" />
                    <asp:ListItem Text="Poor" Value="Poor" />
                    <asp:ListItem Text="Restoration" Value="Restoration" />
                </asp:DropDownList>
            </td>
            <td class="edit-mode" style="display:none;">
                <asp:TextBox ID="txtEditDescription" runat="server" CssClass="inline-input" Text='<%# Eval("Description") %>' />
            </td>
            <td class="edit-mode" style="display:none;">
                <asp:Button runat="server" CssClass="table-action save" CommandName="UpdateSite" CommandArgument='<%# Eval("SiteId") %>' Text="✓" />
            </td>

            <td class="actions-cell">
                <button type="button" class="table-action view" title="View details"><i class="fa-solid fa-eye"></i></button>
                <button type="button" class="table-action edit" title="Edit"><i class="fa-solid fa-pen"></i></button>
                <button type="button" class="table-action delete" title="Delete" data-siteid='<%# Eval("SiteId") %>' data-sitename='<%# Eval("SiteName") %>'><i class="fa-solid fa-trash"></i></button>
            </td>
        </tr>
    </ItemTemplate>
</asp:Repeater>







                </tbody>
            </table>

            <div class="sites-empty" id="sitesEmpty" style="display:none;">
                <i class="fa-solid fa-folder-open"></i>
                <p>No sites found.</p>
            </div>
        </section>

        <section class="sites-pagination" id="sitesPagination">
            <div class="sites-pagination-info" id="paginationInfo"></div>
            <div class="sites-pagination-controls" id="paginationControls"></div>
        </section>



        <div class="popup-overlay" id="viewPopup">
    <div class="popup-box">
        <div class="popup-head">
            <h3 id="viewPopupTitle">Site Name</h3>
            <button type="button" class="popup-close" id="viewPopupClose"><i class="fa-solid fa-xmark"></i></button>
        </div>
        <div class="popup-body">
            <div class="popup-row"><span>Location</span><strong id="viewPopupLocation"></strong></div>
            <div class="popup-row"><span>Condition</span><strong id="viewPopupCondition"></strong></div>
            <div class="popup-row"><span>Added On</span><strong id="viewPopupCreated"></strong></div>
            <div class="popup-row full"><span>Description</span><p id="viewPopupDescription"></p></div>
        </div>
    </div>
</div>

<div class="popup-overlay" id="deletePopup">
    <div class="popup-box">
        <div class="popup-head">
            <h3>Delete site?</h3>
            <button type="button" class="popup-close" id="deletePopupClose"><i class="fa-solid fa-xmark"></i></button>
        </div>
        <div class="popup-body">
            <p>Are you sure you want to delete <strong id="deletePopupName"></strong>? This cannot be undone.</p>
        </div>
        <div class="popup-actions">
            <button type="button" class="btn btn-outline" id="deletePopupCancel">Cancel</button>
            <asp:Button ID="btnConfirmDelete" runat="server" CssClass="btn btn-primary" Text="Delete" OnClick="confirm_delete_site" />
            <asp:HiddenField ID="hiddenDeleteId" runat="server" />
        </div>
    </div>
</div>



    </form>

    <script src="js/sites.js"></script>
</body>
</html>