<%@ Control Language="VB" Inherits="DNNInfo.Modules.ImageGallery.UC_ManageAlbums" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<div class="DNNInfo_Box">
    <div class="DNNInfo_BoxHeader"><asp:Literal ID="litAlbums" runat="server" /></div>
    <div class="DNNInfo_BoxInside">
        <asp:Label ID="lblMessage" runat="server"/>
        <table class="DNNInfo_Table">
            <tr>
                <td class="DNNInfo_Label"><dnn:label id="lblAlbumName" runat="server" controlname="txtAlbumName" suffix=":"/></td>
                <td><asp:TextBox ID="txtAlbumName" runat="server" Width="250" /><span class="DNNInfo_Required">*</span>
                    <asp:RequiredFieldValidator ID="reqAlbumName" runat="server" ControlToValidate="txtAlbumName" Display="Dynamic" SetFocusOnError="true" ValidationGroup="NewAlbum"/>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label id="lblAlbumDescription" runat="server" controlname="txtAlbumDescription" suffix=":"/></td>
                <td><asp:TextBox ID="txtAlbumDescription" runat="server" Width="250" TextMode="MultiLine" Rows="3" /></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label id="lblAlbumImage" runat="server" controlname="fUpload" suffix=":"/></td>
                <td><asp:FileUpload ID="fUpload" runat="server" /><span class="DNNInfo_Required">*</span>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label id="lblSortIndex" runat="server" controlname="txtSortIndex" suffix=":"/></td>
                <td><asp:TextBox ID="txtSortIndex" runat="server" Width="50" value="0"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label id="lblPublished" runat="server" controlname="chkPublished" suffix=":"/></td>
                <td><asp:CheckBox ID="chkPublished" runat="server" Checked="true" /></td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Button ID="btnAddAlbum" runat="server" ValidationGroup="NewAlbum"  CssClass="DNNInfo_Button" /></td>
            </tr>
        </table>
    </div>
</div>

<asp:Panel ID="pnlAlbums" runat="server">
    <h1><asp:Literal ID="litAlbumList" runat="server" /></h1>
    <p><asp:Button ID="btnDeleteSelectedAlbum" runat="server"  CssClass="DNNInfo_Button"/></p>
    <div class="DNNInfo_PagingWrapper"><asp:Literal ID="litPagingTop" runat="server"/></div>
    <div id="DNNInfo_AlbumPanel">
    <p><asp:Label ID="lblTotalAlbums" runat="server" /></p>
    <asp:GridView runat="server" ID="GridAlbum" AutoGenerateColumns ="false" Width="100%" DataKeyNames ="AlbumID" CssClass="DNNInfo_Table_Grid">
    <AlternatingRowStyle CssClass ="DNNInfo_GridRow_Alternate"  />
    <HeaderStyle CssClass="DNNInfo_HeaderGrid" />
    <Columns>
        <asp:TemplateField HeaderText="<input type='checkbox' id='checker' onclick='checkall(this,1)'/>">     
             <ItemTemplate><asp:CheckBox ID="chkAlbum" runat="server" />
                <asp:HiddenField ID="hiddenID" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "AlbumID")%>'/>
             </ItemTemplate>
        </asp:TemplateField> 
        <asp:TemplateField ShowHeader="False">
          <EditItemTemplate>
          <asp:LinkButton ID="linkUpdate" runat="server" CommandName="Update"  CssClass="GridUpdateButton"></asp:LinkButton>
          <asp:LinkButton ID="linkCancel" runat="server" CommandName="Cancel"  CssClass="GridCancelButton"></asp:LinkButton>
           </EditItemTemplate> 
            <ItemTemplate>
                <asp:LinkButton ID="linkEdit" runat="server" CommandName="Edit" CssClass="GridEditButton"></asp:LinkButton>
            </ItemTemplate> 
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                 <asp:LinkButton ID="linkDelete" runat="server" CommandName="Delete" CssClass="GridDeleteButton"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>         
             <ItemTemplate><asp:Label ID="lblGridAlbumImage" runat="server" /></ItemTemplate>
            <EditItemTemplate>
                <asp:FileUpload ID="fGridUpload" runat="server" />
                <asp:HiddenField ID="hiddenGridAlbumImage" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "AlbumImage")%>' />
                <asp:Label ID="lblGridImageMessage" runat="server" />
                <asp:Label ID="lblGridEditAlbumImage" runat="server" />
                </ItemTemplate>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>         
             <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "AlbumName")%></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtGridAlbumName" runat="server" MaxLength="100" Width="100%" Text='<%#DataBinder.Eval(Container.DataItem, "AlbumName")%>' />
                <asp:RequiredFieldValidator ID="reqGridAlbumName" runat="server" ControlToValidate="txtGridAlbumName" Display="Dynamic" SetFocusOnError="true" ValidationGroup="NewAlbum"/>
            </EditItemTemplate>
        </asp:TemplateField> 
        <asp:TemplateField HeaderText="Album Description">         
             <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "AlbumDescription")%></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtGridAlbumDescription" runat="server" MaxLength="100" Width="100%" Rows="5" TextMode="MultiLine" Text='<%#DataBinder.Eval(Container.DataItem, "AlbumDescription")%>' />
            </EditItemTemplate>
        </asp:TemplateField> 
        <asp:TemplateField>         
            <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "AlbumSortIndex")%></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtGridAlbumSortIndex" Width="30" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "AlbumSortIndex")%>'/>
            </EditItemTemplate>
        </asp:TemplateField> 
        <asp:TemplateField>         
            <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "AlbumPublished")%></ItemTemplate>
            <EditItemTemplate>
                <asp:CheckBox ID="chkGridPublished" runat="server"/>
            </EditItemTemplate>
        </asp:TemplateField> 
    </Columns>
    </asp:GridView>
    </div>
    <div class="DNNInfo_PagingWrapper"><asp:Literal ID="litPagingBottom" runat="server"/></div>
    <p><asp:Label ID="lblGridMessage" runat="server" CssClass="DNNInfo_Message"/></p>
</asp:Panel>