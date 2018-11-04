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
    protected void Button1_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=Assets;Integrated Security=True;Pooling=False";
            using (SqlCommand com = new SqlCommand())
            {
                com.Connection = con;
                com.CommandText = "INSERT INTO Admins(AdminName, Password) VALUES (@u, @p)";
                com.Parameters.AddWithValue("@u", Username.Text);
                com.Parameters.AddWithValue("@p", Password.Text);
                con.Open();
                com.ExecuteNonQuery();
                com.CommandText = "SELECT * FROM Admins WHERE AdminName=@u";
                using (SqlDataReader reader = com.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        Label1.Text = "Your Admin ID is: " + reader["ID"] + ". Please remember this User ID for future use.";
                    }
                }
            }
        }
    }
}