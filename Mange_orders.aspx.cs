using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data;
using System.Configuration;
using System.Threading.Tasks;
using testframework;
using System.Data.SqlClient;
using System.Windows.Forms;
namespace test3
{
    public partial class Mange_orders : System.Web.UI.Page
    {
        public TestUser _user;
        String connectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=test;Integrated Security=True";
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


                string sql = "select t.Person_ID, p.Name,p.Surname,t.Pro_ID,pt.pro_name from add_test as t " +
                            "inner join person as p on p.ID = t.Person_ID "  +
                           // "inner join pro_test as pt on pt.ID = t.Pro_ID " ;
                             "inner join newadd as pt on pt.ID = t.Pro_ID ";

                SqlDataAdapter sqlDa = new SqlDataAdapter(sql,sqlCon);
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
    }
}