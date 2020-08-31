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
    public partial class SignUP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["_user"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }
      //  public string conString = "Data Source=.\\SQLEXPRESS;Initial Catalog=test;Integrated Security=True";

        protected void btnSignUP_Click(object sender, EventArgs e)
        {
            {
                //SetControls();
                string yourname;
                String Surname;
                string _username;
                String Email;
                string Password;
                String repassword;
                string reigon;
                String phone;

                yourname = tbyourname.Text;
                Surname = tbsurname.Text;
                _username = tbusername.Text;
                Password = tbPassword.Text;
                Email = tbEmail.Text;
                repassword = tbrepassword.Text;
                reigon = cbReigon.Text;
                phone = tbphone.Text;

                if (Password != repassword)
                {
                    MessageBox.Show("entered passwords do not match");
                    Response.Redirect("SignUP.aspx");
                }
               
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["connect"].ToString();
                
                con.Open();

                SqlCommand cmd1 = new SqlCommand("insert into person(Name,Surname,Email,Phone_num,Reigon)values(@yourname,@Surname,@Email,@phone,@reigon)", con);
                cmd1.Parameters.AddWithValue("@yourname",tbyourname.Text); 
                cmd1.Parameters.AddWithValue("@Surname",tbsurname.Text);
                cmd1.Parameters.AddWithValue("@Email",tbEmail.Text);
                cmd1.Parameters.AddWithValue("@phone",tbphone.Text);
                cmd1.Parameters.AddWithValue("@reigon",cbReigon.Text);
                cmd1.ExecuteNonQuery();
                cmd1.Parameters.Clear();

                string id = "";
                SqlCommand cmd5 = new SqlCommand("SELECT * FROM Person WHERE Name = '" + yourname + "' and Surname='" + Surname + "'", con);
                SqlDataReader r;
                r = cmd5.ExecuteReader();
                while (r.Read())
                {
                    id = r["id"].ToString();
                }
                r.Close();

                SqlCommand cmd2 = new SqlCommand("insert into tbuser(user_name,password,person_ID)values(@user_name,@password,@person_ID)", con);
                cmd2.Parameters.AddWithValue("@user_name",tbusername.Text);
                cmd2.Parameters.AddWithValue("@password",tbPassword.Text);
                cmd2.Parameters.AddWithValue("@person_ID", id);
                cmd2.ExecuteNonQuery();
                cmd2.Parameters.Clear();

                //SqlCommand cmd3 = new SqlCommand("insert into customer(person_ID)values(@person_ID)", con);
                //cmd3.Parameters.AddWithValue("@person_ID", id);
                //cmd3.ExecuteNonQuery();
                //cmd3.Parameters.Clear();

                SqlCommand cmd7 = new SqlCommand("insert into staff(person_ID,Task)values(@person_ID,@Task)", con);
                cmd7.Parameters.AddWithValue("@person_ID", id);
                cmd7.Parameters.AddWithValue("@Task","normal");
                cmd7.ExecuteNonQuery();
                cmd7.Parameters.Clear();

                Response.Redirect("Login.aspx");
            }
        }
        //public void SetControls()
        //{
        //    lblwarningyourname.Visible = false;
        //    lblwarningEmail.Visible = false;
        //    lblwarningPassword.Visible = false;
        //}
        protected void btnEnter_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        protected void NameTextBox_Validation(object sender, ValidationEventArgs e)
        {
            if ((e.Value as string).Length < 2)
                e.IsValid = false;
        }
    }
}