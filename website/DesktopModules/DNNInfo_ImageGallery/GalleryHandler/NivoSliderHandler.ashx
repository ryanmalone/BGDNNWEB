<%@ WebHandler Language="VB" Class="DNNInfo.Modules.ImageGallery.NivoSliderHandler" %>

Namespace DNNInfo.Modules.ImageGallery
    Public Class NivoSliderHandler : Implements IHttpHandler
        Private objNivoSliderGalleryHandler As NivoSliderGalleryHandler

        Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
            context.Response.ContentType = "text/html"
            objNivoSliderGalleryHandler = New NivoSliderGalleryHandler()
            context.Response.Write(objNivoSliderGalleryHandler.BuildNivoSliderImageTemplateContext(context))
        End Sub

        Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
            Get
                Return False
            End Get
        End Property

    End Class
End Namespace
