using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.ComponentModel;
using System.Data;
using System.Configuration;
using System.Threading.Tasks;
using testframework;


namespace test3
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["_user"] != null)
            {
                Response.Redirect("Default.aspx");
                
            }
        }
        //    <add name="connect" connectionString="Data Source=.\SQLEXPRESS;Initial Catalog=test;Integrated Security=True" providerName="System.Data.sqlClient" />
        //                           Data Source=.\\;Initial Catalog=test;Integrated Security=True
        //public string conString = "Data Source=.\\SQLEXPRESS;Initial Catalog=test;Integrated Security=True";
        protected void btnEnter_Click(object sender, EventArgs e)
        {

            string _username;
            string _password;
            //  String Task;


            _username = tbusername.Text;
            _password = tbpassword.Text;


            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
            con.Open();
            String query = "select count(*) from tbuser where user_name= '" + tbusername.Text + "' and password ='" + tbpassword.Text + "' ";
            SqlCommand cmd = new SqlCommand(query, con);
            String output = cmd.ExecuteScalar().ToString();


            string pid = "";
            string name = "";
            string surname = "";
            SqlCommand cmd5 = new SqlCommand("SELECT T.*, P.Name, P.Surname FROM tbuser T INNER JOIN person P ON P.ID=T.person_ID WHERE T.user_name = '" + _username + "' and T.password='" + _password + "'", con);
            SqlDataReader r;
            r = cmd5.ExecuteReader();
            //TestPerson _person = new TestPerson();
            while (r.Read())
            {
                pid = r["person_ID"].ToString();
                name = r["Name"].ToString();
                surname = r["Surname"].ToString();
                //_person.ID = Convert.ToInt32(pid);
                //_person.name= r["Name"].ToString();
                //_person.surname = r["Surname"].ToString();
            }
            r.Close();
            if (pid =="")
            {
                MessageBox.Show("User name or Password is wrong");
                return;
            }
            Int64 _person_id = Convert.ToInt64(pid);
            string _task = "";
            SqlCommand cmd6 = new SqlCommand("SELECT * FROM staff WHERE Person_ID = '" + _person_id + "'", con);
            SqlDataReader reader;
            reader = cmd6.ExecuteReader();
            while (reader.Read())
            {
                _task = reader["Task"].ToString();
            }
            reader.Close();


            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd6);
            da.Fill(dt);
            if (dt.Rows.Count != 0)
            {


                if (output == "1")
                {
                    TestUser _user = new TestUser();
                    _user.Username= tbusername.Text;
                    _user.Password = tbpassword.Text;
                    _user.Person_ID= Convert.ToInt32(_person_id);
                    _user.Person = new Person();
                    _user.Person.ID = _user.Person_ID;
                    _user.Person.Name = name;
                    _user.Person.Surname = surname;

                    Session["_user"] = _user;


                    Session["tbuser"] = tbusername.Text;
                    Session["tbpassword"] = tbpassword.Text;
                    Session["tbpid"] = _person_id;
                    _task = dt.Rows[0][2].ToString().Trim();
                    if (_task == "admin")
                    {
                        Session["tbuser"] = tbusername.Text;
                        Session["task"] = "admin";
                        Response.Redirect("Admin.aspx");
                    }

                    //Response.Redirect("about.aspx");
                    else if (_task == "normal")
                    {
                        //  Session["tbuser"] = tbusername.Text;
                        Session["task"] = "normal";
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        Response.Redirect("Contact.aspx");
                    }
                }

                else
                {
                    Response.Write("log filed");
                }

            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }
        protected void NameTextBox_Validation(object sender, ValidationEventArgs e)
        {
            if ((e.Value as string).Length < 2)
                e.IsValid = false;
        }
    }

    public class TestPerson
    {
        public int ID { get; set; }
        public string name { get; set; }
        public string surname { get; set; }
    }
}