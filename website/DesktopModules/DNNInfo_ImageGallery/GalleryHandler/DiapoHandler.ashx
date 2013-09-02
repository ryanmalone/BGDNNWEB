<%@ WebHandler Language="VB" Class="DNNInfo.Modules.ImageGallery.CoinSliderHandler" %>

Namespace DNNInfo.Modules.ImageGallery
    Public Class CoinSliderHandler : Implements IHttpHandler
        Private objCoinSliderGalleryHandler As CoinSliderGalleryHandler

        Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
            context.Response.ContentType = "text/html"
            objCoinSliderGalleryHandler = New CoinSliderGalleryHandler()
            context.Response.Write(objCoinSliderGalleryHandler.BuildCoinSliderImageTemplateContext(context))
        End Sub

        Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
            Get
                Return False
            End Get
        End Property

    End Class
End Namespace
