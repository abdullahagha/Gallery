using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.Demos;
using System.Data;
using System.Configuration;
using System.Threading.Tasks;
using testframework;
using System.Data.SqlClient;
using System.Windows.Forms;
namespace test3
{
    public partial class ClassicCars : System.Web.UI.Page
    {
        String connectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=test;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                populateGridview();
            }

        }
        void populateGridview()
        {
            DataTable dtb1 = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                // SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * from pro_test", sqlCon);
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * from newadd", sqlCon);
                sqlDa.Fill(dtb1);
            }
            if (dtb1.Rows.Count > 0)
            {
                GridView1.DataSource = dtb1;
                GridView1.DataBind();
            }
            else
            {
                dtb1.Rows.Add(dtb1.NewRow());
                GridView1.DataSource = dtb1;
                GridView1.DataBind();
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = dtb1.Columns.Count;
                GridView1.Rows[0].Cells[0].Text = "No Data Found...! ";
                GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;

            }

        }
        protected void btnSelect_Click(object sender, EventArgs e)
        {
            Int64 pid = 0;

            if (Session["tbuser"] != null)
            {
                string sessionname = Session["tbuser"].ToString();
                string sessionpassword = Session["tbpassword"].ToString();
                string sessionpid = Session["tbpid"].ToString();
                pid = Convert.ToInt64(sessionpid);
            }
            else
            {
                MessageBox.Show("Login please!");
                Response.Redirect("Login.aspx");
            }
            int IDD = Convert.ToInt32((sender as LinkButton).CommandArgument);

          
            

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["connect"].ToString();

            con.Open();

            SqlCommand cmd1 = new SqlCommand("insert into add_test(Person_ID,Pro_ID)values(@ID,@Pro_ID)", con);
            cmd1.Parameters.AddWithValue("@ID", pid);
            cmd1.Parameters.AddWithValue("@Pro_ID",IDD);
          
            cmd1.ExecuteNonQuery();
            cmd1.Parameters.Clear();

        }
    }

}