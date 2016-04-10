Imports System.Web.Helpers
Imports System.Web.Mvc

Public Class Search
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub
    Protected Sub Submit(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim customerName As String = Request.Form(txtSearch.UniqueID)
        Dim customerId As String = Request.Form(hfCustomerId.UniqueID)

        SqlDataSource1.SelectCommand = "SELECT * FROM [Buyer] where [BuyerID] =" & customerId
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting

    End Sub
End Class
