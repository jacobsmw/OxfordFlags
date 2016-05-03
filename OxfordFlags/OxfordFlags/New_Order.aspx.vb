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
    Protected Class PropertyOwner
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
        Public Traits As List(Of Integer)

        Public Sub New(Id As Integer, FirstName As String, LastName As String, _
                          Address As String, City As String, State As String, _
                          ZipCode As String, Email As String, Phone As String, _
                          RotaryMember As Boolean, Traits As List(Of Integer))
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
            Me.Traits = Traits
        End Sub

        Public Overrides Function ToString() As String
            Return String.Format("{0}, {1}", LastName, FirstName)
        End Function
    End Class

    <Serializable()> _
    Protected Class Sleeve
        Public Id As Integer
        Public PropertyOwnerIndex As Integer
        Public LocationDescription As String
        Public Latitude As Double
        Public Longitude As Double
        Public InstallDate As Date
        Public ChangeDate As Date
        Public PublicSleeve As Boolean
        Public Deliver As Boolean

        Public Sub New(Id As Integer, PropertyOwnerIndex As Integer, LocationDescription As String, _
                       Latitude As Double, Longitude As Double, InstallDate As Date, _
                       ChangeDate As Date, PublicSleeve As Boolean, Deliver As Boolean)
            Me.Id = Id
            Me.PropertyOwnerIndex = PropertyOwnerIndex
            Me.LocationDescription = LocationDescription
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
    Dim PropertyOwnerList As List(Of PropertyOwner)
    Dim SleeveList As List(Of Sleeve)
    Dim OupsId As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
        If Me.IsPostBack Then
            BuyerList = CType(Me.ViewState("buyers"), List(Of Buyer))
            PropertyOwnerList = CType(Me.ViewState("propertyowners"), List(Of PropertyOwner))
            SleeveList = CType(Me.ViewState("sleeves"), List(Of Sleeve))
            TabName.Value = Request.Form(TabName.UniqueID)
        Else
            BuyerList = New List(Of Buyer)()
            Me.ViewState.Add("buyers", BuyerList)
            PropertyOwnerList = New List(Of PropertyOwner)()
            Me.ViewState.Add("propertyowners", PropertyOwnerList)
            SleeveList = New List(Of Sleeve)()
            Me.ViewState.Add("sleeves", SleeveList)
        End If
    End Sub

    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles SubmitButton.Click

        HandleOrder()
        HandlePayment()
        HandleBuyers()
        HandlePropertyOwners()
        HandleOups()
        HandleSleeves()

        Response.Redirect("~/Main_Menu")

    End Sub

    ' <--------------------Order---------------------->

    Protected Sub HandleOrder()
        tbl.spAddNewOrder(OrderId, OrderDateInput.Text, OrderSourceDropDownList.SelectedValue, _
                          OrderSubscriptionYearInput.Text, OrderCostInput.Text, _
                          OrderDiscountDropDownList.SelectedValue, OrderSourceDropDownList.SelectedValue, OrderDateInput.Text, _
                          OrderFirstOccasionDropDownList.SelectedValue)
    End Sub

    ' <--------------------Payment---------------------->

    Protected Sub HandlePayment()
        Dim PaymentID As Integer
        tbl.spAddNewPayment(PaymentID, OrderId, OrderAmountPaidInput.Text, OrderDateInput.Text, OrderPaymentSourceDropDownList.SelectedValue, OrderPaymentMemoInput.Text)
    End Sub

    ' <--------------------Buyer---------------------->

    Protected Sub HandleBuyers()
        For Each b As Buyer In BuyerList
            If b.Id = 0 Then
                tbl.spAddNewBuyer(b.Id, b.LastName, b.FirstName, b.Address, b.City, b.State, b.ZipCode, b.Email, b.Phone, "Online", b.RotaryMember)
            End If
            tbl.spAddNewBuyerOrder(b.Id, OrderId)
        Next
    End Sub

    Protected Sub HandleAddBuyer(sender As Object, e As EventArgs) Handles BuyerAddButton.Click
        BuyerList.Add(New Buyer(BuyerDropDownList.SelectedValue, BuyerFirstNameInput.Text, _
                                 BuyerLastNameInput.Text, BuyerAddressInput.Text, BuyerCityInput.Text, _
                                 BuyerStateDropDownList.SelectedValue, BuyerZipCodeInput.Text, BuyerEmailInput.Text, _
                                 BuyerPhoneInput.Text, BuyerRotaryMemberInput.Checked))
        ViewState("buyers") = BuyerList
        ClearBuyerForm()
        BindBuyerListData()
    End Sub

    Protected Sub HandleRemoveBuyer(sender As Object, e As EventArgs) Handles BuyerRemoveButton.Click
        BuyerList.RemoveAt(BuyerListBox.SelectedIndex)
        ViewState("buyers") = BuyerList
        BindBuyerListData()
    End Sub

    Protected Sub BindBuyerListData()
        BuyerListBox.DataSource = BuyerList
        BuyerListBox.DataBind()
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

    ' <--------------------Property Owner---------------------->

    Protected Sub HandlePropertyOwners()
        For Each p As PropertyOwner In PropertyOwnerList
            If p.Id = 0 Then
                tbl.spAddNewPropertyOwner(p.Id, p.LastName, p.FirstName, p.Address, p.City, p.State, p.ZipCode, p.Email, p.Phone, p.RotaryMember)
            End If
            For Each item As Integer In p.Traits
                tbl.spAddNewPropertyTraits(p.Id, item)
            Next
        Next
    End Sub

    Protected Sub PropertyOwnerChange(sender As Object, e As EventArgs) Handles PropertyOwnerDropDownList.SelectedIndexChanged
        Dim PropertyOwnerId = PropertyOwnerDropDownList.SelectedValue

        If Not PropertyOwnerId = 0 Then
            tbl.spSelectPropertyOwner(PropertyOwnerId, PropertyOwnerLastNameInput.Text, PropertyOwnerFirstNameInput.Text, PropertyOwnerAddressInput.Text, PropertyOwnerCityInput.Text, PropertyOwnerStateDropDownList.SelectedValue, PropertyOwnerZipCodeInput.Text, PropertyOwnerEmailInput.Text, PropertyOwnerPhoneInput.Text, PropertyOwnerRotaryMemberInput.Checked)
        Else
            ClearPropertyOwnerForm()
        End If
    End Sub

    Protected Sub HandleAddPropertyOwner(sender As Object, e As EventArgs) Handles PropertyOwnerAddButton.Click
        Dim PropertyTraitList As New List(Of Integer)
        For Each box As ListItem In PropertyTraits.Items
            If box.Selected Then
                PropertyTraitList.Add(box.Value)
            End If
        Next
        PropertyOwnerList.Add(New PropertyOwner(PropertyOwnerDropDownList.SelectedValue, PropertyOwnerFirstNameInput.Text, _
                                 PropertyOwnerLastNameInput.Text, PropertyOwnerAddressInput.Text, PropertyOwnerCityInput.Text, _
                                 PropertyOwnerStateDropDownList.SelectedValue, PropertyOwnerZipCodeInput.Text, PropertyOwnerEmailInput.Text, _
                                 PropertyOwnerPhoneInput.Text, PropertyOwnerRotaryMemberInput.Checked, PropertyTraitList))
        ViewState("propertyowners") = PropertyOwnerList
        ClearPropertyOwnerForm()
        BindPropertyOwnerListData()
    End Sub

    Protected Sub HandleRemovePropertyOwner(sender As Object, e As EventArgs) Handles PropertyOwnerRemoveButton.Click
        PropertyOwnerList.RemoveAt(PropertyOwnerListBox.SelectedIndex)
        ViewState("propertyowners") = PropertyOwnerList
        BindPropertyOwnerListData()
    End Sub

    Protected Sub BindPropertyOwnerListData()
        PropertyOwnerListBox.DataSource = PropertyOwnerList
        PropertyOwnerListBox.DataBind()
        SleevePropertyDropDownList.DataSource = PropertyOwnerList
        SleevePropertyDropDownList.DataBind()
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

    ' <--------------------Sleeve---------------------->

    Protected Sub HandleSleeves()
        For Each s As Sleeve In SleeveList
            Dim PropertyOwnerId = PropertyOwnerList(s.PropertyOwnerIndex).Id
            Dim SleeveName As String = "Failed"
            Dim nameTbl As dsTableAdapters.spGetNextSleeveNameTableAdapter = New dsTableAdapters.spGetNextSleeveNameTableAdapter()
            For Each Name As DataRow In nameTbl.GetData(PropertyOwnerId)
                SleeveName = Name.Field(Of String)("Name")
            Next
            tbl.spAddNewSleeve(s.Id, True, OrderId, PropertyOwnerId, s.LocationDescription, s.Latitude, s.Longitude, OupsId, s.InstallDate, s.ChangeDate, s.PublicSleeve, s.Deliver, OrderDateInput.Text, SleeveName)
        Next
    End Sub

    Protected Sub HandleAddSleeve() Handles SleeveAddButton.Click
        SleeveList.Add(New Sleeve(0, SleevePropertyDropDownList.SelectedIndex, SleeveLocationDescriptionInput.Text, _
                                  SleeveLatitudeInput.Text, SleeveLongitudeInput.Text, SleeveInstallDateInput.Text, _
                                  SleeveChangeDateInput.Text, SleevePublicCheckbox.Checked, SleeveDeliverCheckbox.Checked))
        ViewState("sleeves") = SleeveList
        ClearSleeveForm()
        BindSleeveListData()
    End Sub

    Protected Sub HandleRemoveSleeve() Handles SleeveRemoveButton.Click
        SleeveList.RemoveAt(SleeveListBox.SelectedIndex)
        ViewState("sleeves") = SleeveList
        BindSleeveListData()
    End Sub

    Protected Sub BindSleeveListData()
        SleeveListBox.DataSource = SleeveList
        SleeveListBox.DataBind()
    End Sub

    Protected Sub ClearSleeveForm()
        SleeveLocationDescriptionInput.Text = ""
        SleeveLatitudeInput.Text = ""
        SleeveLongitudeInput.Text = ""
        SleeveInstallDateInput.Text = ""
        SleeveChangeDateInput.Text = ""
        SleevePublicCheckbox.Checked = False
        SleeveDeliverCheckbox.Checked = True
    End Sub

    ' <--------------------Oups---------------------->

    Protected Sub HandleOups()
        tbl.spAddNewOups(OupsId, OupsTicketNumberInput.Text, OupsNotifiedDateInput.Text, OupsCheckedDateInput.Text)
    End Sub

    Protected Sub OrderSourceDropDownList_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub
End Class