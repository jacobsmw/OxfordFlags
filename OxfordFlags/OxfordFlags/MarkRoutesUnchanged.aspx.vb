Public Class MarkRoutesUnchanged
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub Mark(ByVal sender As Object, ByVal e As System.EventArgs) Handles YesButton.Click
        Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()
        tbl.spMarkAllRoutesUnchanged()
        Response.Redirect("~/Admin")
    End Sub

End Class