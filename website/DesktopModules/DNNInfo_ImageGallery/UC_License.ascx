<%@ Control Language="VB" Inherits="DNNInfo.Modules.ImageGallery.UC_License" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<div class="DNNInfo_Box">
    <div class="DNNInfo_BoxHeader"><asp:Literal ID="litLicense" runat="server" /></div>
    <div class="DNNInfo_BoxInside">
        <div id="DNNInfo_License">
            <div><asp:Label ID="lblMessage" runat="server" /></div>
            <table class="DNNInfo_Table">
                <tr>
                    <td class="DNNInfo_Label"><asp:Label ID="lblVersion" runat="server" />:</td>
                    <td><asp:Literal ID="litVersion" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><asp:Label ID="lblLicenseStatus" runat="server" />:</td>
                    <td><asp:Literal ID="litLicenseStatus" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><asp:Label ID="lblLicenseTo" runat="server" />:</td>
                    <td><asp:Literal ID="litLicenseTo" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><asp:Label ID="lblLicenseKey" runat="server" />:</td>
                    <td><asp:Literal ID="litLicenseKey" runat="server" /></td>
                </tr>
            </table>
        </div>
        <asp:Panel ID="pnlUpload" runat="server">
            <p><asp:Label ID="lblNote" runat="server" /></p>
            <asp:FileUpload ID="fUpload" runat="server" /> <asp:Button ID="btnUpload" runat="server" CssClass="DNNInfo_Button" />
        </asp:Panel>
        <asp:Panel ID="pnlLicense" runat="server" Visible="false">
            <p><asp:Label ID="lblLicenseNote" runat="server" /></p>
            <asp:Button ID="btnGetLicense" runat="server" CssClass="DNNInfo_ButtonExport" />
        </asp:Panel>
    </div>
</div>
