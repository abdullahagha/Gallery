using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.XtraNavBar;
using System.Windows.Forms;
using System.ComponentModel;
using System.Data;
using System.Configuration;
using testframework;
namespace test3
{
    public partial class SiteMaster : MasterPage
    {
        public TestUser _user;
        protected void Page_Load(object sender, EventArgs e)
        {
            _user = Session["_user"] as TestUser;
            
            if (Session["tbuser"] != null )
            {
                alogin.Visible = false;
                asignup.Visible = false;
                athis.Visible = true;
                athis.InnerText= Session["tbuser"].ToString();
                string currenttask = Session["task"].ToString();
                if (Session["_user"] == null || currenttask == "admin")
                {
                    admin.Visible = true;
                }
                else
                {
                    admin.Visible = false;
                }
                    
               
                    
                
            }
            else
            {
                alogin.Visible = true;
                asignup.Visible = true;
                athis.Visible = false;
                admin.Visible = false;
                
            }
        }
    }
}