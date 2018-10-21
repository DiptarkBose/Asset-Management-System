using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void Accept_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        row.Cells[3].Text = "ACCEPTED";
        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=AssetManager;Integrated Security=True;Pooling=False";
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = con;
                cmd.CommandText = "UPDATE UserRequests SET Status=@decision WHERE (UserID=@user AND AssetID=@asset)";
                cmd.Parameters.AddWithValue("@decision", "Accepted");
                cmd.Parameters.AddWithValue("@user", row.Cells[0].Text);
                cmd.Parameters.AddWithValue("@asset", row.Cells[1].Text);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }

    protected void Reject_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        row.Cells[3].Text = "REJECTED";
        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=AssetManager;Integrated Security=True;Pooling=False";
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = con;
                cmd.CommandText = "UPDATE UserRequests SET Status=@decision WHERE (UserID=@user AND AssetID=@asset)";
                cmd.Parameters.AddWithValue("@decision", "Rejected");
                cmd.Parameters.AddWithValue("@user", row.Cells[0].Text);
                cmd.Parameters.AddWithValue("@asset", row.Cells[1].Text);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}