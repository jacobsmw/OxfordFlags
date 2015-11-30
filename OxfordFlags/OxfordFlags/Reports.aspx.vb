Public Class Reports
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub DeliveryReportButton_Click(sender As Object, e As EventArgs) Handles DeliveryReportButton.Click

    End Sub

    Protected Sub CustomerReportButton_Click(sender As Object, e As EventArgs) Handles CustomerReportButton.Click

    End Sub

    Protected Sub PaymentReportButton_Click(sender As Object, e As EventArgs) Handles PaymentReportButton.Click

    End Sub

    Protected Sub SleeveReportButton_Click(sender As Object, e As EventArgs) Handles SleeveReportButton.Click

    End Sub

    Protected Sub GPSDataButton_Click(sender As Object, e As EventArgs) Handles GPSDataButton.Click

    End Sub

    Protected Sub EmailListDataButton_Click(sender As Object, e As EventArgs) Handles EmailListDataButton.Click

    End Sub

    Protected Sub MailingListButton_Click(sender As Object, e As EventArgs) Handles MailingListButton.Click

    End Sub
End Class