Imports System.IO

Public Class New_Order

    Inherits System.Web.UI.Page

    Protected Class Buyer
        Public Id As Integer
        Public FirstName As String
        Public LastName As String
        Public Address As String
        Public City As String
        Public State As String
        Public ZipCode As String
        Public Email As String
        Public Phone As String
        Public RotaryMember As Boolean

        Public Sub New(Id As Integer, FirstName As String, LastName As String, _
                          Address As String, City As String, State As String, _
                          ZipCode As String, Email As String, Phone As String, _
                          RotaryMember As Boolean)
            Me.Id = Id
            Me.FirstName = FirstName
            Me.LastName = LastName
            Me.Address = Address
            Me.City = City
            Me.State = State
            Me.ZipCode = ZipCode
            Me.Email = Email
            Me.Phone = Phone
            Me.RotaryMember = RotaryMember
        End Sub
    End Class

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
    Dim vBuyerList As New List(Of Buyer)()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub HandleAddBuyer(sender As Object, e As EventArgs) Handles BuyerAddButton.Click
        vBuyerList.Add(New Buyer(BuyerDropDownList.SelectedValue, BuyerFirstName.Text, _
                                 BuyerLastName.Text, BuyerAddress.Text, BuyerCity.Text, _
                                 BuyerState.Text, BuyerZipCode.Text, BuyerEmail.Text, _
                                 BuyerPhone.Text, BuyerRotaryMember.Checked))
    End Sub

    Protected Sub HandleBuyers(sender As Object, e As EventArgs) Handles SubmitButton.Click
        For Each b As Buyer In vBuyerList
            If b.Id = 0 Then
                tbl.spAddNewBuyer(b.Id, b.LastName, b.FirstName, b.Address, b.City, b.State, b.ZipCode, b.Email, b.Phone, "Online", b.RotaryMember)
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
            ClearBuyerForm()
        End If
    End Sub

    Protected Sub ClearBuyerForm()
        BuyerDropDownList.SelectedValue = 0
        BuyerFirstName.Text = ""
        BuyerLastName.Text = ""
        BuyerAddress.Text = ""
        BuyerCity.Text = ""
        BuyerState.Text = ""
        BuyerZipCode.Text = ""
        BuyerEmail.Text = ""
        BuyerPhone.Text = ""
        BuyerRotaryMember.Checked = False
    End Sub

End Class