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
namespace test3
{
    public partial class Forget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            con.Open();
            String query = "select count(*) from person where Email= '" + tbEmail.Text + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            String output = cmd.ExecuteScalar().ToString();
            if (output == "1")
            {
                Session["person"] = tbEmail.Text;
                MessageBox.Show("check your email");
                Response.Redirect("Login.aspx");
            }
            else
            {
                MessageBox.Show("we cant find this email !");
                Response.Redirect("Forget.aspx");

            }

        }
    }
}