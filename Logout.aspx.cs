using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test3
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["tbuser"]!=null)
            {
                lbllogout.Text = "goodbye " + Session["tbuser"].ToString();

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("tbuser");
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
    }
}