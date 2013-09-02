<%@ WebHandler Language="VB" Class="DNNInfo.Modules.ImageGallery.LightBoxAlbumHandler" %>
Namespace DNNInfo.Modules.ImageGallery
    Public Class LightBoxAlbumHandler : Implements IHttpHandler
        Private objLightBoxGalleryHandler As LightBoxGalleryHandler
        Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
            context.Response.ContentType = "text/html"
            objLightBoxGalleryHandler = New LightBoxGalleryHandler()
            context.Response.Write(objLightBoxGalleryHandler.BuildDefaultAlbumTemplateContext(context))
        End Sub
 
        Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
            Get
                Return False
            End Get
        End Property
    End Class
End Namespace
