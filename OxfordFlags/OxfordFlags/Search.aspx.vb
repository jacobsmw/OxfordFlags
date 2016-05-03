Imports System.Web.Helpers
Imports System.Web.Mvc

Public Class Search
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If

        PersonSearchBox.Visible = False
        PersonSearchButton.Visible = False
        AddressSearchBox.Visible = False
        AddressSearchButton.Visible = False
        OrderDetailsLabel.Visible = False
        OupsDetailsLabel.Visible = False

    End Sub

    Protected Sub PersonSearch(sender As Object, e As EventArgs) Handles PersonSearchButton.Click
        Dim personName As String = Request.Form(PersonSearchBox.UniqueID)
        Dim personId As String = Request.Form(hfPersonID.UniqueID)

        PersonSearchBox.Visible = True
        PersonSearchButton.Visible = True
        AddressSearchBox.Visible = False
        AddressSearchButton.Visible = False

        BuyerDetails.Visible = True
        OrderDetails.Visible = True
        PaymentSleeveDetails.Visible = True
        PropertyDetails.Visible = False
        SleeveDetails.Visible = False
        OupsDetails.Visible = False
        OrderDetailsLabel.Visible = True
        OupsDetailsLabel.Visible = False

    End Sub

    Protected Sub AddressSearch(sender As Object, e As EventArgs) Handles AddressSearchButton.Click
        Dim streetAddress As String = Request.Form(AddressSearchBox.UniqueID)
        Dim propertyOwnerId As String = Request.Form(hfPropertyOwnerId.UniqueID)

        PersonSearchBox.Visible = False
        PersonSearchButton.Visible = False
        AddressSearchBox.Visible = True
        AddressSearchButton.Visible = True

        BuyerDetails.Visible = False
        OrderDetails.Visible = False
        PaymentSleeveDetails.Visible = False
        PropertyDetails.Visible = True
        SleeveDetails.Visible = True
        OupsDetails.Visible = True
        OrderDetailsLabel.Visible = False
        OupsDetailsLabel.Visible = True

    End Sub

    Protected Sub SelectSearchType_SelectedIndexChanged(sender As Object, e As EventArgs) Handles SelectSearchType.SelectedIndexChanged
        Select Case SelectSearchType.SelectedValue
            Case 0
                PersonSearchBox.Visible = False
                PersonSearchButton.Visible = False
                AddressSearchBox.Visible = False
                AddressSearchButton.Visible = False
            Case 1
                PersonSearchBox.Visible = True
                PersonSearchButton.Visible = True
                AddressSearchBox.Visible = False
                AddressSearchButton.Visible = False
            Case 2
                PersonSearchBox.Visible = False
                PersonSearchButton.Visible = False
                AddressSearchBox.Visible = True
                AddressSearchButton.Visible = True
        End Select
    End Sub

End Class
