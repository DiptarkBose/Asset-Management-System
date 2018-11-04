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
        //Label1.Text = DropDownList2.SelectedItem.Text;
    }
}