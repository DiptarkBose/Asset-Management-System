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
        try
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=Assets;Integrated Security=True;Pooling=False";
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    int quantity_requested = 0;

                    cmd.CommandText = "SELECT * FROM UserRequests WHERE UserID=@user AND AssetID=@asset";
                    cmd.Parameters.AddWithValue("@user", row.Cells[0].Text);
                    cmd.Parameters.AddWithValue("@asset", row.Cells[2].Text);
                    con.Open();
                    
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            int.TryParse(reader["QuantityRequested"].ToString(), out quantity_requested);
                        }
                    }


                    cmd.CommandText = "UPDATE UserRequests SET Status=@decision WHERE (UserID=@user AND AssetID=@asset)";
                    cmd.Parameters.AddWithValue("@decision", "Accepted");
                    cmd.ExecuteNonQuery();

                    
                    
                    cmd.CommandText = "UPDATE Assets SET Allocated = Allocated+@quant WHERE AssetID=@asset";
                    cmd.Parameters.AddWithValue("@quant", quantity_requested);
                    cmd.ExecuteNonQuery();

                    cmd.CommandText = "INSERT INTO UserStatus (UserID, AssetID, CurrentDate, ReturnDate) VALUES (@user, @asset, @curr, @ret)";
                    cmd.Parameters.AddWithValue("@curr", DateTime.Now);
                    cmd.Parameters.AddWithValue("@ret", DateTime.Now.AddYears(2));
                    cmd.ExecuteNonQuery();

                    Response.Redirect("PendingRequests.aspx");
                }
            }
        }
        catch(Exception err)
        {
            Label1.Text += err.Message;
        }
    }

    protected void Reject_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        try
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=Assets;Integrated Security=True;Pooling=False";
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    int quantity_requested = 0;

                    cmd.CommandText = "SELECT * FROM UserRequests WHERE UserID=@user AND AssetID=@asset";
                    cmd.Parameters.AddWithValue("@user", row.Cells[0].Text);
                    cmd.Parameters.AddWithValue("@asset", row.Cells[2].Text);
                    con.Open();
 
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            int.TryParse(reader["QuantityRequested"].ToString(), out quantity_requested);
                        }
                    }


                    cmd.CommandText = "UPDATE UserRequests SET Status=@decision WHERE (UserID=@user AND AssetID=@asset)";
                    cmd.Parameters.AddWithValue("@decision", "Rejected");
                    cmd.ExecuteNonQuery();
                    
                    Response.Redirect("PendingRequests.aspx");
                }
            }
        }
        catch (Exception err)
        {
            Label1.Text += err.Message;
        }
    }
}