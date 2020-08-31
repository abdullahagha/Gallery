using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.ComponentModel;
using System.Data;
using System.Configuration;
using System.Threading.Tasks;
using testframework;
using System.Data.SqlClient;

namespace test3
{
    public partial class FamilyCars : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string name;
            //string desc;
            //string price;

            //name = tbname.Text;
            //desc = tbcarders.Text;
            //price = tbprice.Text;


            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["connect"].ToString();

            con.Open();

            string id = "";
            String name = "";
            String desc = "";
            String price = "";
            SqlCommand cmd = new SqlCommand("SELECT * FROM product ", con);
            SqlDataReader r;
            r = cmd.ExecuteReader();
            while (r.Read())
            {
                id = r["pro_Name"].ToString();
                desc = r["pro_Desc"].ToString();
                price = r["pro_Price"].ToString();


            }
            r.Close();

            tbname.Text = id;
            tbcarders.Text = desc;
            tbprice.Text = price;



            string  pname = "";
            String url = "";
            SqlCommand cmd1 = new SqlCommand("SELECT * FROM product_picture ", con);
           // SqlDataReader r;
            r = cmd1.ExecuteReader();
            while (r.Read())
            {
                pname = r["pictureName"].ToString();
                url = r["URL"].ToString();


            }
            r.Close();

            tbpname.Text = pname;
            imgg.Src = url;



        }
        protected void btnmore_Click(object sender, EventArgs e)
        {
            if (Session["tbuser"] == null)
            {
                Response.Redirect("Login.aspx");

            }
            else
            {
                Response.Redirect("more.aspx");
            }
            
        }
        protected void btnadd_Click(object sender, EventArgs e)
        {

        }
        protected void btnmore1_Click(object sender, EventArgs e)
        {

        }
        protected void btnadd1_Click(object sender, EventArgs e)
        {

        }
    }
}