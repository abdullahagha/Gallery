using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;



namespace test3
{
    public partial class add_product : System.Web.UI.Page
    {
        static String imagelink;
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }
        protected void btnupload_click(object sender, EventArgs e)
        {
          
            if (uploadimage() == true)
            {
                String query = "insert into pro_test(pro_name,pro_desc,pro_price,pro_image) values('" + tbproname.Text + "','" + tbprodesc.Text + "','" + tbproprice.Text + "','" + imagelink + "')";
                String mycon = "Data Source =.\\SQLEXPRESS; Initial Catalog = test; Integrated Security = True";
                SqlConnection con = new SqlConnection(mycon);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                Label4.Text = "Product Has Been Successfully Saved";
             
                tbproname.Text = "";
                tbprodesc.Text = "";
                tbproprice.Text = "";
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