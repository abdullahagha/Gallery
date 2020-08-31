using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.Internal;
using DevExpress;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace test3
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string conString = "Data Source=.\\SQLEXPRESS;Initial Catalog=test;Integrated Security=True";
        protected void btnSubmit_click(object sender, EventArgs e)
        {
            String Name;
            String Phonenumber;
            String Email;
            String Comments;

            Name = tbName.Text;
            Phonenumber = tbPhonenumber.Text;
            Email = tbEmail.Text;
            Comments = tbComments.Text;
            
            
            SqlConnection con = new SqlConnection(conString);
            con.Open();
            if (con.State == System.Data.ConnectionState.Open)
            {
                string q = "insert into ContactUS(Name,PhoneNumber,Email,Comments)values('" + tbName.Text.ToString() + "','" + tbPhonenumber.Text.ToString() + "','" + tbEmail.Text.ToString() + "','" + tbComments.Text.ToString() + "')";

                SqlCommand cmd = new SqlCommand(q, con);
                cmd.ExecuteNonQuery();
                

            }
            Response.Redirect("Login.aspx");
        }
        protected void NameTextBox_Validation(object sender, ValidationEventArgs e)
        {
            if ((e.Value as string).Length < 2)
                e.IsValid = false;
        }
        String Name;

    }
}