<%@ WebHandler Language="VB" Class="DNNInfo.Modules.ImageGallery.AdGalleryAlbumHandler" %>
Namespace DNNInfo.Modules.ImageGallery
    Public Class AdGalleryAlbumHandler : Implements IHttpHandler
        Private objAdGalleryHandler As AdGalleryHandler
        Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
            context.Response.ContentType = "text/html"
            objAdGalleryHandler = New AdGalleryHandler()
            context.Response.Write(objAdGalleryHandler.BuildDefaultAlbumTemplateContext(context))
        End Sub
 
        Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
            Get
                Return False
            End Get
        End Property
    End Class
End Namespace
