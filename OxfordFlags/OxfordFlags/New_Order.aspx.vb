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

        Public Overrides Function ToString() As String
            Return String.Format("{0}, {1}", LastName, FirstName)
        End Function
    End Class

    <Serializable()> _
    Protected Class Sleeve
        Public Id As Integer
        Public LocationDescription As String
        Public Photo As Byte()
        Public Latitude As Double
        Public Longitude As Double
        Public InstallDate As Date
        Public ChangeDate As Date
        Public PublicSleeve As Boolean
        Public Deliver As Boolean

        Public Sub New(Id As Integer, LocationDescription As String, Photo As Byte(), _
                       Latitude As Double, Longitude As Double, InstallDate As Date, _
                       ChangeDate As Date, PublicSleeve As Boolean, Deliver As Boolean)
            Me.Id = Id
            Me.LocationDescription = LocationDescription
            Me.Photo = Photo
            Me.Latitude = Latitude
            Me.Longitude = Longitude
            Me.InstallDate = InstallDate
            Me.ChangeDate = ChangeDate
            Me.PublicSleeve = PublicSleeve
            Me.Deliver = Deliver
        End Sub

        Public Overrides Function ToString() As String
            Return String.Format("Sleeve")
        End Function
    End Class



    ' Database connection
    Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()

    ' Globals
    Dim OrderId As Integer
    Dim BuyerList As List(Of Buyer)
    Dim PropertyOwnerId As Integer
    Dim SleeveList As List(Of Sleeve)
    Dim OupsId As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
        If Me.IsPostBack Then
            BuyerList = CType(Me.ViewState("buyers"), List(Of Buyer))
            SleeveList = CType(Me.ViewState("sleeves"), List(Of Sleeve))
            TabName.Value = Request.Form(TabName.UniqueID)
        Else
            BuyerList = New List(Of Buyer)()
            Me.ViewState.Add("buyers", BuyerList)
            SleeveList = New List(Of Sleeve)()
            Me.ViewState.Add("sleeves", SleeveList)
        End If
    End Sub

    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles SubmitButton.Click

        HandleOrder()
        HandleBuyers()
        HandlePropertyOwner()
        HandlePropertyTraits()
        HandleOups()
        HandleSleeves()

        Response.Redirect("~/Main_Menu")

    End Sub

    ' <--------------------Order---------------------->

    Protected Sub HandleOrder()
        tbl.spAddNewOrder(OrderId, OrderDateInput.Text, OrderSourceDropDownList.SelectedValue, _
                          OrderSubscriptionYearInput.Text, OrderBasePriceInput.Text, _
                          OrderDiscountDropDownList.SelectedValue, "Online", OrderDateInput.Text, _
                          OrderFirstOccasionDropDownList.SelectedValue)
    End Sub

    ' <--------------------Buyer---------------------->

    Protected Sub HandleBuyers()
        For Each b As Buyer In BuyerList
            If b.Id = 0 Then
                tbl.spAddNewBuyer(b.Id, b.LastName, b.FirstName, b.Address, b.City, b.State, b.ZipCode, b.Email, b.Phone, "Online", b.RotaryMember)
            End If
        Next
    End Sub

    Protected Sub HandleAddBuyer(sender As Object, e As EventArgs) Handles BuyerAddButton.Click
        BuyerList.Add(New Buyer(BuyerDropDownList.SelectedValue, BuyerFirstNameInput.Text, _
                                 BuyerLastNameInput.Text, BuyerAddressInput.Text, BuyerCityInput.Text, _
                                 BuyerStateDropDownList.SelectedValue, BuyerZipCodeInput.Text, BuyerEmailInput.Text, _
                                 BuyerPhoneInput.Text, BuyerRotaryMemberInput.Checked))
        ViewState("buyers") = BuyerList
        ClearBuyerForm()
        SetListBoxes()
    End Sub

    Protected Sub HandleRemoveBuyer(sender As Object, e As EventArgs) Handles BuyerRemoveButton.Click
        BuyerList.RemoveAt(BuyerListBox.SelectedIndex)
        ViewState("buyers") = BuyerList
        SetListBoxes()
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

    Protected Sub FillBuyerListBox(list As List(Of Buyer))
        BuyerListBox.Items.Clear()
        For Each b As Buyer In list
            BuyerListBox.Items.Add(b.LastName)
        Next
    End Sub

    ' <--------------------Property Owner---------------------->

    Protected Sub HandlePropertyOwner()
        PropertyOwnerId = PropertyOwnerDropDownList.SelectedValue
        If PropertyOwnerId = 0 Then
            tbl.spAddNewPropertyOwner(PropertyOwnerId, PropertyOwnerLastNameInput.Text, PropertyOwnerFirstNameInput.Text, PropertyOwnerAddressInput.Text, PropertyOwnerCityInput.Text, PropertyOwnerStateDropDownList.SelectedValue, PropertyOwnerZipCodeInput.Text, PropertyOwnerEmailInput.Text, PropertyOwnerPhoneInput.Text, PropertyOwnerRotaryMemberInput.Checked)
        End If
    End Sub

    Protected Sub PropertyOwnerChange(sender As Object, e As EventArgs) Handles PropertyOwnerDropDownList.SelectedIndexChanged
        PropertyOwnerId = PropertyOwnerDropDownList.SelectedValue

        If Not PropertyOwnerId = 0 Then
            tbl.spSelectPropertyOwner(PropertyOwnerId, PropertyOwnerLastNameInput.Text, PropertyOwnerFirstNameInput.Text, PropertyOwnerAddressInput.Text, PropertyOwnerCityInput.Text, PropertyOwnerStateDropDownList.SelectedValue, PropertyOwnerZipCodeInput.Text, PropertyOwnerEmailInput.Text, PropertyOwnerPhoneInput.Text, PropertyOwnerRotaryMemberInput.Checked)
        Else
            ClearPropertyOwnerForm()
        End If
    End Sub

    Protected Sub ClearPropertyOwnerForm()
        PropertyOwnerDropDownList.SelectedValue = 0
        PropertyOwnerFirstNameInput.Text = ""
        PropertyOwnerLastNameInput.Text = ""
        PropertyOwnerAddressInput.Text = ""
        PropertyOwnerCityInput.Text = ""
        PropertyOwnerStateDropDownList.SelectedValue = "OH"
        PropertyOwnerZipCodeInput.Text = ""
        PropertyOwnerEmailInput.Text = ""
        PropertyOwnerPhoneInput.Text = ""
        PropertyOwnerRotaryMemberInput.Checked = False
    End Sub

    ' <--------------------Property Traits---------------------->

    Protected Sub HandlePropertyTraits()
        Dim PropertyTrait As Integer
        For Each box As ListItem In PropertyTraits.Items
            If box.Selected Then
                PropertyTrait = box.Value
                tbl.spAddNewPropertyTraits(PropertyOwnerId, PropertyTrait)
            End If
        Next
    End Sub

    ' <--------------------Sleeve---------------------->

    Protected Sub HandleSleeves()
        For Each s As Sleeve In SleeveList
            tbl.spAddNewSleeve(s.Id, True, OrderId, PropertyOwnerId, s.LocationDescription, s.Latitude, s.Longitude, OupsId, s.InstallDate, s.ChangeDate, s.PublicSleeve, s.Deliver, OrderDateInput.Text)
            If s.Photo.Length > 0 Then
                tbl.spAddNewPhoto(s.Id, s.Photo)
            End If
        Next
    End Sub

    Protected Sub HandleAddSleeve() Handles SleeveAddButton.Click
        Dim photo(0) As Byte
        If (SleevePhotoFileUpload.HasFile) Then
            photo = SleevePhotoFileUpload.FileBytes
        End If
        SleeveList.Add(New Sleeve(0, SleeveLocationDescriptionInput.Text, photo, _
                                  SleeveLatitudeInput.Text, SleeveLongitudeInput.Text, SleeveInstallDateInput.Text, _
                                  SleeveChangeDateInput.Text, SleevePublicCheckbox.Checked, SleeveDeliverCheckbox.Checked))
        ViewState("sleeves") = SleeveList
        ClearSleeveForm()
        SetListBoxes()
    End Sub

    Protected Sub HandleRemoveSleeve() Handles SleeveRemoveButton.Click
        SleeveList.RemoveAt(SleeveListBox.SelectedIndex)
        ViewState("sleeves") = SleeveList
        SetListBoxes()
    End Sub

    Protected Sub ClearSleeveForm()
        SleeveLocationDescriptionInput.Text = ""
        SleeveLatitudeInput.Text = ""
        SleeveLongitudeInput.Text = ""
        SleeveInstallDateInput.Text = ""
        SleeveChangeDateInput.Text = ""
        SleevePublicCheckbox.Checked = False
        SleeveDeliverCheckbox.Checked = True
        SleevePhotoFileUpload = New FileUpload()
    End Sub

    ' <--------------------Oups---------------------->

    Protected Sub HandleOups()
        tbl.spAddNewOups(OupsId, OupsTicketNumberInput.Text, OupsNotifiedDateInput.Text, OupsCheckedDateInput.Text)
    End Sub

    Protected Sub SetListBoxes()
        BuyerListBox.DataSource = BuyerList
        BuyerListBox.DataBind()
        SleeveListBox.DataSource = SleeveList
        SleeveListBox.DataBind()
    End Sub

End Class