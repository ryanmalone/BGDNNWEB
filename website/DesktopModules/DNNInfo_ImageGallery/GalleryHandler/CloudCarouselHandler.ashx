<%@ WebHandler Language="VB" Class="DNNInfo.Modules.ImageGallery.CloudCarouselHandler" %>

Namespace DNNInfo.Modules.ImageGallery
    Public Class CloudCarouselHandler : Implements IHttpHandler
        Private objCloudCarouselGalleryHandler As CloudCarouselGalleryHandler

        Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
            context.Response.ContentType = "text/html"
            objCloudCarouselGalleryHandler = New CloudCarouselGalleryHandler()
            context.Response.Write(objCloudCarouselGalleryHandler.BuildCloudCarouselImageTemplateContext(context))
        End Sub

        Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
            Get
                Return False
            End Get
        End Property

    End Class
End Namespace
