﻿Public Class New_Discount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles SubmitButton.Click

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