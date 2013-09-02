<%@ Control Language="VB" Inherits="DNNInfo.Modules.ImageGallery.UC_ManageImages" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<div class="DNNInfo_Box">
    <div class="DNNInfo_BoxHeader"><asp:Literal ID="litImages" runat="server" /></div>
    <div class="DNNInfo_BoxInside">
        <asp:Label ID="lblMessage" runat="server"/>
        <table class="DNNInfo_Table">
            <tr>
                <td class="DNNInfo_Label"><dnn:label id="lblAlbum" runat="server" controlname="ddAlbum" suffix=":"/></td>
                <td><asp:DropDownList ID="ddAlbum" runat="server" />
                     <asp:RequiredFieldValidator ID="reqAlbum" runat="server" ControlToValidate="ddAlbum" Display="Dynamic" ValidationGroup="NewImage"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label id="lblImageTitle" runat="server" controlname="txtImageTitle" suffix=":"/></td>
                <td><asp:TextBox ID="txtImageTitle" runat="server" Width="250" />
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label id="lblImageDescription" runat="server" controlname="txtImageDescription" suffix=":"/></td>
                <td><asp:TextBox ID="txtImageDescription" runat="server" Width="250"  TextMode="MultiLine" Rows="3" /></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label id="lblImageURL" runat="server" controlname="txtImageURL" suffix=":"/></td>
                <td><asp:TextBox ID="txtImageURL" runat="server" Width="300" />
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label id="lblImageURLExternal" runat="server" controlname="chkImageURLExternal" suffix=":"/></td>
                <td><asp:CheckBox ID="chkImageURLExternal" runat="server"/>
                    <p class="DNNInfo_Note"><asp:Literal ID="litNote" runat="server" /></p>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label id="lblImage" runat="server" controlname="fUpload" suffix=":"/></td>
                <td><asp:FileUpload ID="fUpload" runat="server" /><span class="DNNInfo_Required">*</span>
                    <div class="DNNInfo_Note"><asp:Literal ID="litZipNote" runat="server" /></div>
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
                <td><asp:Button ID="btnAddImage" runat="server" ValidationGroup="NewImage"  CssClass="DNNInfo_Button"/></td>
            </tr>
        </table>
        
        <h1><asp:Literal ID="litImageList" runat="server" /></h1>
        <p><asp:DropDownList ID="ddAlbumSelector" runat="server" AutoPostBack="true" /> <asp:Button ID="btnDeleteSelectedImage" runat="server"  CssClass="DNNInfo_Button"/> <asp:Button ID="btnUnpublishSelectedImage" runat="server"  CssClass="DNNInfo_Button"/> <asp:Button ID="btnPublishSelectedImage" runat="server"  CssClass="DNNInfo_Button"/></p>
        <div class="DNNInfo_PagingWrapper"><asp:Literal ID="litPagingTop" runat="server"/></div>
        <div id="DNNInfo_ImagePanel">
            <p><asp:Label ID="lblTotalImages" runat="server" /></p>
            <asp:GridView runat="server" ID="GridImage" AutoGenerateColumns ="false" Width="100%" DataKeyNames ="ImageID" CssClass="DNNInfo_Table_Grid">
            <AlternatingRowStyle CssClass ="DNNInfo_GridRow_Alternate"  />
            <HeaderStyle CssClass="DNNInfo_HeaderGrid" />
            <Columns>
                <asp:TemplateField HeaderText="<input type='checkbox' id='checker' onclick='checkall(this,2)'/>">     
                     <ItemTemplate><asp:CheckBox ID="chkImage" runat="server" />
                        <asp:HiddenField ID="hiddenID" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "ImageID")%>'/>
                     </ItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField ShowHeader="False">
                  <EditItemTemplate>
                  <asp:LinkButton ID="linkUpdate" runat="server" CommandName="Update" CssClass="GridUpdateButton"></asp:LinkButton>
                  <asp:LinkButton ID="linkCancel" runat="server" CommandName="Cancel" CssClass="GridCancelButton"></asp:LinkButton>
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
                     <ItemTemplate><asp:Label ID="lblGridImage" runat="server" /></ItemTemplate>
                    <EditItemTemplate>
                        <asp:FileUpload ID="fGridUpload" runat="server" />
                        <ItemTemplate><div><asp:Label ID="lblGridEditImage" runat="server" /></div>
                        <asp:HiddenField ID="hiddenGridImage" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "ImageName")%>' />
                        <div><asp:Label ID="lblGridImageMessage" runat="server" /></div>
                        </ItemTemplate>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>         
                     <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "ImageTitle")%></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridImageTitle" runat="server" Width="100%" Text='<%#DataBinder.Eval(Container.DataItem, "ImageTitle")%>' />
                    </EditItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField >         
                     <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "AlbumName")%></ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList id="ddGridAlbum" runat="server" />
                    </EditItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField>         
                     <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "ImageDescription")%></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridImageDescription" runat="server" Width="250" Rows="5" TextMode="MultiLine" Text='<%#DataBinder.Eval(Container.DataItem, "ImageDescription")%>' />
                    </EditItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField>         
                     <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "ImageURL")%></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridImageImageURL" runat="server" Width="300" Text='<%#DataBinder.Eval(Container.DataItem, "ImageURL")%>' />
                    </EditItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField>         
                    <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "ImageURLExternal")%></ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkGridImageURLExternal" runat="server"/>
                    </EditItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField>         
                    <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "ImageSortIndex")%></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridImageSortIndex" Width="30" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ImageSortIndex")%>'/>
                    </EditItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField>         
                    <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "ImagePublished")%></ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkGridPublished" runat="server"/>
                    </EditItemTemplate>
                </asp:TemplateField> 
            </Columns>
            </asp:GridView>
        </div>
        <div class="DNNInfo_PagingWrapper"><asp:Literal ID="litPagingBottom" runat="server"/></div>
        <p><asp:Label ID="lblGridMessage" runat="server" CssClass="DNNInfo_Message"/></p>
    </div>
</div>