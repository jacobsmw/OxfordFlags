using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration

Partial Public Class New_Entry

    Inherits System.Web.UI.Page


     SqlConnection con= new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        con.Open();


    End Sub

    Protected Sub PaymentSource_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles PaymentSource.Selecting

    End Sub

    Protected Sub CheckBox3_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox3.CheckedChanged

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
            SqlCommand cmd = New SqlCommand("insert into Buyer values('"+BuyerFirstName.Text+"','"+BuyerLastName.Text +"', '"+ BuyerAddress.Text+"'), con);
            cmd.ExecuteNoneQuery();
            con.Close();
            Label1.Visible=true;
            Label1.Text="SAVED";

    End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting

    End Sub



    Protected Sub BuyerFirstName_TextChanged(sender As Object, e As EventArgs) Handles BuyerFirstName.TextChanged

    End Sub
End Class