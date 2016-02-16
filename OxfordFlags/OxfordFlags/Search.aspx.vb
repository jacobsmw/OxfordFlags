Public Class Search
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub


    Protected Sub SearchButton_Click(sender As Object, e As EventArgs) Handles SearchButton.Click
        'Dim tbl As dsTableAdapters.spSearchNameTableAdapter = New dsTableAdapters.spSearchNameTableAdapter()

        Dim search As String
        search = SearchName.Text

        ''Dim sb As New StringBuilder

        ''For Each r As ds.spSearchNameRow In tbl.GetData(search)
        ''    sb.Append(r.FirstName & " " & r.LastName)
        ''Next

        Label1.Text = "It Worked"
    End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting

    End Sub

    Protected Sub Search(sender As Object, e As EventArgs) Handles SearchButton.Click

    End Sub

    Protected Sub DataList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DataList1.SelectedIndexChanged

    End Sub
End Class
