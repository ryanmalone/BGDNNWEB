<%@ WebHandler Language="VB" Class="DNNInfo.Modules.ImageGallery.DITHandler" %>

Imports System
Imports System.Web
Imports System.Collections.Generic
Imports System.IO
Imports DotNetNuke
Imports DotNetNuke.Common

Namespace DNNInfo.Modules.ImageGallery
    Public Class DITHandler : Implements IHttpHandler
        
        Private objDNNInfoGalleryHandler As DNNInfoGalleryHandler
        
        Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
            objDNNInfoGalleryHandler = New DNNInfoGalleryHandler()
            objDNNInfoGalleryHandler.GenerateDNNInfoGalleryContext(context)
        End Sub
        
 
        Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
            Get
                Return False
            End Get
        End Property

    End Class
End Namespace
