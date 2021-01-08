Imports System.Web
Imports System.Web.Services

Public Class Manifest
    Implements System.Web.IHttpHandler

    Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest

        context.Response.ContentType = "text/cache-manifest"

        context.Response.ContentEncoding = System.Text.Encoding.UTF8
        context.Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache)

        context.Response.WriteFile(context.Server.MapPath("manifest.txt"))

    End Sub

    ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class