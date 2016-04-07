<%@ Page Title="Search" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.vb" Inherits="OxfordFlags.Search" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    
    <html>
        <head>
            <meta name="viewport" content="width=device-width" />
            <title>Bootstrap Typeahead</title>
            <script src="http://twitter.github.io/typeahead.js/releases/latest/typeahead.js"></script>
            <link href="http://twitter.github.io/typeahead.js/css/examples.css" rel="stylesheet" />
        </head>
        <body>
            <div>
                <div id="details"></div>
                <input type="text" id="Search" data-provide="typeahead" placeholder="Client Name" autocomplete="off" />
            </div>
            <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
            <script src="@Url.Content('~/Scripts/bootstrap.min.js')"></script>
            <script src="@Url.Content('~/Scripts/typeahead.js')"></script>
        </body> 
    </html>

    <script type="text/javascript">

      $('input#Search').typeahead({
           name: 'name',
          local: ['yasser', 'shyam', 'sujesh', 'siddhesh', 'vaibhav']
     });
    </script>
</asp:Content>

