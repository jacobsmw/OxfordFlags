Public Class DiscountMaintenance
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()

        Dim desc As String
        desc = DiscountDescription.Text

        Dim amount As Double
        Double.TryParse(DiscountAmount.Text, amount)

        Dim active As Boolean
        active = DiscountActive.Checked

        tbl.spAddNewDiscount(desc, amount, active)
        Label1.Text = "Inserted new Discount"
    End Sub
End Class