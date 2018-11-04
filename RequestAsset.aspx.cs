using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["Themes"];
        if (cookie == null)
        {
            Page.Theme = "Day";
        }
        else
        {
            Page.Theme = cookie["Theme"];
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=Assets;Integrated Security=True;Pooling=False";
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = con;
                cmd.CommandText = "SELECT * FROM Assets";
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        ListItem newItem = new ListItem();
                        newItem.Text = reader["ProductName"].ToString();
                        int total, allocated;
                        int.TryParse(reader["Total"].ToString(), out total);
                        int.TryParse(reader["Allocated"].ToString(), out allocated);
                        newItem.Value = (total - allocated).ToString();
                        DropDownList2.Items.Add(newItem);
                    }
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int req, available;
        bool check = int.TryParse(TextBox1.Text, out req);
        int.TryParse(DropDownList2.SelectedItem.Value, out available);
        if (check)
        {
            if (available >= req)
            {
                using (SqlConnection con = new SqlConnection())
                {
                    con.ConnectionString = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=Assets;Integrated Security=True;Pooling=False";
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = con;
                        cmd.CommandText = "INSERT INTO UserRequests (UserID, AssetID, QuantityRequested, Status) VALUES (@u, @a, @q, @s)";
                        cmd.Parameters.AddWithValue("@u", 2);
                        cmd.Parameters.AddWithValue("@a", 1);
                        cmd.Parameters.AddWithValue("@q", req);
                        cmd.Parameters.AddWithValue("@s", "Pending");
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                Label2.Text = "Request Submitted Succesfully!";
            }
            else
                Label2.Text = "Requested quantity exceeds available quantity. Please check the availability from the table above.";
   
        }
        else
            Label2.Text = "Please specify a valid integer.";
    }
}