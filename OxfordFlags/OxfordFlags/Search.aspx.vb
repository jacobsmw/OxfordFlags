Public Class Search
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles SubmitButton.Click



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
End Class