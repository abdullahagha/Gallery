using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using testframework;

namespace test3
{
    public partial class addnewproduct : System.Web.UI.Page
    {
        public TestUser _user;
        SqlConnection con;
        SqlCommand cmd;
      
       
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
        protected void btnupload_click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["connect"].ToString();
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into newadd values(@pro_name,@pro_desc,@pro_price,@pro_image )", con);
            cmd.Parameters.Add("@pro_name ", SqlDbType.VarChar, 50).Value = tbproname.Text;
            cmd.Parameters.Add("@pro_desc ", SqlDbType.VarChar,50).Value = tbprodesc.Text;
            cmd.Parameters.Add("@pro_price ", SqlDbType.VarChar, 50).Value = tbproprice.Text;
            fuproimage.SaveAs(Server.MapPath("morephoto" + "/" + fuproimage.FileName));
            cmd.Parameters.Add("@pro_image ", SqlDbType.VarChar, 100).Value = "morephoto" + "/" + fuproimage.FileName;

            
            if (cmd.ExecuteNonQuery() > 0)
            {
                Label4.Text = "Product Register Successfully";
            }

            

        }
    }
}