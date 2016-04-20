Public Class EditRouteColor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub Submit(ByVal sender As Object, ByVal e As System.EventArgs) Handles SubmitButton.Click
        Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()
        If RouteColorInput.Text = "" Then
            tbl.spRemoveFromRoute(PropertyOwnerGridView.SelectedRow.Cells(1).Text)
        Else
            tbl.spAddOrUpdateRouteColor(PropertyOwnerGridView.SelectedRow.Cells(1).Text, RouteColorInput.Text)
        End If
        Response.Redirect("EditRouteColor")
    End Sub

End Class