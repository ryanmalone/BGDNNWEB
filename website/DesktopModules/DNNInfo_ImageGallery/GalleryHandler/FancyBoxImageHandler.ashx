<%@ WebHandler Language="VB" Class="DNNInfo.Modules.ImageGallery.FancyBoxImageHandler" %>

Namespace DNNInfo.Modules.ImageGallery
    Public Class FancyBoxImageHandler : Implements IHttpHandler
        Private objFancyBoxGalleryHandler As FancyBoxGalleryHandler

        Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
            context.Response.ContentType = "text/html"
            objFancyBoxGalleryHandler = New FancyBoxGalleryHandler()
            context.Response.Write(objFancyBoxGalleryHandler.BuildDefaultImageTemplateContext(context))
        End Sub

        Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
            Get
                Return False
            End Get
        End Property

    End Class
End Namespace
