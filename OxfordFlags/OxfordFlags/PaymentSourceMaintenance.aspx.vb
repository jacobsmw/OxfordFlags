Public Class PaymentSourceMaintenance
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub NewEntryButton_Click(sender As Object, e As EventArgs) Handles NewEntryButton.Click
        Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()

        Dim s As String
        s = SourceName.Text

        tbl.spAddNewPaymentSource(s)
        Label1.Text = "Inserted New Source"
    End Sub
End Class