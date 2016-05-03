Public Class AddPayment
    Inherits System.Web.UI.Page

    Dim tbl As dsTableAdapters.spSelectOrderCrossTableTableAdapter = New dsTableAdapters.spSelectOrderCrossTableTableAdapter()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub Search(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchButton.Load
        
    End Sub

    Protected Sub GetOrderInfo(ByVal sender As Object, ByVal e As System.EventArgs) Handles OrdersListBox.SelectedIndexChanged
        Dim OrderID = OrdersListBox.SelectedValue
        Dim tbl1 As dsTableAdapters.spSelectBuyersByOrderIDTableAdapter = New dsTableAdapters.spSelectBuyersByOrderIDTableAdapter()
        Dim BuyerNames = ""
        For Each Name As DataRow In tbl1.GetData(OrderID)
            BuyerNames = BuyerNames & Name.Field(Of String)("FirstName") & " " & Name.Field(Of String)("LastName") & ", "
        Next
        BuyersCell.Text = BuyerNames.TrimEnd({" "c, ","c})
        Dim tbl2 As dsTableAdapters.spSelectPropertyOwnerByOrderIDTableAdapter = New dsTableAdapters.spSelectPropertyOwnerByOrderIDTableAdapter()
        For Each Name As DataRow In tbl2.GetData(OrderID)
            PropertyOwnerCell.Text = Name.Field(Of String)("FirstName") & " " & Name.Field(Of String)("LastName")
            PropertyOwnerAddressCell.Text = Name.Field(Of String)("StreetAddress")
        Next
        Dim tbl3 As dsTableAdapters.spSelectPaymentStatusByOrderIDTableAdapter = New dsTableAdapters.spSelectPaymentStatusByOrderIDTableAdapter()
        For Each Name As DataRow In tbl3.GetData(OrderID)
            TotalAmountOwedCell.Text = "$" & Name.Field(Of Double)("AmountDue")
            TotalAmountPaidCell.Text = "$" & Name.Field(Of Double)("AmountPaid")
        Next
    End Sub

    Protected Sub HandlePayment(ByVal sender As Object, ByVal e As System.EventArgs) Handles NewPaymentButton.Click
        Dim PaymentID As Integer
        Dim tbl1 As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()
        tbl1.spAddNewPayment(PaymentID, OrdersListBox.SelectedValue, PaymentInput.Text, PaymentDateInput.Text, PaymentSourceDropDownList.SelectedValue, PaymentCheckPaypalNumberInput.Text, PaymentPaypalTransactionInput.Text)
        Response.Redirect("~/Tools")
    End Sub

End Class