using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.Internal;
using DevExpress.Web;
using DevExpress;
using System.Data.SqlClient;
using System.Windows.Forms;
using DevExpress.XtraRichEdit.Import.Html;
using System.Configuration;
using System.Threading.Tasks;
using testframework;

namespace test3
{
    public partial class add_productt : System.Web.UI.Page
    {
        public TestUser _user;
        static String imagelink;
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
            protected void btnSave_click(object sender, EventArgs e)
        {
          
            
            String proname;
            String prodesc;
            String proprice;
            String proID;
            proname = tbproname.Text;
            prodesc = tbprodesc.Text;
            proprice = tbproprice.Text;
            proID = tbID.Text;

            String query = "insert into product(pro_Name,pro_Desc,pro_Price) values('" + tbproname.Text + "','" + tbprodesc.Text + "','" + tbproprice.Text + "')";
            String mycon = "Data Source =.\\SQLEXPRESS; Initial Catalog = test; Integrated Security = True";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            Label3.Text = "Product Has Been Successfully Saved";

            string id = "";
            SqlCommand cmd1 = new SqlCommand("SELECT * FROM product WHERE pro_Name = '" + proname + "' and pro_Price='" + proprice + "'", con);
            SqlDataReader r;
            r = cmd1.ExecuteReader();
            while (r.Read())
            {
                id = r["ID"].ToString();
            }
            r.Close();

            tbID.Text = id;


            }

        
        protected void btnupload_click(object sender, EventArgs e)
        {
            String proname;
            String prodesc;
            String proprice;
            String proID;
            proname = tbproname.Text;
            prodesc = tbprodesc.Text;
            proprice = tbproprice.Text;
            proID = tbID.Text;


            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["connect"].ToString();

            con.Open();

            string pid = "";
            SqlCommand cmd5 = new SqlCommand("SELECT * FROM product WHERE pro_Name = '" + proname + "' and pro_Price='" + proprice + "'", con);
            SqlDataReader r;
            r = cmd5.ExecuteReader();
            while (r.Read())
            {
                pid = r["ID"].ToString();
            }
            r.Close();
            Int64 _person_id = Convert.ToInt64(pid);

            if (uploadimage() == true)
            {
                String query = "insert into product_picture(product_ID,pictureName,is_Preview,URL) values('" + _person_id + "','" + tbpicname.Text + "','" + cbpreview.Text + "','" + imagelink + "')";
            
                
              
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                Label4.Text = "Picture Has Been Successfully Uploaded ";

             
            }

        }
        private Boolean uploadimage()
        {
            Boolean imagesaved = false;
            if (fuproimage.HasFile == true)
            {

                String contenttype = fuproimage.PostedFile.ContentType;

                if (contenttype == "image/jpeg")
                {

                    fuproimage.SaveAs(Server.MapPath("~/morephoto/") + ".jpg");
                    imagelink = "morephoto/" + ".jpg";
                    imagesaved = true;
                }
                else
                {
                    Label4.Text = "Kindly Upload JPEG Format Image Only";
                }

            }

            else
            {
                Label4.Text = "You have not selected any file - Browse and Select File First";
            }

            return imagesaved;

        }




    }

}