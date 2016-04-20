Imports System.Web.Helpers
Imports System.Web.Mvc

Public Class Search
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If

        PersonResult.Visible = False
        OupsResult.Visible = False
    End Sub
    Protected Sub SearchOups(sender As Object, e As EventArgs) Handles OupsSearchButton.Click
        Dim oupsTicketNumber As String = Request.Form(OupsSearch.UniqueID)
        Dim oupsId As String = Request.Form(hfOupsID.UniqueID)

        Label1.Text = oupsTicketNumber

        OupsDataSource.SelectCommand = "Select * From [Oups], [Sleeve], [Order] WHERE [Sleeve].[OrderID] = [Order].[OrderID] AND [Oups].[OupsID] =" & oupsId
        OupsResult.Visible = True
    End Sub

    Protected Sub SearchPerson(sender As Object, e As EventArgs) Handles PersonSearchButton.Click
        Dim personName As String = Request.Form(PersonSearch.UniqueID)
        Dim personId As String = Request.Form(hfPersonID.UniqueID)

        Label1.Text = personName

        PersonDataSource.SelectCommand = "SELECT * FROM [Buyer] where [BuyerID] =" & personId
        PersonResult.Visible = True

        If SearchTypeSelection.SelectedValue = 1 Then

        End If

    End Sub

End Class
