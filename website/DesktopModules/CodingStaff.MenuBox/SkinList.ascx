<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="SkinList.ascx.cs" Inherits="CodingStaff.Modules.MenuBox.SkinList" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<div class="cs-skinlist" id="SkinListContainer" runat="server">
    <asp:UpdatePanel runat="server" ID="listUpdatePanel" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <triggers>
            <asp:PostBackTrigger ControlID="cmdAdd"/>
        </triggers>
        <contenttemplate>
            <asp:PlaceHolder ID="phAddSkin" runat="server">
                <div class="new-skin-item">
                    <asp:FileUpload ID="cmdBrowse" name="cmdBrowse" runat="server"></asp:FileUpload>&nbsp;&nbsp;
                    <asp:LinkButton ID="cmdAdd" runat="server" resourcekey="cmdAdd" OnClick="cmdUploadNewSkin_Click"></asp:LinkButton>&nbsp;&nbsp;
                    <asp:LinkButton ID="lnkReturn" runat="server" OnCommand="btnSkinListMode_Click" CommandArgument="false" resourcekey="lnkReturn"></asp:LinkButton>

                    <asp:PlaceHolder ID="phLogs" Visible="false" runat="server">
                        <div class="cs-log-area">
                            <div class="cs-log-header">
                                <asp:Label ID="lblLogHeader" resourcekey="lblLogHeader" runat="server"></asp:Label>
                            </div>
                            <div class="cs-log-message">
                                <span ID="lblLog" runat="server"></span>
                            </div>
                        </div>
                    </asp:PlaceHolder>
                </div>        
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phConfirm" Visible="false" runat="server">
                        <div class="cs-confirm-area">
                            <div class="cs-confirm-message">
                                <asp:Label ID="lblConfirmMessage" resourcekey="lblConfirmMessage" runat="server"></asp:Label>
                            </div>
                            <div class="cs-confirm-actions">
                                <asp:Button ID="cmdReplace" runat="server" CssClass="cs-button" resourcekey="cmdReplace" OnClick="cmdReplace_Click" />&nbsp;&nbsp;
                                <asp:Button ID="cmdCancel" runat="server" CssClass="cs-button" resourcekey="cmdCancel" OnClick="cmdCancel_Click" />
                            </div>
                        </div>
                    </asp:PlaceHolder>
            <asp:PlaceHolder ID="phSelectSkin" runat="server">
                <div class="new-skin-item">
                    <div class="new-item-margin">
                            <asp:UpdateProgress AssociatedUpdatePanelID="listUpdatePanel" runat="server" ID="progress">
                                <ProgressTemplate>
                                    <div class="cs-updating">Loading...</div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>&nbsp;
                    </div>
                    <asp:LinkButton ID="GenerateView" runat="server" OnCommand="btnSkinListMode_Click" CommandArgument="true" resourcekey="GenerateView" CssClass="cs-button-add"></asp:LinkButton>
                </div>
                <div class="separator"></div>
                <asp:Repeater runat="server" ID="menuItems" OnItemDataBound="MenuItems_DataBinding" >
                    <ItemTemplate>
                        <div class="skin-item">
                            <div class="skin-item-picture">
                                <a href="<%# Eval("SkinImageVirtualPath") %>" target="_blank">
                                    <img class="image-style" src="<%# Eval("SkinImageVirtualPath") %>" title ="<%# Eval("SkinImageName") %>" alt="<%# Eval("SkinImageName") %>" />
                                </a>
                                <asp:Label ID="lblCurrent" CssClass="cs-current-label" runat="server" resourcekey="lblCurrent" ></asp:Label>
                                <asp:Label ID="lblError" CssClass="cs-error-label" runat="server" resourcekey="lblError" ></asp:Label>
                                <asp:Button runat="server" ID="cmdMakeCurrent" CausesValidation="false" CommandName="make_current" CommandArgument="<%# Container.ItemIndex %>"
                                       OnCommand="cmdMakeCurrent_Click" resourcekey="cmdMakeCurrent" CssClass="cs-button cs-button-make-current"></asp:Button>

                            </div>
                            <div class="skin-item-info">
                                <div class="DNN_File_Selector">
                                    <div class="file_selector_row">
                                        <div class="SubHead">
                                            <dnn:Label ID="lblTemplateName" runat="server" Suffix=":">
                                             </dnn:Label>
                                        </div>
                                        <div class="input-field">
                                            <span><%# Eval("TemplateName") %></span>
                                        </div>
                                    </div>
                                    <div class="file_selector_row">
                                        <div class="SubHead">
                                            <dnn:Label ID="lblDescription" runat="server" Suffix=":">
                                             </dnn:Label>
                                        </div>
                                        <div class="input-field">
                                            <span><%# Eval("Description")%></span>
                                        </div>
                                    </div>

                                </div>
                             </div>
                            <div class="cs-actions-area">
                                <asp:Label runat="server" ID="lblDefault" resourcekey="lblDefault" CssClass="cs-default-label"></asp:Label>
                                <asp:LinkButton runat="server" ID="cmdDelete" CausesValidation="false" CommandName="delete" CommandArgument="<%# Container.ItemIndex %>"
                                        OnCommand="cmdDelete_Click" resourcekey="cmdDelete" CssClass="cs-button-delete"></asp:LinkButton>
                             </div>
                        </div>
                        <div class="separator"></div>
                    </ItemTemplate>
                </asp:Repeater>
                <a href="<%= DotNetNuke.Common.Globals.NavigateURL() %>">Go Back</a>
            </asp:PlaceHolder>
        </contenttemplate>
    </asp:UpdatePanel>
</div>
