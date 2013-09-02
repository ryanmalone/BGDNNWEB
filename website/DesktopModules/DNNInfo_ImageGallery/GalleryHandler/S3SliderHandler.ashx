<%@ WebHandler Language="VB" Class="DNNInfo.Modules.ImageGallery.S3SliderHandler" %>

Namespace DNNInfo.Modules.ImageGallery
    Public Class S3SliderHandler : Implements IHttpHandler
        Private objS3SliderGalleryHandler As S3SliderGalleryHandler

        Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
            context.Response.ContentType = "text/html"
            objS3SliderGalleryHandler = New S3SliderGalleryHandler()
            context.Response.Write(objS3SliderGalleryHandler.BuildS3SliderGalleryImageTemplateContext(context))
        End Sub

        Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
            Get
                Return False
            End Get
        End Property

    End Class
End Namespace
