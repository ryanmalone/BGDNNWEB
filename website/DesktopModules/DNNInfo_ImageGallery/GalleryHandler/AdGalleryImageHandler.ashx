<%@ WebHandler Language="VB" Class="DNNInfo.Modules.ImageGallery.AdGalleryImageHandler" %>

Namespace DNNInfo.Modules.ImageGallery
    Public Class AdGalleryImageHandler : Implements IHttpHandler
        Private objAdGalleryGalleryHandler As AdGalleryHandler

        Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
            context.Response.ContentType = "text/html"
            objAdGalleryGalleryHandler = New AdGalleryHandler()
            context.Response.Write(objAdGalleryGalleryHandler.BuildDefaultImageTemplateContext(context))
        End Sub

        Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
            Get
                Return False
            End Get
        End Property

    End Class
End Namespace
