using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using testframework;
namespace test3
{
    public partial class users : System.Web.UI.Page
    {
        public TestUser _user;
        String connecttionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=test;Integrated Security=True";
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


            //using (SqlConnection sqlCon = new SqlConnection(connecttionString))
            //{
            //    sqlCon.Open();
            //    SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT p.*,s.* FROM person p LEFT OUTER JOIN staff s ON p.ID = s.Person_ID", sqlCon);
            //    DataTable dtb1 = new DataTable();

            //    sqlDa.Fill(dtb1);
            //    gvusers.DataSource = dtb1;
            //    gvusers.DataBind();
            //}

        }
        void populateGridview()
        {
            DataTable dtb1 = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connecttionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT p.*,s.* FROM person p LEFT OUTER JOIN staff s ON p.ID = s.Person_ID", sqlCon);
                sqlDa.Fill(dtb1);
            }
            if (dtb1.Rows.Count > 0)
            {
                gvusers.DataSource = dtb1;
                gvusers.DataBind();
            }
            else
            {
                dtb1.Rows.Add(dtb1.NewRow());
                gvusers.DataSource = dtb1;
                gvusers.DataBind();
                gvusers.Rows[0].Cells.Clear();
                gvusers.Rows[0].Cells.Add(new TableCell());
                gvusers.Rows[0].Cells[0].ColumnSpan = dtb1.Columns.Count;
                gvusers.Rows[0].Cells[0].Text = "No Data Found...! ";
                gvusers.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;

            }

        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32((sender as LinkButton).CommandArgument);
           // Response.Redirect("add_stuff.aspx");
        }
        protected void gvusers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvusers.EditIndex = e.NewEditIndex;
            populateGridview();
        }

        protected void gvusers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connecttionString))
                {
                    sqlCon.Open();
                    String query = "UPDATE staff SET Task=@Task WHERE Person_ID=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Task", (gvusers.Rows[e.RowIndex].FindControl("tbtask") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvusers.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvusers.EditIndex = -1;
                    populateGridview();
                    lblsucces.Text = "selected person updated";
                  lblerror.Text = "";
                }

            }
            catch (Exception ex)
            {
              lblsucces.Text = "";
              lblerror.Text = ex.Message;
            }
        }
       
        protected void gvusers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvusers.EditIndex = -1;
            populateGridview();

        }

        
    }
}