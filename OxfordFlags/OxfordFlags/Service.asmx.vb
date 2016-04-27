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
    Public Function GetPerson(ByVal prefix As String) As String()
        Dim people As New List(Of String)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select FirstName, LastName, BuyerID from Buyer where " & "LastName like @SearchText + '%' OR FirstName like @SearchText + '%'"
                cmd.Parameters.AddWithValue("@SearchText", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Dim Key As String = sdr("FirstName") + " " + sdr("LastName")
                        people.Add(String.Format("{0}-{1}", Key, sdr("BuyerID")))
                    End While
                End Using
                conn.Close()
            End Using
            Return people.ToArray()
        End Using
    End Function

    <WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Function GetOups(ByVal prefix As String) As String()
        Dim tickets As New List(Of String)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select OupsTicketNumber, OupsID from Oups where " & "OupsTicketNumber like @SearchText + '%'"
                cmd.Parameters.AddWithValue("@SearchText", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        tickets.Add(String.Format("{0}-{1}", sdr("OupsTicketNumber"), sdr("OupsID")))
                    End While
                End Using
                conn.Close()
            End Using
            Return tickets.ToArray()
        End Using
    End Function

    <WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Function SearchByBuyer(ByVal name As String) As String()
        Dim buyers As New List(Of String)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandText = "spSearchByNameOrId"
                cmd.Parameters.AddWithValue("@NAME", name)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Dim Key As String = sdr("FirstName") + " " + sdr("LastName")
                        buyers.Add(String.Format("{0}-{1}", Key, sdr("BuyerID")))
                    End While
                End Using
                conn.Close()
            End Using
            Return buyers.ToArray()
        End Using
    End Function

    <WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Function SearchByAddress(ByVal address As String) As String()
        Dim addresses As New List(Of String)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandText = "spSearchByAddress"
                cmd.Parameters.AddWithValue("@ADDRESS", address)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        addresses.Add(String.Format("{0}-{1}", sdr("StreetAddress"), sdr("PropertyOwnerID")))
                    End While
                End Using
                conn.Close()
            End Using
            Return addresses.ToArray()
        End Using
    End Function

End Class