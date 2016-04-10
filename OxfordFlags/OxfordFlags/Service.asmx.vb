Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.ComponentModel

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _

' WHat are these next 4 lines?
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
<ScriptService()> _
<ToolboxItem(False)> _
Public Class Service
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Function GetCustomers(ByVal prefix As String) As String()
        Dim customers As New List(Of String)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select FirstName, LastName, BuyerID from Buyer where " & "LastName like @SearchText + '%' OR FirstName like @SearchText + '%'"
                cmd.Parameters.AddWithValue("@SearchText", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        customers.Add(String.Format("{0}-{1}", sdr("FirstName"), sdr("BuyerID")))
                    End While
                End Using
                conn.Close()
            End Using
            Return customers.ToArray()
        End Using
    End Function

End Class