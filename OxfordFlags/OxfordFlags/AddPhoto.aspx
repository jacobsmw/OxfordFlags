<%@ Page Title="AddPhoto" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPhoto.aspx.vb" Inherits="OxfordFlags.AddPhoto" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <p>
                &nbsp;</p>
            <p>
                Address:
                <asp:TextBox ID="AddressInput" runat="server" CssClass="form-control" placeholder="123 Ohio Road" Width="200px"></asp:TextBox>
        &nbsp;<asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn btn-default" />
                <br />
                <asp:ListBox ID="SleevesListBox" runat="server" DataSourceID="SleeveNamesDataSource" DataTextField="SleeveName" DataValueField="SleeveID" Width="300px"></asp:ListBox>
                <asp:SqlDataSource ID="SleeveNamesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectSleevesByAddress" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="AddressInput" Name="Address" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        <asp:FileUpload ID="SleevePhotoFileUpload" runat="server" AllowMultiple="True" />
    </p>
    <p>
        <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-info" />
    </p>
</asp:Content>
