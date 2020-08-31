using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testframework;
using System.Windows.Forms;
namespace test3
{
    public partial class Admin : System.Web.UI.Page
    {
        public TestUser _user;
      
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            _user = Session["_user"] as TestUser;
            if (Session["_user"] == null)
            {
                Response.Redirect("default.aspx");
            }
            else
            {
                string currenttask = Session["task"].ToString();


                if (Session["_user"] == null || currenttask == "normal")
                {
                    Response.Redirect("Default.aspx");
                }
            }
            

        }

        protected void btnpro_click(object sender, EventArgs e)
        {
           
            if (Session["tbuser"] != null)
            {
                
                Response.Redirect("addnewproduct.aspx");
            }
            else
            {
                MessageBox.Show("you are not an admin");
            }
            
        }

        protected void btnuser_click(object sender, EventArgs e)
        {
            if (Session["tbuser"] != null)
            {
                Response.Redirect("allusers.aspx");
            }
                
        }
        protected void btnadmin_click(object sender, EventArgs e)
        {
            if (Session["tbuser"] != null)
            {
                Response.Redirect("users.aspx");
            }
                
        }

        protected void btnproduct_Click(object sender, EventArgs e)
        {
            if (Session["tbuser"] != null)
            {
                Response.Redirect("products.aspx");
            }
                
        }
        protected void btnorders_click(object sender,EventArgs e)
        {
            if (Session["tbuser"] != null)
            {

                Response.Redirect("Mange_orders.aspx");
            }
            else
            {
                MessageBox.Show("you are not an admin");
            }
        }
    }
}