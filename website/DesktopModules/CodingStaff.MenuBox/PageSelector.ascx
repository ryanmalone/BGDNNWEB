<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="PageSelector.ascx.cs"
    Inherits="CodingStaff.Modules.MenuBox.PageSelector" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<asp:Label ID="lblDisplayedTab" runat="server" resourcekey="lblDisplayedTab"></asp:Label>
<asp:DropDownList ID="ddlDisplayedTab" runat="server" DataTextField="TabPath"
    DataValueField="TabId" />
<asp:ListBox ID="lbDisplayedTab" SelectionMode="Single" runat="server" DataTextField="TabPath"
    DataValueField="TabId" ></asp:ListBox>
