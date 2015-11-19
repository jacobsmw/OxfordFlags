Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Public Class New_Occasion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles SubmitButton.Click

        Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()

        Dim s As String
        s = OccasionName.Text

        tbl.spAddNewOccasion(s)
        Label1.Text = "Inserted new Occasion"

    End Sub

End Class