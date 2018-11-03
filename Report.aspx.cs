using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_DataBound(object sender, GridViewRowEventArgs e)
    {
        string s1 = "";
        string s2 = "";
        int ctr = 1;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AssetManagerConnectionString"].ConnectionString);
            con.Open();
            string productname = (string)DataBinder.Eval(e.Row.DataItem, "ProductName");

            SqlCommand cmd = new SqlCommand("SELECT * FROM Assets, UserStatus, Users WHERE Assets.AssetID=UserStatus.AssetID AND UserStatus.UserID=Users.UserID AND ProductName=@product", con);
            cmd.Parameters.AddWithValue("product", productname);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                int total, allocated;
                int.TryParse(reader[2].ToString(), out total);
                int.TryParse(reader[3].ToString(), out allocated);

                s1 += ctr.ToString() + ". Total: " + total.ToString() + "<br> Allocated: " + allocated.ToString() + "<br> Remaining: " + 
                    (total - allocated) + "<br><br>";
                s2 += ctr.ToString() + ". Name: " + reader[10].ToString() + "<br> Issue Date: " + reader[7].ToString() + "<br> Return Date: " + reader[8].ToString() + "<br><br>";
                ctr++;
            }
            Label l = (Label)e.Row.Cells[1].FindControl("StatusLabel");
            l.Text = s1;

            l = (Label)e.Row.Cells[1].FindControl("UserStatus");
            l.Text = s2;
        }
    }

    protected void GridView2_DataBound(object sender, GridViewRowEventArgs e)
    {
        string s1 = "";
        int ctr = 1;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AssetManagerConnectionString"].ConnectionString);
            con.Open();
            string userName = (string)DataBinder.Eval(e.Row.DataItem, "Username");

            SqlCommand cmd = new SqlCommand("SELECT * FROM UserRequests, Assets, Users WHERE Status='Pending' AND UserRequests.AssetID=Assets.AssetID AND Users.UserID=UserRequests.UserID AND Username=@user", con);
            cmd.Parameters.AddWithValue("user", userName);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //string productName;
                int total, allocated, remaining;
                int.TryParse(reader[6].ToString(), out total);
                int.TryParse(reader[7].ToString(), out allocated);
                remaining = total - allocated;
                s1 += ctr.ToString() + ". Product Name: " + reader[5].ToString() + "<br> Quantity Requested: " + reader[2].ToString() +
                    "<br> Remaining: " + (total - allocated) + "<br><br>";
                ctr++;
            }
            Label l = (Label)e.Row.Cells[1].FindControl("QuantityLabel");
            l.Text = s1;
        }
    }
}