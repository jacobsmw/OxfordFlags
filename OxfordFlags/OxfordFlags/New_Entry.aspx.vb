Imports System.IO

' Partial Public Class New_Entry
Public Class New_Entry

    Inherits System.Web.UI.Page

    ' Database connection
    Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()

    ' Buyer variables
    Dim buyerId As Integer
    Dim buyerFName As String = ""
    Dim buyerLName As String = ""
    Dim buyerAddr As String = ""
    Dim buyerCityName As String = ""
    Dim buyerStateName As String = ""
    Dim buyerZip As String = ""
    Dim buyerEmailAddr As String = ""
    Dim buyerPhoneNum As String = ""
    Dim buyerRotMem As Boolean = False

    ' Order variables
    Dim orderId As Integer
    Dim orderExpireDt As Date

    ' PropertyOwner variables
    Dim poId As Integer
    Dim poFName As String = ""
    Dim poLName As String = ""
    Dim poAddr As String = ""
    Dim poCityName As String = ""
    Dim poStateName As String = ""
    Dim poZip As String = ""
    Dim poEmailAddr As String = ""
    Dim poPhoneNum As String = ""
    Dim poRotMem As Boolean = False

    Dim sleeveId As Integer

    Dim oupsId As Integer

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
        buyerId = BuyerDropDownList.SelectedValue
        buyerFName = BuyerFirstName.Text
        buyerLName = BuyerLastName.Text
        buyerAddr = BuyerAddress.Text
        buyerCityName = BuyerCity.Text
        buyerStateName = BuyerState.Text
        buyerZip = BuyerZipCode.Text
        buyerEmailAddr = BuyerEmail.Text
        buyerPhoneNum = BuyerPhone.Text
        buyerRotMem = BuyerRotaryMember.Checked

        If buyerId = 0 Then
            tbl.spAddNewBuyer(buyerId, buyerLName, buyerFName, buyerAddr, buyerCityName, buyerStateName, buyerZip, buyerEmailAddr, buyerPhoneNum, "Online", buyerRotMem)
        End If
    End Sub


    Protected Sub HandleOrder()
        Dim orderDt As Date
        Dim orderSrc As Integer
        Dim orderSubYear As Integer
        Dim orderTypeName As String
        Dim orderConfirmationDt As Date
        Dim orderBasePrice As Double
        Dim orderDiscount As Integer
        Dim orderPaymentMethod As Integer
        Dim orderFirstOccasion As Integer

        orderDt = OrderDate.Text
        orderSrc = OrderSourceDropDownList.SelectedValue
        orderSubYear = SubscriptionYear.Text
        orderTypeName = OrderType.SelectedValue
        orderConfirmationDt = ConfirmationDate.Text
        orderBasePrice = BasePrice.Text
        orderDiscount = Discount.SelectedValue
        orderExpireDt = ExpireDate.Text
        orderPaymentMethod = PaymentMethod.SelectedValue
        orderFirstOccasion = FirstHoliday.SelectedValue

        tbl.spAddNewOrder(orderId, orderDt, orderSrc, orderSubYear, orderBasePrice, orderDiscount, orderTypeName, orderConfirmationDt, orderFirstOccasion)
    End Sub


    Protected Sub HandlePayment()
        Dim paymentAmountPaid As Double
        Dim paymentDt As Date

        paymentAmountPaid = AmountPaid.Text
        paymentDt = PaymentDate.Text

        tbl.spAddNewPayment(buyerId, orderId, paymentAmountPaid, paymentDt)
    End Sub


    Protected Sub HandlePropertyOwner()
        poFName = PropertyFirstName.Text
        poLName = PropertyLastName.Text
        poAddr = PropertyAddress.Text
        poCityName = PropertyCity.Text
        poStateName = PropertyState.Text
        poZip = PropertyZipCode.Text
        poEmailAddr = PropertyEmail.Text
        poPhoneNum = PropertyPhone.Text
        poRotMem = PropertyRotaryMember.Checked

        If poId = 0 Then
            tbl.spAddNewPropertyOwner(poId, poLName, poFName, poAddr, poCityName, poStateName, poZip, poEmailAddr, poPhoneNum, poRotMem)
        End If
    End Sub


    Protected Sub HandlePropertyTraits()
        Dim propTrait As Integer
        For Each box As ListItem In PropertyTraits.Items
            If box.Selected Then
                propTrait = box.Value
                tbl.spAddNewPropertyTraits(poId, propTrait)
            End If
        Next
    End Sub


    Protected Sub HandleOups()
        Dim oupsNotifiedDt As Date
        Dim oupsTicketNum As String
        Dim oupsCheckedDt As Date

        oupsNotifiedDt = OUPSNotifiedDate.Text
        oupsTicketNum = OUPSTicketNumber.Text
        oupsCheckedDt = OUPSCheckedDate.Text

        tbl.spAddNewOups(oupsId, oupsTicketNum, oupsNotifiedDt, oupsCheckedDt)
    End Sub


    Protected Sub HandleSleeve()
        Dim sleeveLocationDescription As String
        Dim sleeveLatitude As Double
        Dim sleeveLongitude As Double
        Dim sleeveInstallDate As Date
        Dim sleeveChangeDate As Date
        Dim sleevePublic As Boolean
        Dim sleeveDeliver As Boolean

        sleeveLocationDescription = LocationDescription.Text
        sleeveLatitude = Latitude.Text
        sleeveLongitude = Longitude.Text
        sleeveInstallDate = InstallDate.Text
        sleeveChangeDate = ChangeDate.Text
        sleevePublic = PublicFlag.Checked
        sleeveDeliver = Deliver.Checked

        tbl.spAddNewSleeve(sleeveId, True, orderId, poId, sleeveLocationDescription, sleeveLatitude, sleeveLongitude, oupsId, sleeveInstallDate, sleeveChangeDate, sleevePublic, sleeveDeliver, orderExpireDt)

    End Sub


    Protected Sub HandlePhotos()
        For Each file As String In Request.Files
            If Request.Files(file).ContentLength > 0 Then
                Dim fs As Stream = Request.Files(file).InputStream
                Dim br As New BinaryReader(fs)
                Dim bytes As Byte() = br.ReadBytes(fs.Length)
                tbl.spAddNewPhoto(sleeveId, bytes)
            End If
        Next
    End Sub


    Protected Sub BuyerChange(sender As Object, e As EventArgs) Handles BuyerDropDownList.SelectedIndexChanged
        buyerId = BuyerDropDownList.SelectedValue

        If Not buyerId = 0 Then
            tbl.spSelectBuyer(buyerId, buyerLName, buyerFName, buyerAddr, buyerCityName, buyerStateName, buyerZip, buyerEmailAddr, buyerPhoneNum, "Online", buyerRotMem)
            BuyerFirstName.Text = buyerFName
            BuyerLastName.Text = buyerLName
            BuyerAddress.Text = buyerAddr
            BuyerCity.Text = buyerCityName
            BuyerState.Text = buyerStateName
            BuyerZipCode.Text = buyerZip
            BuyerEmail.Text = buyerEmailAddr
            BuyerPhone.Text = buyerPhoneNum
            BuyerRotaryMember.Checked = buyerRotMem
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
        poId = PropertyOwnerDropDownList.SelectedValue

        If Not poId = 0 Then
            tbl.spSelectPropertyOwner(poId, poLName, poFName, poAddr, poCityName, poStateName, poZip, poEmailAddr, poPhoneNum, poRotMem)
            PropertyFirstName.Text = poFName
            PropertyLastName.Text = poLName
            PropertyAddress.Text = poAddr
            PropertyCity.Text = poCityName
            PropertyState.Text = poStateName
            PropertyZipCode.Text = poZip
            PropertyEmail.Text = poEmailAddr
            PropertyPhone.Text = poPhoneNum
            PropertyRotaryMember.Checked = poRotMem
            Dim hasTrait As Boolean
            Dim propTrait As Integer
            For Each box As ListItem In PropertyTraits.Items
                hasTrait = False
                propTrait = box.Value
                tbl.spPropertyHasTrait(poId, propTrait, hasTrait)
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