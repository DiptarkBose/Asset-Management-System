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
                cmd.CommandText = "SELECT * FROM Assets WHERE AssetID=@asset";
                cmd.Parameters.AddWithValue("@asset", Request.QueryString["AssetID"]);

                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if(reader.Read())
                    {
                        Label1.Text = reader["Description"].ToString();
                    }
                }
            }
        }
    }
}