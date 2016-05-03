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
<<<<<<< Updated upstream
        Label1.Text = "Inserted new Discount"
        Response.Redirect("~/Admin")
=======

>>>>>>> Stashed changes
    End Sub

    Protected Sub NewEntryButton_Click(sender As Object, e As EventArgs) Handles NewEntryButton.Click
        Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()

        Dim d As String
        d = DiscountDescription.Text

        Dim a As Double
        a = DiscountAmount.Text

        Dim c As Boolean
        c = DiscountActive.Checked

        tbl.spAddNewDiscount(d, a, c)
        Label1.Text = "Inserted New Discount"
    End Sub

End Class