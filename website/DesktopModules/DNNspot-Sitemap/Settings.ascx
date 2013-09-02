<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Settings.ascx.cs" Inherits="DNNspot.Sitemap.Settings" %>
<table class="DNNspotSitemapSettings" style="width:100%">
    <asp:Panel ID="pnlSuperUsers" runat="server" Visible="false">
        <tr><td>Portal to Use:</td><td><asp:DropDownList ID="ddlPortalListing" runat="server" onselectedindexchanged="ddlPortalListing_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td></tr>
        <tr><td>Portal Alias to Use:</td><td><asp:DropDownList ID="ddlPortalAlias" runat="server"></asp:DropDownList></td></tr>
    </asp:Panel>
    <tr>
        <td style="width:150px">
            Include Hidden Pages?</td>
        <td >            
            <asp:CheckBox ID="chkIncludeHiddenPages" runat="server" />
          </td>
    </tr>      
    <tr>
    <td>Start Sitemap At:</td>
    <td><asp:DropDownList ID="ddlPages" runat="server"></asp:DropDownList></td>
    </tr>
    <tr>
    <td>Sitemap Level:
    </td>
    <td>
        <asp:DropDownList ID="ddlLevels" runat="server">
        </asp:DropDownList>
        <p>0 will show all levels, 1 will only show top level navigation.</p>
    </td></tr>
    <tr>
        <td>
            Exclude the following Tabs</td>
        <td>
            <asp:TextBox ID="txtTabIdExclude" runat="server" Width="200px"></asp:TextBox>
        </td>        
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            Comma seperate a list of tab id's if you would like to exclude them.
        </td>        
    </tr>    
</table>
    