<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="~/HtmlTemplate/WrapperTemplate.ascx.cs" Inherits="CodingStaff.Modules.MenuBox.WrapperTemplate" %>
<%@ Register TagPrefix="uc" TagName="NodeItem" Src="NodeTemplate.ascx" %>
<div class="moduletable mj-simplemenu mj-strip">
					<h3>Menu</h3>
    <ul class="menu">
        <asp:repeater runat="server" id="Menu">
            <ItemTemplate>
                <uc:NodeItem runat="server" Node="<%# Container.DataItem %>">
                </uc:NodeItem>
            </ItemTemplate>
        </asp:repeater>
    </ul>
</div>
