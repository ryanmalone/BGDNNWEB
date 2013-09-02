<%@ Control Language="C#" AutoEventWireup="True" Inherits="CodingStaff.Modules.MenuBox.Settings"
    CodeBehind="Settings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="cs" TagName="PageSelector" Src="PageSelector.ascx" %>
<tr>
    <td class="SubHead" width="150">
        <dnn:label id="lblSkins" runat="server" controlname="ddSkins" suffix=":">
        </dnn:label>
    </td>
    <td valign="bottom">
        <asp:DropDownList ID="ddSkins" Width="250" CssClass="NormalTextBox" DataValueField="SkinId" DataTextField="TemplateName" runat="server">
        </asp:DropDownList>
    </td>
</tr>
<tr>
    <td class="SubHead" width="150">
        <dnn:label id="lblSubNavigation" runat="server" controlname="cbSubNavigation" suffix=":">
        </dnn:label>
    </td>
    <td valign="bottom">
        <asp:CheckBox ID="cbSubNavigation" runat="server" AutoPostBack="true"/>
    </td>
</tr>
<tr>
    <td class="SubHead" width="150">
        <dnn:label id="lblDepth" runat="server" controlname="tbDepth" suffix=":">
        </dnn:label>
    </td>
    <td valign="bottom">
        <asp:TextBox ID="tbDepth" Width="250" CssClass="NormalTextBox" runat="server"></asp:TextBox>
    </td>
</tr>
<tr>
    <td class="SubHead" width="150">
        <dnn:label id="lblUnlimitedDepth" runat="server" controlname="cbUnlimitedDepth" suffix=":">
        </dnn:label>
    </td>
    <td valign="bottom">
        <asp:CheckBox ID="cbUnlimitedDepth" runat="server" AutoPostBack="true" />
    </td>
</tr>
<tr>
    <td class="SubHead" width="150">
        <dnn:label id="lblIncludeSelf" runat="server" controlname="cbIncludeSelf" suffix=":">
        </dnn:label>
    </td>
    <td valign="bottom">
        <asp:CheckBox ID="cbIncludeSelf" runat="server" />
    </td>
</tr>
<tr>
    <td class="SubHead" width="150">
        <dnn:label id="lblIncludeSiblings" runat="server" controlname="cbIncludeSiblings"
            suffix=":">
        </dnn:label>
    </td>
    <td valign="bottom">
        <asp:CheckBox ID="cbIncludeSiblings" runat="server" />
    </td>
</tr>
<tr>
    <td class="SubHead" width="150">
        <dnn:label id="lblRetriveFrom" runat="server" suffix=":">
        </dnn:label>
    </td>
    <td valign="bottom">
        <asp:RadioButton ID="rbCurrentPage" CssClass="NormalBold" resourcekey="rbCurrentPage" GroupName="SelectPage" runat="server" AutoPostBack="true" />
    </td>
</tr>
<tr>
    <td class="SubHead" width="150">
    </td>
    <td valign="bottom">
        <asp:RadioButton ID="rbSelectPage" CssClass="NormalBold"  resourcekey="rbSelectPage" GroupName="SelectPage" runat="server" AutoPostBack="true" />
        <cs:PageSelector ID="ucPageSelect" SelectorType="ListBox" Rows="10" CssClass="NormalTextBox" Width="350" runat="server"></cs:PageSelector>
    </td>
</tr>
