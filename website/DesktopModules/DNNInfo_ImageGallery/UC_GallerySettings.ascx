<%@ Control Language="VB" Inherits="DNNInfo.Modules.ImageGallery.UC_GallerySettings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="Portal" TagName="URL" Src="~/controls/URLControl.ascx" %>

<div class="DNNInfo_Box">
    <div class="DNNInfo_BoxHeader"><asp:Literal ID="litGallerySettings" runat="server" /></div>
    <div class="DNNInfo_BoxInside">
        <asp:Label ID="lblMessage" runat="server" />
        <table class="DNNInfo_Table" width="100%">
            <tr>
                <td class="DNNInfo_Label"><dnn:label ID="lblAlbumThumbSize" runat="server" /></td>
                <td><asp:TextBox ID="txtAlbumThumbSize" runat="server" Width="50" />
                    <div><asp:RequiredFieldValidator ID="reqAlbumThumbSize" runat="server" ControlToValidate="txtAlbumThumbSize" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="regexAlbumThumbSize" runat="server" ControlToValidate="txtAlbumThumbSize" Display="Dynamic" ValidationExpression="^[0-9]+$" />
                    </div>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label ID="lblAlbumLargeSize" runat="server" /></td>
                <td><asp:TextBox ID="txtAlbumLargeSize" runat="server" Width="50" />
                    <div><asp:RequiredFieldValidator ID="reqAlbumLargeSize" runat="server" ControlToValidate="txtAlbumLargeSize" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="regexAlbumLargeSize" runat="server" ControlToValidate="txtAlbumLargeSize" Display="Dynamic" ValidationExpression="^[0-9]+$" />
                    </div>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label ID="lblImageThumbSize" runat="server" /></td>
                <td><asp:TextBox ID="txtImageThumbSize" runat="server" Width="50" />
                    <div><asp:RequiredFieldValidator ID="reqImageThumbSize" runat="server" ControlToValidate="txtImageThumbSize" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="regexImageThumbSize" runat="server" ControlToValidate="txtImageThumbSize" Display="Dynamic" ValidationExpression="^[0-9]+$" />
                    </div>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label ID="lblImageLargeSize" runat="server" /></td>
                <td><asp:TextBox ID="txtImageLargeSize" runat="server" Width="50" />
                    <div><asp:RequiredFieldValidator ID="reqImageLargeSize" runat="server" ControlToValidate="txtImageLargeSize" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="regexImageLargeSize" runat="server" ControlToValidate="txtImageLargeSize" Display="Dynamic" ValidationExpression="^[0-9]+$" />
                    </div>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label ID="lblNoOfAlbumsPerPage" runat="server" value="10" /></td>
                <td><asp:TextBox ID="txtNoOfAlbumsPerPage" runat="server" Width="35" MaxLength="2" />
                    <div><asp:RequiredFieldValidator ID="reqNoOfAlbumPerPage" runat="server" ControlToValidate="txtNoOfAlbumsPerPage" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="regexNoOfAlbumsPerPage" runat="server" ControlToValidate="txtNoOfAlbumsPerPage" Display="Dynamic" ValidationExpression="^[0-9]+$" />
                    </div>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label ID="lblNoOfImagesPerPage" runat="server" /></td>
                <td><asp:TextBox ID="txtNoOfImagesPerPage" runat="server" Width="35" MaxLength="2" value="20" />
                    <div><asp:RequiredFieldValidator ID="reqNoOfImagesPerPage" runat="server" ControlToValidate="txtNoOfImagesPerPage" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="regexNoOfImagesPerPage" runat="server" ControlToValidate="txtNoOfImagesPerPage" Display="Dynamic" ValidationExpression="^[0-9]+$" />
                    </div>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label ID="lblNoOfPagingAlbums" runat="server" value="10" /></td>
                <td><asp:TextBox ID="txtNoOfPagingAlbums" runat="server" Width="35" MaxLength="2" />
                    <div><asp:RequiredFieldValidator ID="reqNoOfPagingAlbums" runat="server" ControlToValidate="txtNoOfPagingAlbums" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="regexNoOfPagingAlbums" runat="server" ControlToValidate="txtNoOfPagingAlbums" Display="Dynamic" ValidationExpression="^[0-9]+$" />
                    </div>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label ID="lblNoOfPagingImages" runat="server" value="10" /></td>
                <td><asp:TextBox ID="txtNoOfPagingImages" runat="server" Width="35" MaxLength="2" />
                    <div><asp:RequiredFieldValidator ID="reqNoOfPagingImages" runat="server" ControlToValidate="txtNoOfPagingImages" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="regexNoOfPagingImages" runat="server" ControlToValidate="txtNoOfPagingImages" Display="Dynamic" ValidationExpression="^[0-9]+$" />
                    </div>
                </td>
            </tr>

            <tr>
                <td class="DNNInfo_Label"><dnn:label ID="lblAlbumSortField" runat="server" /></td>
                <td><asp:DropDownList ID="ddAlbumSortField" runat="server"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label ID="lblAlbumSortOrder" runat="server" /></td>
                <td><asp:DropDownList ID="ddAlbumSortOrder" runat="server" /></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label ID="lblImageSortField" runat="server" /></td>
                <td><asp:DropDownList ID="ddImageSortField" runat="server" /></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label ID="lblImageSortOrder" runat="server" /></td>
                <td><asp:DropDownList ID="ddImageSortOrder" runat="server" /></td>
            </tr>
            <tr>
		        <td class="DNNInfo_Label"><dnn:label id="lblDateFormat" runat="server" /></td>
		        <td valign="top">
		            <asp:DropDownList ID="ddDateFormat" runat="server">
		                <asp:ListItem Value="dd MMM yyyy" Text="dd MMM yyyy" />
		                <asp:ListItem Value="dd MMMM yy" Text="dd MMMM yy" />
		                <asp:ListItem Value="dd/MM/yyyy" Text="dd/MM/yyyy" />
		                <asp:ListItem Value="dd/MM/yy" Text="dd/MM/yy" />
		                <asp:ListItem Value="MM/dd/yyyy" Text="MM/dd/yyyy" />
		                <asp:ListItem Value="MM/dd/yy" Text="MM/dd/yy" />
		                <asp:ListItem Value="dd-MM-yyyy" Text="dd-MM-yyyy" />
		                <asp:ListItem Value="dd-MM-yy" Text="dd-MM-yy" />
		                <asp:ListItem Value="MM-dd-yyyy" Text="MM-dd-yyyy" />
		                <asp:ListItem Value="MM-dd-yy" Text="MM-dd-yy" />
		                <asp:ListItem Value="dd MMM yyyy hh:mm:ss tt" Text="dd MMM yyyy hh:mm:ss tt" />
		                <asp:ListItem Value="dd MMMM yyyy hh:mm:ss tt" Text="dd MMMM yyyy hh:mm:ss tt" />
		                <asp:ListItem Value="dd MMM yy hh:mm:ss tt" Text="dd MMM yy hh:mm:ss tt" />
		                <asp:ListItem Value="dd MMMM yy hh:mm:ss tt" Text="dd MMMM yy hh:mm:ss tt" />
		                <asp:ListItem Value="MMM dd yyyy hh:mm:ss tt" Text="MMM dd yyyy hh:mm:ss tt" />
		                <asp:ListItem Value="MMMM dd yyyy hh:mm:ss tt" Text="MMMM dd yyyy hh:mm:ss tt" />
		                <asp:ListItem Value="MMM dd yy hh:mm:ss tt" Text="MMM dd yy hh:mm:ss tt" />
		                <asp:ListItem Value="MMMM dd yy hh:mm:ss tt" Text="MMMM dd yy hh:mm:ss tt" />
		                <asp:ListItem Value="dd-MMM-yy hh:mm:ss tt" Text="dd-MMM-yy hh:mm:ss tt" />
		                <asp:ListItem Value="dd-MMM-yyyy hh:mm:ss tt" Text="dd-MMM-yyyy hh:mm:ss tt" />
		                <asp:ListItem Value="MMM-dd-yy hh:mm:ss tt" Text="MMM-dd-yy hh:mm:ss tt" />
		                <asp:ListItem Value="MMM-dd-yyyy hh:mm:ss tt" Text="MMM-dd-yyyy hh:mm:ss tt" />
		                <asp:ListItem Value="dd/MM/yyyy hh:mm:ss tt" Text="dd/MM/yyyy hh:mm:ss tt" />
		                <asp:ListItem Value="MM/dd/yyyy hh:mm:ss tt" Text="MM/dd/yyyy hh:mm:ss tt" />
		                <asp:ListItem Value="MM-dd-yyyy hh:mm:ss tt" Text="MM-dd-yyyy hh:mm:ss tt" />
		            </asp:DropDownList>
		        </td>
	        </tr>
	        <tr>
                <td class="DNNInfo_Label"><dnn:label ID="lblGalleryType" runat="server" /></td>
                <td><asp:DropDownList ID="ddGalleryType" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label ID="lblHomeText" runat="server" /></td>
                <td><asp:TextBox ID="txtHomeText" runat="server"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label ID="lblAutoLoadImages" runat="server" /></td>
                <td><asp:CheckBox ID="chkAutoLoadImages" runat="server"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:label ID="lblIncludeCustomStyles" runat="server" /></td>
                <td><asp:TextBox ID="txtIncludeCustomStyles" runat="server" Width="400" TextMode="MultiLine" Height="150"/>
                    <br />
                    <div class="DNNInfo_Note"><dnn:label ID="lblIncludeCustomStylesNote" runat="server" /></div>
              </td>
            </tr>
            <tr>
                <td colspan="2"> 
                    <dnn:SectionHead ID="sectionPrettyPhoto" runat="server" IncludeRule="True" Section="tblprettyphoto" CssClass="SubHead" IsExpanded="false" ResourceKey="PrettyPhotoSettings"></dnn:SectionHead>
                    <table id="tblprettyphoto" runat="server" width="100%">
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblPrettyPhotoTheme" runat="server" /></td>
                            <td><asp:DropDownList ID="ddPrettyPhotoTheme" runat="server"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblPrettyPhotoWrapperTemplate" runat="server" /></td>
                            <td><asp:TextBox ID="txtPrettyPhotoWrapperTemplate" runat="server" Width="100%" Height="200" TextMode="MultiLine" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblPrettyPhotoWrapperAlbumTemplate" runat="server" /></td>
                            <td><asp:TextBox ID="txtPrettyPhotoAlbumTemplate" runat="server" Width="100%" Height="200" TextMode="MultiLine" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblPrettyPhotoPagingTemplate" runat="server" /></td>
                            <td><asp:TextBox ID="txtPrettyPhotoPagingTemplate" runat="server" Width="100%" Height="200" TextMode="MultiLine" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblPrettyPhotoAnimationSpeed" runat="server" /></td>
                            <td><asp:Dropdownlist ID="ddPrettyPhotoAnimationSpeed" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblPrettyPhotoSlideShowSpeed" runat="server" /></td>
                            <td><asp:Dropdownlist ID="ddPrettyPhotoSlideShowSpeed" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblPrettyPhotoSmallGallery" runat="server" /></td>
                            <td><asp:CheckBox ID="chkPrettyPhotoSmallGallery" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblPrettyPhotoShowAllImages" runat="server" /></td>
                            <td><asp:CheckBox ID="chkPrettyPhotoShowAllImages" runat="server"/></td>
                        </tr>
                    </table>  
                    <dnn:SectionHead ID="sectionDNNInfoGallery" runat="server" IncludeRule="True" Section="tbldnninfogallery" CssClass="SubHead" IsExpanded="false" ResourceKey="DNNInfoGallerySettings"></dnn:SectionHead>
                    <table id="tbldnninfogallery" runat="server" width="100%">
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDNNInfoGalleryTemplate" runat="server" /></td>
                            <td><asp:TextBox ID="txtDNNInfoGalleryTemplate" runat="server" Width="100%" Height="200" TextMode="MultiLine" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDNNInfoAlbumPagingTemplate" runat="server" /></td>
                            <td><asp:TextBox ID="txtDNNInfoAlbumPagingTemplate" runat="server" Width="100%" Height="200" TextMode="MultiLine" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDNNInfoImagePagingTemplate" runat="server" /></td>
                            <td><asp:TextBox ID="txtDNNInfoImagePagingTemplate" runat="server" Width="100%" Height="200" TextMode="MultiLine" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDNNInfoGalleryImageTemplate" runat="server" /></td>
                            <td><asp:TextBox ID="txtDNNInfoGalleryImageTemplate" runat="server" Width="100%" Height="200" TextMode="MultiLine" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDNNInfoImagePanelWidth" runat="server" /></td>
                            <td><asp:TextBox ID="txtImagePanelWidth" runat="server" width="50" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDNNInfoImagePanelHeight" runat="server" /></td>
                            <td><asp:TextBox ID="txtImagePanelHeight" runat="server" width="50" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDNNInfoApplyWidthAndHeightToImagePanel" runat="server" /></td>
                            <td><asp:CheckBox ID="chkDNNInfoApplyWidthAndHeightToImagePanel" runat="server" width="50" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDNNInfoShowAllImages" runat="server" /></td>
                            <td><asp:CheckBox ID="chkDNNInfoShowAllImages" runat="server"/></td>
                        </tr>
                    </table>   
                    <dnn:SectionHead ID="sectionAdGallery" runat="server" IncludeRule="True" Section="tbladgallery" CssClass="SubHead" IsExpanded="false" ResourceKey="AdGallerySettings"></dnn:SectionHead>
                    <table id="tbladgallery" runat="server" width="100%">
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblAdGalleryWrapperTemplate" runat="server" /></td>
                            <td><asp:TextBox ID="txtAdGalleryWrapperTemplate" runat="server" Width="100%" Height="200" TextMode="MultiLine" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblAdGalleryAlbumTemplate" runat="server" /></td>
                            <td><asp:TextBox ID="txtAdGalleryAlbumTemplate" runat="server" Width="100%" Height="200" TextMode="MultiLine" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblAdGalleryPagingTemplate" runat="server" /></td>
                            <td><asp:TextBox ID="txtAdGalleryPagingTemplate" runat="server" Width="100%" Height="200" TextMode="MultiLine" /></td>
                        </tr>

                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblAdGallerySlideEffect" runat="server" /></td>
                            <td>
                                <asp:DropDownList ID="ddAdGallerySlideEffect" runat="server"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblAdGalleryPanelWidth" runat="server" /></td>
                            <td><asp:TextBox ID="txtAdGalleryPanelWidth" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblAdGalleryPanelHeight" runat="server" /></td>
                            <td><asp:TextBox ID="txtAdGalleryPanelHeight" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblAdGalleryPanelBackgroundColor" runat="server" /></td>
                            <td><asp:TextBox ID="txtAdGalleryPanelBackgroundColor" runat="server" Width="100"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblAdGalleryPanelPadding" runat="server" /></td>
                            <td><asp:TextBox ID="txtAdGalleryPanelPadding" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblAdGalleryShowAllImages" runat="server" /></td>
                            <td><asp:CheckBox ID="chkAdGalleryShowAllImages" runat="server"/></td>
                        </tr>
                    </table>
                    <dnn:SectionHead ID="sectionEasySliderGallery" runat="server" IncludeRule="True" Section="tblEasySliderGallery" CssClass="SubHead" IsExpanded="false" ResourceKey="EasySliderGallerySettings"></dnn:SectionHead>
                    <table id="tblEasySliderGallery" runat="server" width="100%">
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblEasySliderGalleryWidth" runat="server" /></td>
                            <td><asp:TextBox ID="txtEasySliderGalleryWidth" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblEasySliderGalleryHeight" runat="server" /></td>
                            <td><asp:TextBox ID="txtEasySliderGalleryHeight" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblEasySliderGalleryAlbum" runat="server" /></td>
                            <td><asp:Dropdownlist ID="ddEasySliderGalleryAlbum" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblEasySliderGalleryAutoPlay" runat="server" /></td>
                            <td><asp:CheckBox ID="chkEasySliderGalleryAutoPlay" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblEasySliderGalleryAutoRepeat" runat="server" /></td>
                            <td><asp:CheckBox ID="chkEasySliderGalleryAutoRepeat" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblEasySliderGallerySpeedTransition" runat="server" /></td>
                            <td><asp:TextBox ID="txtEasySliderGallerySpeedTransition" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblEasySliderGalleryPauseTime" runat="server" /></td>
                            <td><asp:TextBox ID="txtEasySliderGalleryPauseTime" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblEasySliderGalleryControlType" runat="server" /></td>
                            <td><asp:DropDownList ID="ddEasySliderGalleryControlType" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblEasySliderGalleryStylePrevNextButton" runat="server" /></td>
                            <td><asp:TextBox ID="txtEasySliderGalleryStylePrevNextButton" runat="server" Width="350"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblEasySliderGalleryStylePrevNextButtonLink" runat="server" /></td>
                            <td><asp:TextBox ID="txtEasySliderGalleryStylePrevNextButtonLink" runat="server" Width="350"/></td>
                        </tr>
                    </table>
                    <dnn:SectionHead ID="sectionCloudCarousel" runat="server" IncludeRule="True" Section="tblcloudcarousel" CssClass="SubHead" IsExpanded="false" ResourceKey="CloudCarouselSettings"></dnn:SectionHead>
                    <table id="tblcloudcarousel" runat="server" width="100%">
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselCanvasWidth" runat="server" /></td>
                            <td><asp:TextBox ID="txtCloudCarouselCanvasWidth" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselCanvasHeight" runat="server" /></td>
                            <td><asp:TextBox ID="txtCloudCarouselCanvasHeight" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselAlbum" runat="server" /></td>
                            <td><asp:Dropdownlist ID="ddCloudCarouselAlbum" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselCanvasBackgroundImage" runat="server" /></td>
                            <td><asp:TextBox ID="txtCloudCarouselCanvasBackgroundImage" runat="server" Width="350" />
                                <div class="DNNInfo_Note"><asp:Literal ID="litCloudCarouselBackgroundNote" runat="server" /></div>
                            </td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselXPos" runat="server" /></td>
                            <td><asp:TextBox ID="txtCloudCarouselXPos" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselYPos" runat="server" /></td>
                            <td><asp:TextBox ID="txtCloudCarouselYPos" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselRotateSpeed" runat="server" /></td>
                            <td><asp:TextBox ID="txtCloudCarouselRotateSpeed" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselAutoRotate" runat="server" /></td>
                            <td><asp:DropDownList ID="ddCloudCarouselAutoRotate" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselAutoRotateDelay" runat="server" /></td>
                            <td><asp:TextBox ID="txtCloudCarouselAutoRotateDelay" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselReflectionHeight" runat="server" /></td>
                            <td><asp:TextBox ID="txtCloudCarouselReflectionHeight" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselReflectionOpacity" runat="server" /></td>
                            <td><asp:TextBox ID ="txtCloudCarouselReflectionOpacity" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselFPS" runat="server" /></td>
                            <td><asp:TextBox ID="txtCloudCarouselFPS" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselMouseWheel" runat="server" /></td>
                            <td><asp:CheckBox ID="chkCloudCarouselMouseWheel" runat="server" /></td>
                        </tr>
                        <tr runat="server" visible="false">
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselBringToFront" runat="server" /></td>
                            <td><asp:CheckBox ID="chkCloudCarouselBringToFront" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselShowImageTitle" runat="server" /></td>
                            <td><asp:CheckBox ID="chkCloudCarouselShowImageTitle" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselShowImageDescription" runat="server" /></td>
                            <td><asp:CheckBox ID="chkCloudCarouselShowImageDescription" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselShowNavigationControls" runat="server" /></td>
                            <td><asp:CheckBox ID="chkCloudCarouselShowNavigationControls" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblCloudCarouselClickAction" runat="server" /></td>
                            <td><asp:DropDownList ID="ddCloudCarouselClickAction" runat="server" /></td>
                        </tr>
                    </table>
                    <dnn:SectionHead ID="sectionS3SliderGallery" runat="server" IncludeRule="True" Section="tblS3SliderGallery" CssClass="SubHead" IsExpanded="false" ResourceKey="S3SliderGallerySettings"></dnn:SectionHead>
                    <table id="tblS3SliderGallery" runat="server" width="100%">
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblS3SliderGalleryWidth" runat="server" /></td>
                            <td><asp:TextBox ID="txtS3SliderGalleryWidth" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblS3SliderGalleryHeight" runat="server" /></td>
                            <td><asp:TextBox ID="txtS3SliderGalleryHeight" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblS3SliderGalleryAlbum" runat="server" /></td>
                            <td><asp:Dropdownlist ID="ddS3SliderGalleryAlbum" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblS3SliderGalleryTimeTransition" runat="server" /></td>
                            <td><asp:TextBox ID="txtS3SliderGalleryTimeTransition" runat="server" Width="50"/></td>
                        </tr>
                    </table>
                    <dnn:SectionHead ID="sectionFancyBox" runat="server" IncludeRule="True" Section="tblFancyBox" CssClass="SubHead" IsExpanded="false" ResourceKey="FancyBoxSettings"></dnn:SectionHead>
                    <table id="tblFancyBox" runat="server" width="100%">
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblFancyBoxWrapperTemplate" runat="server" /></td>
                            <td><asp:TextBox ID="txtFancyBoxWrapperTemplate" runat="server" Width="100%" Height="200" TextMode="MultiLine" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblFancyBoxWrapperAlbumTemplate" runat="server" /></td>
                            <td><asp:TextBox ID="txtFancyBoxAlbumTemplate" runat="server" Width="100%" Height="200" TextMode="MultiLine" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblFancyBoxPagingTemplate" runat="server" /></td>
                            <td><asp:TextBox ID="txtFancyBoxPagingTemplate" runat="server" Width="100%" Height="200" TextMode="MultiLine" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblFancyBoxShowAllImages" runat="server" /></td>
                            <td><asp:CheckBox ID="chkFancyBoxShowAllImages" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblFancyBoxTransitionIn" runat="server" /></td>
                            <td><asp:DropDownList ID="ddFancyBoxTransitionIn" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblFancyBoxTransitionOut" runat="server" /></td>
                            <td><asp:DropDownList ID="ddFancyBoxTransitionOut" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblFancyBoxTitlePosition" runat="server" /></td>
                            <td><asp:DropDownList ID="ddFancyBoxTitlePosition" runat="server" /></td>
                        </tr>
                    </table>
                    
                    <dnn:SectionHead ID="sectionNivoSlider" runat="server" IncludeRule="True" Section="tblNivoSlider" CssClass="SubHead" IsExpanded="false" ResourceKey="NivoSliderSettings"></dnn:SectionHead>
                    <table id="tblNivoSlider" runat="server" width="100%">
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblNivoSliderWidth" runat="server" /></td>
                            <td><asp:TextBox ID="txtNivoSliderWidth" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblNivoSliderHeight" runat="server" /></td>
                            <td><asp:TextBox ID="txtNivoSliderHeight" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblNivoSliderAlbum" runat="server" /></td>
                            <td><asp:Dropdownlist ID="ddNivoSliderAlbum" runat="server"/></td>
                        </tr>
                        <tr runat="server" visible="false">
                            <td class="DNNInfo_Label"><dnn:label ID="lblNivoSliderTheme" runat="server" /></td>
                            <td><asp:Dropdownlist ID="ddNivoSliderTheme" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblNivoSliderEffect" runat="server" /></td>
                            <td><asp:Dropdownlist ID="ddNivoSliderEffect" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblNivoSliderTransitionSpeed" runat="server" /></td>
                            <td><asp:TextBox ID="txtNivoSliderTransitionSpeed" runat="server" Width="70"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblNivoSliderTransitionPauseTime" runat="server" /></td>
                            <td><asp:TextBox ID="txtNivoSliderTransitionPauseTime" runat="server" Width="70"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblNivoSliderShowNextAndPrevNavigation" runat="server" /></td>
                            <td><asp:CheckBox ID="chkNivoSliderShowNextAndPrevNavigation" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblNivoSliderShowThumbnailNavigation" runat="server" /></td>
                            <td><asp:CheckBox ID="chkNivoSliderShowThumbnailNavigation" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblNivoSliderThumbnailNavigationWidth" runat="server" /></td>
                            <td><asp:TextBox ID="txtNivoSliderThumbnailNavigationWidth" runat="server" Width="70"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblNivoSliderThumbnailNavigationHeight" runat="server" /></td>
                            <td><asp:TextBox ID="txtNivoSliderThumbnailNavigationHeight" runat="server" Width="70"/></td>
                        </tr>
                    </table>
                    <dnn:SectionHead ID="sectionLightBox" runat="server" IncludeRule="True" Section="tbllightbox" CssClass="SubHead" IsExpanded="false" ResourceKey="LightBoxSettings"></dnn:SectionHead>
                    <table id="tbllightbox" runat="server" width="100%">
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblLightBoxWrapperTemplate" runat="server" /></td>
                            <td><asp:TextBox ID="txtLightBoxWrapperTemplate" runat="server" Width="100%" Height="200" TextMode="MultiLine" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblLightBoxAlbumTemplate" runat="server" /></td>
                            <td><asp:TextBox ID="txtLightBoxAlbumTemplate" runat="server" Width="100%" Height="200" TextMode="MultiLine" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblLightBoxPagingTemplate" runat="server" /></td>
                            <td><asp:TextBox ID="txtLightBoxPagingTemplate" runat="server" Width="100%" Height="200" TextMode="MultiLine" /></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblLightBoxShowAllImages" runat="server" /></td>
                            <td><asp:CheckBox ID="chkLightBoxShowAllImages" runat="server"/></td>
                        </tr>
                    </table> 
                    <dnn:SectionHead ID="SectionDiapo" runat="server" IncludeRule="True" Section="tblDiapo" CssClass="SubHead" IsExpanded="false" ResourceKey="DiapoSettings"></dnn:SectionHead>
                    <table id="tblDiapo" runat="server" width="100%">
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDiapoWidth" runat="server" /></td>
                            <td><asp:TextBox ID="txtDiapoWidth" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDiapoHeight" runat="server" /></td>
                            <td><asp:TextBox ID="txtDiapoHeight" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDiapoAlbum" runat="server" /></td>
                            <td><asp:Dropdownlist ID="ddDiapoAlbum" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDiapoEffect" runat="server" /></td>
                            <td><asp:Dropdownlist ID="ddDiapoEffect" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDiapoTransitionTime" runat="server" /></td>
                            <td><asp:TextBox ID="txtDiapoTransitionTime" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDiapoTransitionSpeed" runat="server" /></td>
                            <td><asp:TextBox ID="txtDiapoTransitionSpeed" runat="server" Width="50"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDiapoShowNextAndPrevNavigation" runat="server" /></td>
                            <td><asp:CheckBox ID="chkDiapoShowNextAndPrevNavigation" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDiapoHidePlayButton" runat="server" /></td>
                            <td><asp:CheckBox ID="chkDiapoHidePlayButton" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDiapoPaginationType" runat="server" /></td>
                            <td><asp:Dropdownlist ID="ddDiapoPaginationType" runat="server"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDiapoLoaderColor" runat="server" /></td>
                            <td><asp:TextBox ID="txtDiapoLoaderColor" runat="server" Width="80"/></td>
                        </tr>
                        <tr>
                            <td class="DNNInfo_Label"><dnn:label ID="lblDiapoLoaderBackgroundColor" runat="server" /></td>
                            <td><asp:TextBox ID="txtDiapoLoaderBackgroundColor" runat="server" Width="80"/></td>
                        </tr>
                    </table> 
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" CssClass="DNNInfo_Button"/>&#160;<asp:Button ID="btnLoadDefaultSettings" runat="server" CausesValidation="false" CssClass="DNNInfo_Button"/>&#160;<asp:Button ID="btnClearCache" runat="server" CausesValidation="false" CssClass="DNNInfo_Button"/>&#160;<asp:Button ID="btnReturn" runat="server" CausesValidation="false" CssClass="DNNInfo_Button"/></td>
            </tr>
        </table>
        <p><asp:Label ID="lblMessageBottom" runat="server" /></p>
     </div>
</div>