Imports System.IO

Public Class New_Order

    Inherits System.Web.UI.Page

    <Serializable()> _
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
    Dim BuyerList As List(Of Buyer)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
        If Me.IsPostBack Then
            BuyerList = CType(Me.ViewState("buyers"), List(Of Buyer))
            TabName.Value = Request.Form(TabName.UniqueID)
        Else
            BuyerList = New List(Of Buyer)()
            Me.ViewState.Add("buyers", BuyerList)
        End If
    End Sub

    Protected Sub HandleAddBuyer(sender As Object, e As EventArgs) Handles BuyerAddButton.Click
        BuyerList.Add(New Buyer(BuyerDropDownList.SelectedValue, BuyerFirstNameInput.Text, _
                                 BuyerLastNameInput.Text, BuyerAddressInput.Text, BuyerCityInput.Text, _
                                 BuyerStateDropDownList.SelectedValue, BuyerZipCodeInput.Text, BuyerEmailInput.Text, _
                                 BuyerPhoneInput.Text, BuyerRotaryMemberInput.Checked))
        ViewState("buyers") = BuyerList
        FillListBox(BuyerList)
    End Sub

    Protected Sub HandleRemoveBuyer(sender As Object, e As EventArgs) Handles BuyerRemoveButton.Click
        For Each b As Buyer In BuyerList
            If b.LastName = BuyerListBox.SelectedItem.Text Then
                BuyerList.Remove(b)
                ViewState("buyers") = BuyerList
                FillListBox(BuyerList)
            End If
        Next
    End Sub

    Protected Sub HandleBuyers(sender As Object, e As EventArgs) Handles SubmitButton.Click
        For Each b As Buyer In BuyerList
            If b.Id = 0 Then
                tbl.spAddNewBuyer(b.Id, b.LastName, b.FirstName, b.Address, b.City, b.State, b.ZipCode, b.Email, b.Phone, "Online", b.RotaryMember)
            End If
        Next
    End Sub

    Protected Sub BuyerChange(sender As Object, e As EventArgs) Handles BuyerDropDownList.SelectedIndexChanged
        Dim BuyerId = BuyerDropDownList.SelectedValue

        If Not BuyerId = 0 Then
            tbl.spSelectBuyer(BuyerId, BuyerLastNameInput.Text, BuyerFirstNameInput.Text, BuyerAddressInput.Text, BuyerCityInput.Text, BuyerStateDropDownList.SelectedValue, BuyerZipCodeInput.Text, BuyerEmailInput.Text, BuyerPhoneInput.Text, "Online", BuyerRotaryMemberInput.Checked)
        Else
            ClearBuyerForm()
        End If
    End Sub

    Protected Sub ClearBuyerForm()
        BuyerDropDownList.SelectedValue = 0
        BuyerFirstNameInput.Text = ""
        BuyerLastNameInput.Text = ""
        BuyerAddressInput.Text = ""
        BuyerCityInput.Text = ""
        BuyerStateDropDownList.SelectedValue = "OH"
        BuyerZipCodeInput.Text = ""
        BuyerEmailInput.Text = ""
        BuyerPhoneInput.Text = ""
        BuyerRotaryMemberInput.Checked = False
    End Sub

    Protected Sub FillListBox(list As List(Of Buyer))
        BuyerListBox.Items.Clear()
        For Each b As Buyer In list
            BuyerListBox.Items.Add(b.LastName)
        Next
    End Sub

End Class