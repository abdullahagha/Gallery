using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using testframework;
namespace test3
{
    public partial class changepass : System.Web.UI.Page
    {
        public TestUser _user;
        string str = null;
        SqlCommand com;
        byte up;
        protected void Page_Load(object sender, EventArgs e)
        {
            _user = Session["_user"] as TestUser;
            if (Session["_user"] == null)
            {
                Response.Redirect("default.aspx");
            }
            else
            {
                


                if (Session["_user"] == null )
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }
        protected void btn_update_Click(object sender, EventArgs e)
        
        {
            string strConnString = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
          

            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            str = "select * from tbuser ";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            while (reader.Read())
            {
                if (txt_cpassword.Text == reader["password"].ToString())
                {
                    up = 1;
                }
            }
            reader.Close();
            con.Close();
            if (up == 1)
            {
                con.Open();
                str = "update tbuser set password=@password where user_name='" + Session["tbuser"].ToString() + "'";
                com = new SqlCommand(str, con);
                com.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar, 50));
                com.Parameters["@password"].Value = txt_npassword.Text;
                com.ExecuteNonQuery();
                con.Close();
                lbl_msg.Text = "Password changed Successfully";
            }
            else
            {
                lbl_msg.Text = "Please enter correct Current password";
            }
        }
    }
}
    
