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

    //Dictionary<string, int> dict;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //dict = new Dictionary<string, int>();
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
                            //newItem.Value = (total - allocated).ToString();
                            newItem.Value = reader["AssetID"].ToString();
                            DropDownList2.Items.Add(newItem);
                        }
                    }
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       // DummyLabel.Text = DropDownList2.SelectedItem.ToString();
        
        int req, available=0, total, allocated;
        bool check = int.TryParse(TextBox1.Text, out req);
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
                        if (reader["ProductName"].ToString() == DropDownList2.SelectedItem.Text)
                        {
                            int.TryParse(reader["Total"].ToString(), out total);
                            int.TryParse(reader["Allocated"].ToString(), out allocated);
                            available = total - allocated;
                        }
                    }
                }
            }
        }
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
                        cmd.CommandText = "SELECT * FROM UserRequests";
                        con.Open();
                        using(SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader["AssetID"].ToString() == DropDownList2.SelectedValue)
                                {
                                    Label2.Text = "You have already requested for this product!";
                                }
                            }
                        }

                        cmd.CommandText = "INSERT INTO UserRequests (UserID, AssetID, QuantityRequested, Status) VALUES (@u, @a, @q, @s)";
                        cmd.Parameters.AddWithValue("@u", Session["UserID"].ToString());
                        //cmd.Parameters.AddWithValue("@u", 5);
                        cmd.Parameters.AddWithValue("@a", DropDownList2.SelectedValue);
                        cmd.Parameters.AddWithValue("@q", req);
                        cmd.Parameters.AddWithValue("@s", "Pending");
                        
                        cmd.ExecuteNonQuery();
                    }
                }
                Label2.Text = "Request Submitted Succesfully!";
                TextBox1.Text = "";
                DropDownList2.SelectedIndex = -1;
            }
            else
                Label2.Text = "Requested quantity exceeds available quantity. Please check the availability from the table above.";
   
        }
        else
            Label2.Text += "Please specify a valid integer.";
    }
}