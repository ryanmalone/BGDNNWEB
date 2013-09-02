<%@ WebHandler Language="VB" Class="DNNInfo.Modules.ImageGallery.PrettyPhotoImageHandler" %>

Namespace DNNInfo.Modules.ImageGallery
    Public Class PrettyPhotoImageHandler : Implements IHttpHandler
        Private objPrettyPhotoGalleryHandler As PrettyPhotoGalleryHandler

        Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
            context.Response.ContentType = "text/html"
            objPrettyPhotoGalleryHandler = New PrettyPhotoGalleryHandler()
            context.Response.Write(objPrettyPhotoGalleryHandler.BuildDefaultImageTemplateContext(context))
        End Sub

        Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
            Get
                Return False
            End Get
        End Property

    End Class
End Namespace
