﻿Imports System.IO

' Partial Public Class New_Entry
Public Class New_Entry

    Inherits System.Web.UI.Page

    ' Database connection
    Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()

    ' Buyer variables
    Dim vBuyerId As Integer
    Dim vBuyerFirstName As String = ""
    Dim vBuyerLastName As String = ""
    Dim vBuyerAddress As String = ""
    Dim vBuyerCity As String = ""
    Dim vBuyerState As String = ""
    Dim vBuyerZipCode As String = ""
    Dim vBuyerEmail As String = ""
    Dim vBuyerPhone As String = ""
    Dim vBuyerRotaryMember As Boolean = False

    ' Order variables
    Dim vOrderId As Integer
    Dim vOrderExpireDate As Date

    ' PropertyOwner variables
    Dim vPropertyOwnerId As Integer
    Dim vPropertyOwnerFirstName As String = ""
    Dim vPropertyOwnerLastName As String = ""
    Dim vPropertyOwnerAddress As String = ""
    Dim vPropertyOwnerCity As String = ""
    Dim vPropertyOwnerState As String = ""
    Dim vPropertyOwnerZipCode As String = ""
    Dim vPropertyOwnerEmail As String = ""
    Dim vPropertyOwnerPhone As String = ""
    Dim vPropertyOwnerRotaryMember As Boolean = False

    Dim vSleeveId As Integer

    Dim vOupsId As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub


    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles SubmitButton.Click

        HandleBuyer()
        HandleOrder()
        HandlePayment()
        HandlePropertyOwner()
        HandlePropertyTraits()
        HandleOups()
        HandleSleeve()
        HandlePhotos()

        Response.Redirect("~/Main_Menu")

    End Sub


    Protected Sub HandleBuyer()
        vBuyerId = BuyerDropDownList.SelectedValue
        vBuyerFirstName = BuyerFirstName.Text
        vBuyerLastName = BuyerLastName.Text
        vBuyerAddress = BuyerAddress.Text
        vBuyerCity = BuyerCity.Text
        vBuyerState = BuyerState.Text
        vBuyerZipCode = BuyerZipCode.Text
        vBuyerEmail = BuyerEmail.Text
        vBuyerPhone = BuyerPhone.Text
        vBuyerRotaryMember = BuyerRotaryMember.Checked

        If vBuyerId = 0 Then
            tbl.spAddNewBuyer(vBuyerId, vBuyerLastName, vBuyerFirstName, vBuyerAddress, vBuyerCity, vBuyerState, vBuyerZipCode, vBuyerEmail, vBuyerPhone, "Online", vBuyerRotaryMember)
        End If
    End Sub


    Protected Sub HandleOrder()
        Dim vOrderDate As Date
        Dim vOrderSource As Integer
        Dim vOrderSubscriptionYear As Integer
        Dim vOrderType As String
        Dim vOrderConfirmationDate As Date
        Dim vOrderBasePrice As Double
        Dim vOrderDiscount As Integer
        Dim vOrderPaymentMethod As Integer
        Dim vOrderFirstOccasion As Integer

        vOrderDate = OrderDate.Text
        vOrderSource = OrderSourceDropDownList.SelectedValue
        vOrderSubscriptionYear = SubscriptionYear.Text
        vOrderType = OrderType.SelectedValue
        vOrderConfirmationDate = ConfirmationDate.Text
        vOrderBasePrice = BasePrice.Text
        vOrderDiscount = Discount.SelectedValue
        vOrderExpireDate = ExpireDate.Text
        vOrderPaymentMethod = PaymentMethod.SelectedValue
        vOrderFirstOccasion = FirstHoliday.SelectedValue

        tbl.spAddNewOrder(vOrderId, vOrderDate, vOrderSource, vOrderSubscriptionYear, vOrderBasePrice, vOrderDiscount, vOrderType, vOrderConfirmationDate, vOrderFirstOccasion)
    End Sub


    Protected Sub HandlePayment()
        Dim vPaymentAmountPaid As Double
        Dim vPaymentDate As Date

        vPaymentAmountPaid = AmountPaid.Text
        vPaymentDate = PaymentDate.Text

        tbl.spAddNewPayment(vBuyerId, vOrderId, vPaymentAmountPaid, vPaymentDate)
    End Sub


    Protected Sub HandlePropertyOwner()
        vPropertyOwnerFirstName = PropertyFirstName.Text
        vPropertyOwnerLastName = PropertyLastName.Text
        vPropertyOwnerAddress = PropertyAddress.Text
        vPropertyOwnerCity = PropertyCity.Text
        vPropertyOwnerState = PropertyState.Text
        vPropertyOwnerZipCode = PropertyZipCode.Text
        vPropertyOwnerEmail = PropertyEmail.Text
        vPropertyOwnerPhone = PropertyPhone.Text
        vPropertyOwnerRotaryMember = PropertyRotaryMember.Checked

        If vPropertyOwnerId = 0 Then
            tbl.spAddNewPropertyOwner(vPropertyOwnerId, vPropertyOwnerLastName, vPropertyOwnerFirstName, vPropertyOwnerAddress, vPropertyOwnerCity, vPropertyOwnerState, vPropertyOwnerZipCode, vPropertyOwnerEmail, vPropertyOwnerPhone, vPropertyOwnerRotaryMember)
        End If
    End Sub


    Protected Sub HandlePropertyTraits()
        Dim vPropertyTrait As Integer
        For Each box As ListItem In PropertyTraits.Items
            If box.Selected Then
                vPropertyTrait = box.Value
                tbl.spAddNewPropertyTraits(vPropertyOwnerId, vPropertyTrait)
            End If
        Next
    End Sub


    Protected Sub HandleOups()
        Dim vOupsNotifiedDate As Date
        Dim vOupsTicketNumber As String
        Dim vOupsCheckedDate As Date

        vOupsNotifiedDate = OUPSNotifiedDate.Text
        vOupsTicketNumber = OUPSTicketNumber.Text
        vOupsCheckedDate = OUPSCheckedDate.Text

        tbl.spAddNewOups(vOupsId, vOupsTicketNumber, vOupsNotifiedDate, vOupsCheckedDate)
    End Sub


    Protected Sub HandleSleeve()
        Dim vSleeveLocationDescription As String
        Dim vSleeveLatitude As Double
        Dim vSleeveLongitude As Double
        Dim vSleeveInstallDate As Date
        Dim vSleeveChangeDate As Date
        Dim vSleevePublic As Boolean
        Dim vSleeveDeliver As Boolean

        vSleeveLocationDescription = LocationDescription.Text
        vSleeveLatitude = Latitude.Text
        vSleeveLongitude = Longitude.Text
        vSleeveInstallDate = InstallDate.Text
        vSleeveChangeDate = ChangeDate.Text
        vSleevePublic = PublicFlag.Checked
        vSleeveDeliver = Deliver.Checked

        tbl.spAddNewSleeve(vSleeveId, True, vOrderId, vPropertyOwnerId, vSleeveLocationDescription, vSleeveLatitude, vSleeveLongitude, vOupsId, vSleeveInstallDate, vSleeveChangeDate, vSleevePublic, vSleeveDeliver, vOrderExpireDate)

    End Sub


    Protected Sub HandlePhotos()
        For Each file As String In Request.Files
            If Request.Files(file).ContentLength > 0 Then
                Dim fs As Stream = Request.Files(file).InputStream
                Dim br As New BinaryReader(fs)
                Dim bytes As Byte() = br.ReadBytes(fs.Length)
                tbl.spAddNewPhoto(vSleeveId, bytes)
            End If
        Next
    End Sub


    Protected Sub BuyerChange(sender As Object, e As EventArgs) Handles BuyerDropDownList.SelectedIndexChanged
        vBuyerId = BuyerDropDownList.SelectedValue

        If Not vBuyerId = 0 Then
            tbl.spSelectBuyer(vBuyerId, vBuyerLastName, vBuyerFirstName, vBuyerAddress, vBuyerCity, vBuyerState, vBuyerZipCode, vBuyerEmail, vBuyerPhone, "Online", vBuyerRotaryMember)
            BuyerFirstName.Text = vBuyerFirstName
            BuyerLastName.Text = vBuyerLastName
            BuyerAddress.Text = vBuyerAddress
            BuyerCity.Text = vBuyerCity
            BuyerState.Text = vBuyerState
            BuyerZipCode.Text = vBuyerZipCode
            BuyerEmail.Text = vBuyerEmail
            BuyerPhone.Text = vBuyerPhone
            BuyerRotaryMember.Checked = vBuyerRotaryMember
        Else
            BuyerFirstName.Text = ""
            BuyerLastName.Text = ""
            BuyerAddress.Text = ""
            BuyerCity.Text = ""
            BuyerState.Text = ""
            BuyerZipCode.Text = ""
            BuyerEmail.Text = ""
            BuyerPhone.Text = ""
            BuyerRotaryMember.Checked = False
        End If
    End Sub


    Protected Sub PropertyOwnerChange(sender As Object, e As EventArgs) Handles PropertyOwnerDropDownList.SelectedIndexChanged
        vPropertyOwnerId = PropertyOwnerDropDownList.SelectedValue

        If Not vPropertyOwnerId = 0 Then
            tbl.spSelectPropertyOwner(vPropertyOwnerId, vPropertyOwnerLastName, vPropertyOwnerFirstName, vPropertyOwnerAddress, vPropertyOwnerCity, vPropertyOwnerState, vPropertyOwnerZipCode, vPropertyOwnerEmail, vPropertyOwnerPhone, vPropertyOwnerRotaryMember)
            PropertyFirstName.Text = vPropertyOwnerFirstName
            PropertyLastName.Text = vPropertyOwnerLastName
            PropertyAddress.Text = vPropertyOwnerAddress
            PropertyCity.Text = vPropertyOwnerCity
            PropertyState.Text = vPropertyOwnerState
            PropertyZipCode.Text = vPropertyOwnerZipCode
            PropertyEmail.Text = vPropertyOwnerEmail
            PropertyPhone.Text = vPropertyOwnerPhone
            PropertyRotaryMember.Checked = vPropertyOwnerRotaryMember
            Dim hasTrait As Boolean
            Dim vPropertyTrait As Integer
            For Each box As ListItem In PropertyTraits.Items
                hasTrait = False
                vPropertyTrait = box.Value
                tbl.spPropertyHasTrait(vPropertyOwnerId, vPropertyTrait, hasTrait)
                If hasTrait Then
                    box.Selected = True
                End If
            Next
        Else
            PropertyFirstName.Text = ""
            PropertyLastName.Text = ""
            PropertyAddress.Text = ""
            PropertyCity.Text = ""
            PropertyState.Text = ""
            PropertyZipCode.Text = ""
            PropertyEmail.Text = ""
            PropertyPhone.Text = ""
            PropertyRotaryMember.Checked = False
            For Each box As ListItem In PropertyTraits.Items
                box.Selected = False
            Next
        End If
    End Sub

End Class