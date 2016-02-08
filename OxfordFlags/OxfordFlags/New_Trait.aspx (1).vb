﻿Public Class New_Trait
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles SubmitButton.Click

        Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()

        Dim desc As String
        desc = TraitDescription.Text

        tbl.spAddNewTrait(desc)
        Label1.Text = "Inserted new Trait"

        Response.Redirect("~/Main_Menu")

    End Sub

End Class