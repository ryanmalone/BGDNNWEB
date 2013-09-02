<%@ WebHandler Language="VB" Class="DNNInfo.Modules.ImageGallery.PrettyPhotoAlbumHandler" %>
Namespace DNNInfo.Modules.ImageGallery
    Public Class PrettyPhotoAlbumHandler : Implements IHttpHandler
        Private objPrettyPhotoGalleryHandler As PrettyPhotoGalleryHandler
        Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
            context.Response.ContentType = "text/html"
            objPrettyPhotoGalleryHandler = New PrettyPhotoGalleryHandler()
            context.Response.Write(objPrettyPhotoGalleryHandler.BuildDefaultAlbumTemplateContext(context))
        End Sub
 
        Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
            Get
                Return False
            End Get
        End Property
    End Class
End Namespace
