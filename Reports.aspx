<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="HeritageCare_Solution.Reports" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Reports</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/landing.css" />
    <link rel="stylesheet" href="css/reports.css" />
</head>
<body>
    <form id="form1" runat="server">

        <section class="reports-head">
            <h1>Reports</h1>
            <p>Filter heritage sites by their condition and see a quick summary.</p>
        </section>

        <section class="reports-cards">
            <div class="report-card">
                <div class="report-icon"><i class="fa-solid fa-circle-check"></i></div>
                <div>
                    <h3><asp:Label ID="lblGood" runat="server" Text="0" /></h3>
                    <p>Good</p>
                </div>
            </div>
            <div class="report-card">
                <div class="report-icon"><i class="fa-solid fa-circle-half-stroke"></i></div>
                <div>
                    <h3><asp:Label ID="lblFair" runat="server" Text="0" /></h3>
                    <p>Fair</p>
                </div>
            </div>
            <div class="report-card">
                <div class="report-icon"><i class="fa-solid fa-triangle-exclamation"></i></div>
                <div>
                    <h3><asp:Label ID="lblPoor" runat="server" Text="0" /></h3>
                    <p>Poor</p>
                </div>
            </div>
            <div class="report-card">
                <div class="report-icon"><i class="fa-solid fa-screwdriver-wrench"></i></div>
                <div>
                    <h3><asp:Label ID="lblRestoration" runat="server" Text="0" /></h3>
                    <p>Restoration</p>
                </div>
            </div>
        </section>

        <section class="reports-toolbar">
            <div class="reports-filter">
                <label for="ddlCondition">Filter by condition</label>
                <asp:DropDownList ID="ddlCondition" runat="server" CssClass="reports-select" AutoPostBack="true" OnSelectedIndexChanged="filter_changed">
                    <asp:ListItem Text="All" Value="" />
                    <asp:ListItem Text="Good" Value="Good" />
                    <asp:ListItem Text="Fair" Value="Fair" />
                    <asp:ListItem Text="Poor" Value="Poor" />
                    <asp:ListItem Text="Restoration" Value="Restoration" />
                </asp:DropDownList>
            </div>
            <div class="reports-total">
                <asp:Label ID="lblTotal" runat="server" Text="0" /> sites shown
            </div>
        </section>

        <section class="reports-table-wrap">

            <div id="tableInner" runat="server">
                <table class="reports-table">
                    <thead>
                        <tr>
                            <th>Site Name</th>
                            <th>Location</th>
                            <th>Condition</th>
                            <th>Added On</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptFiltered" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("SiteName") %></td>
                                    <td><%# Eval("Location") %></td>
                                    <td><%# Eval("Condition") %></td>
                                    <td><%# Eval("CreatedAt", "{0:yyyy-MM-dd}") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

            <div class="reports-empty" id="reportsEmpty" runat="server" visible="false">
                <i class="fa-solid fa-folder-open"></i>
                <p>No sites match this condition.</p>
            </div>

        </section>

    </form>
</body>
</html>