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
                    cmd.Parameters.AddWithValue("@asset", row.Cells[1].Text);
                    con.Open();
                    Label1.Text = "Hello <br/>";
                    Label1.Text += row.Cells[0].Text;
                    Label1.Text += "<br/>" + row.Cells[1].Text + "<br />";
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Label1.Text += "<br/>" + reader.HasRows.ToString() + " " + reader.FieldCount.ToString();
                            int.TryParse(reader["QuantityRequested"].ToString(), out quantity_requested);
                            Label1.Text = quantity_requested.ToString();
                        }
                    }


                    cmd.CommandText = "UPDATE UserRequests SET Status=@decision WHERE (UserID=@user AND AssetID=@asset)";
                    cmd.Parameters.AddWithValue("@decision", "Accepted");
                    cmd.ExecuteNonQuery();

                    
                    
                    cmd.CommandText = "UPDATE Assets SET Allocated = Allocated+@quant WHERE AssetID=@asset";
                    cmd.Parameters.AddWithValue("@quant", quantity_requested);
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
        row.Cells[3].Text = "REJECTED";
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
                    cmd.Parameters.AddWithValue("@asset", row.Cells[1].Text);
                    con.Open();
                    Label1.Text = "Hello <br/>";
                    Label1.Text += row.Cells[0].Text;
                    Label1.Text += "<br/>" + row.Cells[1].Text + "<br />";
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Label1.Text += "<br/>" + reader.HasRows.ToString() + " " + reader.FieldCount.ToString();
                            int.TryParse(reader["QuantityRequested"].ToString(), out quantity_requested);
                            Label1.Text = quantity_requested.ToString();
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