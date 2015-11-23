
' Partial Public Class New_Entry
Public Class New_Entry

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles SubmitButton.Click
        Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()

        ' Pull buyer information from form

        Dim buyerFName As String
        buyerFName = BuyerFirstName.Text

        Dim buyerLName As String
        buyerLName = BuyerLastName.Text

        Dim buyerAddr As String
        buyerAddr = BuyerAddress.Text

        Dim buyerCityName As String
        buyerCityName = BuyerCity.Text

        Dim buyerStateName As String
        buyerStateName = BuyerState.Text

        Dim buyerZip As String
        buyerZip = BuyerZipCode.Text

        Dim buyerEmailAddr As String
        buyerEmailAddr = BuyerEmail.Text

        Dim buyerPhoneNum As String
        buyerPhoneNum = BuyerPhone.Text

        Dim buyerRotMem As Boolean
        buyerRotMem = BuyerRotaryMember.Checked

        Dim buyerId As Integer
        tbl.spAddNewBuyer(buyerId, buyerLName, buyerFName, buyerAddr, buyerCityName, buyerStateName, buyerZip, buyerEmailAddr, buyerPhoneNum, "placeholder", buyerRotMem)

        ' Pull order information from 

        Dim orderDt As Date
        orderDt = OrderDate.Text

        Dim orderSrc As Integer
        orderSrc = OrderSourceDropDownList.SelectedValue

        Dim orderSubYear As Integer
        orderSubYear = SubscriptionYear.Text

        Dim orderTypeName As String
        orderTypeName = OrderType.SelectedValue

        Dim orderConfirmationDt As Date
        orderConfirmationDt = ConfirmationDate.Text

        Dim orderBasePrice As Double
        orderBasePrice = BasePrice.Text

        Dim orderDiscount As Integer
        orderDiscount = Discount.SelectedValue

        Dim orderExpireDt As Date
        orderExpireDt = ExpireDate.Text

        Dim orderPaymentMethod As Integer
        orderPaymentMethod = PaymentMethod.SelectedValue

        Dim orderFirstOccasion As Integer
        orderFirstOccasion = FirstHoliday.SelectedValue

        Dim orderId As Integer
        tbl.spAddNewOrder(orderId, orderDt, orderSrc, orderSubYear, orderBasePrice, orderDiscount, orderTypeName, orderConfirmationDt, orderFirstOccasion)


        ' Pull payment info from form

        Dim paymentAmountPaid As Double
        paymentAmountPaid = AmountPaid.Text

        Dim paymentDt As Date
        paymentDt = PaymentDate.Text

        tbl.spAddNewPayment(buyerId, orderId, paymentAmountPaid, paymentDt)

        ' Pull property owner info from form

        Dim poFName As String
        poFName = PropertyFirstName.Text

        Dim poLName As String
        poLName = PropertyLastName.Text

        Dim poAddr As String
        poAddr = PropertyAddress.Text

        Dim poCityName As String
        poCityName = PropertyCity.Text

        Dim poStateName As String
        poStateName = PropertyState.Text

        Dim poZip As String
        poZip = PropertyZipCode.Text

        Dim poEmailAddr As String
        poEmailAddr = PropertyEmail.Text

        Dim poPhoneNum As String
        poPhoneNum = PropertyPhone.Text

        Dim poRotMem As Boolean
        poRotMem = PropertyRotaryMember.Checked

        Dim poId As Integer
        tbl.spAddNewPropertyOwner(poId, poLName, poFName, poAddr, poCityName, poStateName, poZip, poEmailAddr, poPhoneNum, poRotMem)

        ' Pull property trait info from form

        Dim propTrait As Integer
        For Each box As ListItem In PropertyTraits.Items
            If box.Selected Then
                propTrait = box.Value
                tbl.spAddNewPropertyTraits(poId, propTrait)
            End If
        Next

        ' Pull oups info form form

        Dim oupsNotifiedDt As Date
        oupsNotifiedDt = OUPSNotifiedDate.Text

        Dim oupsTicketNum As String
        oupsTicketNum = OUPSTicketNumber.Text

        Dim oupsCheckedDt As Date
        oupsCheckedDt = OUPSCheckedDate.Text

        Dim oupsId As Integer
        tbl.spAddNewOups(oupsId, oupsTicketNum, oupsNotifiedDt, oupsCheckedDt)


        ' Pull sleeve info from form

        Dim sleeveLocationDescription As String
        sleeveLocationDescription = LocationDescription.Text

        Dim sleeveLatitude As Double
        sleeveLatitude = Latitude.Text

        Dim sleeveLongitude As Double
        sleeveLongitude = Longitude.Text

        Dim sleeveInstallDate As Date
        sleeveInstallDate = InstallDate.Text

        Dim sleeveChangeDate As Date
        sleeveChangeDate = ChangeDate.Text

        Dim sleevePublic As Boolean
        sleevePublic = PublicFlag.Checked

        Dim sleeveDeliver As Boolean
        sleeveDeliver = Deliver.Checked

        tbl.spAddNewSleeve(True, orderId, poId, sleeveLocationDescription, sleeveLatitude, sleeveLongitude, "", oupsId, sleeveInstallDate, sleeveChangeDate, sleevePublic, sleeveDeliver, orderExpireDt)

    End Sub

End Class