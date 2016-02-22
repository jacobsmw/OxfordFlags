Public Class OccasionMaintenance
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Protected Sub NewEntryButton_Click(sender As Object, e As EventArgs) Handles NewEntryButton.Click
        Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()

        Dim s As String
        s = OccasionName.Text

        tbl.spAddNewOccasion(s)
        Label1.Text = "Inserted new Occasion"
    End Sub
End Class