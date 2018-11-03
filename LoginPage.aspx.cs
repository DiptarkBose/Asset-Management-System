﻿using System;
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = @"Data Source=(localdb)\mssqllocaldb;Initial Catalog=Assets;Integrated Security=True;Pooling=False";
            using (SqlCommand com = new SqlCommand())
            {
                com.Connection = con;
                com.CommandText = "SELECT * FROM Users WHERE UserID=@userID";
                com.Parameters.AddWithValue("userID", UserID.Text);
                con.Open();
                using (SqlDataReader reader = com.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        if (reader.HasRows.ToString() == "false")
                        {
                            Error.Text = "Wrong UserID";
                        }
                        else
                        {
                            if (reader["Password"].ToString() == Password.Text)
                            {
                                Session["UserID"] = UserID.Text;
                                Response.Redirect("UserDashboard.aspx");
                            }
                            else
                            {
                                Error.Text = "Wrong Password";
                            }
                        }
                    }
                }
            }
        }
    }
}