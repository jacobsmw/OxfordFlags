Imports System.Web.Helpers
Imports System.Web.Mvc

Public Class Search
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Public Shared Function CountryLookup() As ActionResult
        Dim countries As New List(Of String)
        countries.Add("United States")
        Return Json(countries, JsonRequestBehavior.AllowGet)
    End Function

    Private Shared Function Json(countries As List(Of String), jsonRequestBehavior As JsonRequestBehavior) As ActionResult
        Throw New NotImplementedException
    End Function

End Class
