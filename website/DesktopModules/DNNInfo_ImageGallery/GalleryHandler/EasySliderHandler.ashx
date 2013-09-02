<%@ WebHandler Language="VB" Class="DNNInfo.Modules.ImageGallery.EasySliderHandler" %>

Namespace DNNInfo.Modules.ImageGallery
    Public Class SlidingImageHandler : Implements IHttpHandler
        Private objEasySliderGalleryHandler As EasySliderGalleryHandler

        Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
            context.Response.ContentType = "text/html"
            objEasySliderGalleryHandler = New EasySliderGalleryHandler()
            context.Response.Write(objEasySliderGalleryHandler.BuildEasySliderGalleryImageTemplateContext(context))
        End Sub

        Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
            Get
                Return False
            End Get
        End Property

    End Class
End Namespace
