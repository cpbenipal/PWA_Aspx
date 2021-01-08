Imports EPRPWAspx.EPRPWAspx.App_Code

Public Class Employees
    Inherits System.Web.UI.Page
    Private ReadOnly ConnectionString As String = ConfigurationManager.ConnectionStrings("connection").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetAllEmployees()
        End If
    End Sub

    Private Sub GetAllEmployees()
        'AdoHelper.ConnectionString = ConnectionString
        Dim dataSet As DataSet = New AdoHelper().ExecDataSetProc("[dbo].[GetAllEmployees]")
        GrdEmployees.DataSource = dataSet
        GrdEmployees.DataBind()
    End Sub

    Protected Sub GrdEmployees_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GrdEmployees.PageIndex = e.NewPageIndex
        GetAllEmployees()
    End Sub

End Class