using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
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
        StringBuilder sb = new StringBuilder();
        int ctr = 0;
        sb.Append("Due Dates to return the following products are close:");
        sb.Append("\\n");
        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=Assets;Integrated Security=True;Pooling=False";
            using (SqlCommand com = new SqlCommand())
            {
                com.Connection = con;
                com.CommandText = "SELECT * FROM UserStatus, Assets WHERE UserID=@userID AND UserStatus.AssetID=Assets.AssetID";
                com.Parameters.AddWithValue("userID", Session["UserID"].ToString());
                con.Open();
                using (SqlDataReader reader = com.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        DateTime returnDate = (DateTime)reader["ReturnDate"];
                        DateTime currentDate = DateTime.Today;
                        TimeSpan difference = currentDate - returnDate;
                        if (difference.TotalDays >= 0)
                        {
                            sb.Append(reader["ProductName"]);
                            sb.Append("\\n");
                            ctr++;
                        }
                    }
                }
            }
        }
        if (ctr > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + sb.ToString() + "');", true);
        }
    }
}