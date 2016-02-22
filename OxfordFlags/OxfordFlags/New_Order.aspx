<%@ Page Title="New Order" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="New_Order.aspx.vb" Inherits="OxfordFlags.New_Order" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#BuyerInfo">Buyer</a></li>
        <li><a data-toggle="tab" href="#OrderInfo">Order</a></li>
        <li><a data-toggle="tab" href="#PropertyOwnerInfo">Property Owner</a></li>
        <li><a data-toggle="tab" href="#SleeveInfo">Sleeve</a></li>
        <li><a data-toggle="tab" href="#PaymentInfo">Payment</a></li>
    </ul>

    <div class="tab-content">
        <h3><%: "Buyer"%></h3>
        <asp:UpdatePanel ID="BuyerUpdatePanel" runat="server">
            <ContentTemplate>
            <asp:Table ID="BuyerLayoutTable" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                    <asp:Label ID="BuyerLabel" runat="server" Text="Buyer"></asp:Label>
                    <asp:DropDownList ID="BuyerDropDownList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="BuyerList" DataTextField="Name" DataValueField="BuyerID">
                        <asp:ListItem Value="0">New</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="BuyerList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT BuyerID, CONCAT( LastName, ', ', FirstName) AS Name FROM [Buyer] WHERE ([Active] = '1')"></asp:SqlDataSource>
                    <p>
                        </p>
                    <p>
                        <asp:Label ID="BuyerFirstNameLabel" runat="server" Text="First Name"></asp:Label>
                        <asp:TextBox ID="BuyerFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="BuyerFirstNameEnteredValidator" runat="server"
                            ControlToValidate="BuyerFirstName"
                            ErrorMessage="First Name is a required field."
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="BuyerFirstNameFormatValidator" runat="server"
                            ControlToValidate="BuyerFirstName"
                            ErrorMessage="You must enter a valid first name."
                            ForeColor="Red"
                            ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
                        </asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <asp:Label ID="BuyerLastNameLabel" runat="server" Text="Last Name"></asp:Label>
                        <asp:TextBox ID="BuyerLastName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="BuyerLastNameEnteredValidator" runat="server"
                            ControlToValidate="BuyerLastName"
                            ErrorMessage="Last Name is a required field."
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="BuyerLastNameFormatValidator" runat="server"
                            ControlToValidate="BuyerLastName"
                            ErrorMessage="You must enter a valid last name."
                            ForeColor="Red"
                            ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
                        </asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <asp:Label ID="BuyerAddressLabel" runat="server" Text="Address"></asp:Label>
                        <asp:TextBox ID="BuyerAddress" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="BuyerAddressFormatValidator" runat="server"
                            ControlToValidate="BuyerAddress"
                            ErrorMessage="You must enter a valid address."
                            ForeColor="Red"
                            ValidationExpression="^[a-zA-Z0-9''-'\s]{0,50}$">
                        </asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <asp:Label ID="BuyerCityLabel" runat="server" Text="City"></asp:Label>
                        <asp:TextBox ID="BuyerCity" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="BuyerCityFormatValidator" runat="server"
                            ControlToValidate="BuyerCity"
                            ErrorMessage="You must enter a valid city."
                            ForeColor="Red"
                            ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
                        </asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <asp:Label ID="BuyerStateLabel" runat="server" Text="State"></asp:Label>
                        <asp:TextBox ID="BuyerState" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="BuyerStateFormatValidator" runat="server"
                            ControlToValidate="BuyerState"
                            ErrorMessage="You must enter a valid state abreviation"
                            ForeColor="Red"
                            ValidationExpression="[a-zA-Z]{2}">
                        </asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <asp:Label ID="BuyerZipCodeLabel" runat="server" Text="Zip Code"></asp:Label>
                        <asp:TextBox ID="BuyerZipCode" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="BuyerZipCodeFormatValidator" runat="server"
                            ControlToValidate="BuyerZipCode"
                            ErrorMessage="You must enter a valid zip code"
                            ForeColor="Red"
                            ValidationExpression="[0-9]{5}">
                        </asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <asp:Label ID="BuyerEmailLabel" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="BuyerEmail" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="BuyerEmailFormatValidator" runat="server"
                            ControlToValidate="BuyerEmail"
                            ErrorMessage="You must enter a valid email."
                            ForeColor="Red"
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                        </asp:RegularExpressionValidator>
                    </p>
                    <p>
                        <asp:Label ID="BuyerPhoneLabel" runat="server" Text="Phone"></asp:Label>
                        <asp:TextBox ID="BuyerPhone" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="BuyerPhoneFormatValidator" runat="server"
                            ControlToValidate="BuyerPhone"
                            ErrorMessage="You must enter a valid phone number"
                            ForeColor="Red"
                            ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$">
                        </asp:RegularExpressionValidator>
                    <p>
                        <asp:CheckBox ID="BuyerRotaryMember" runat="server" Text="Rotary Member" TextAlign="Left" />
                    </p>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="BuyerAddButton" runat="server" Text="Add" />
                        <br />
                        <asp:Button ID="BuyerRemoveButton" runat="server" Text="Remove" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:ListView runat="server" ID="BuyerListView"></asp:ListView>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <p>
            <asp:Button ID="SubmitButton" runat="server" Text="Submit" />
        </p>
    </div>
        
        <div id="OrderInfo" class="tab-pane fade">
            
        </div>
        
        <div id="PropertyOwnerInfo" class="tab-pane fade">
            
        </div>

        <div id="SleeveInfo" class="tab-pane fade">
            
        </div>

        <div id="PaymentInfo" class="tab-pane fade">
            
        </div>
    </div>


</asp:Content>
