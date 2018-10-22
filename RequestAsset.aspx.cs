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
        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=AssetManager;Integrated Security=True;Pooling=False";
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
        if(check)
        {
            if (available >= req)
                Label2.Text = "Request Submitted Succesfully!";
            else
                Label2.Text = "Requested quantity exceeds available quantity. Please check the availability from the table above.";
        }
    }
}