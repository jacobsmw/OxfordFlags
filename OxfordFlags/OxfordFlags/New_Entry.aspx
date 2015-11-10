<%@ Page Title="New Entry" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="New_Entry.aspx.vb" Inherits="OxfordFlags.New_Entry" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent" >  
    <h2><%: Title %></h2>
    <hr />

    <div class="row">
        <div class="col-md-8">


    <p>First Name <input id="Text6" type="text" /></p>
    <p>Last Name <input id="Text17" type="text" /></p>
    <p>Address <input id="Text5" type="text" /></p>
    <p>City <input id="Text4" type="text" /></p>
    <p>State <select id="Select1" name="D1">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <option>WV</option>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <option>OH</option>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%--Need to add all 50 states plus a select option
            we can then save this as a tool--%>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </select></p>
    <p>Zip Code <input id="Text3" type="text" /></p>
    <p>Email <input id="Text2" type="text" /></p>
    <p>Phone <input id="Text1" type="text" /></p>
    <p>
        Rotary Member
        <input id="Checkbox2" type="checkbox" /></p>
    <p>
        &nbsp;</p>
    <p>
        Payment Method
        <select id="Select2" name="D2">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <option></option>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </select></p>
    <p>
        Date
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
    </p>
    <p>
        Source
        <select id="Select6" name="D6">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <option></option>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </select></p>
    <p>
        Discount
        <select id="Select7" name="D7">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <option></option>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </select></p>
    <p>
        First Holiday
        <input id="Text7" type="text" /></p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p style="font-size: large; text-decoration: underline">
        <strong>Sleeve</strong></p>
    <p>
        Property Owner
        First Name
        <input id="Text16" type="text" /></p>
    <p>
        Property Owner Last Name <input id="Text18" type="text" /></p>
    <p>
        Address <input id="Text15" type="text" /></p>
    <p>
        City <input id="Text14" type="text" /></p>
    <p>
        State </p> <%--Put in State drop list--%>
    <p>
        Zip Code
        <input id="Text13" type="text" /></p>
    <p>
        Email <input id="Text12" type="text" /></p>
    <p>
        Phone <input id="Text11" type="text" /></p>
    <p>
        Rotary Member<input id="Checkbox1" type="checkbox" /></p>
    <p>
        Sprinkler
        <input id="Checkbox3" type="checkbox" /></p>
    <p>
        Fence
        <input id="Checkbox4" type="checkbox" /></p>
    <p>
        &nbsp;</p>
    <p>
        Location Description<input id="Text8" type="text" /></p>
    <p>
        Latitude
        <input id="Text9" type="text" /></p>
    <p>
        Longitude
        <input id="Text10" type="text" /></p>
    <p>
        OUPS Notified 
        <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
    </p> <%--put in date drop list--%>
    <p>
        OUPS Checked 
        <asp:Calendar ID="Calendar3" runat="server"></asp:Calendar>
    </p> <%--put in date drop list--%>
    </div>
    </div>
    </div>
</asp:Content>
