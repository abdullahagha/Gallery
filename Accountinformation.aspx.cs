using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace test3
{
    public partial class Accountinformation : System.Web.UI.Page
    {
        String connectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=test;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tbuser"] != null)
            {
                string sessionname = Session["tbuser"].ToString();
                string sessionpassword = Session["tbpassword"].ToString();
                string sessionpid = Session["tbpid"].ToString();
                Int64 pid = Convert.ToInt64(sessionpid);

                //  populateGridview();
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
            
                if (!IsPostBack)
            {
                populateGridview();
            }
            

            }
        void populateGridview()
        {
            
            string sessionpid = Session["tbpid"].ToString();
            Int64 pid = Convert.ToInt64(sessionpid);

            DataTable dtb1 = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT p.* from person p where p.ID = '" + pid + "'", sqlCon);
               
                sqlDa.Fill(dtb1);
            }
            if (dtb1.Rows.Count > 0)
            {
                gvallusers.DataSource = dtb1;
                gvallusers.DataBind();
            }
            else
            {
                dtb1.Rows.Add(dtb1.NewRow());
                gvallusers.DataSource = dtb1;
                gvallusers.DataBind();
                gvallusers.Rows[0].Cells.Clear();
                gvallusers.Rows[0].Cells.Add(new TableCell());
                gvallusers.Rows[0].Cells[0].ColumnSpan = dtb1.Columns.Count;
                gvallusers.Rows[0].Cells[0].Text = "No Data Found...! ";
                gvallusers.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;

            }

        }


        protected void gvallusers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvallusers.EditIndex = e.NewEditIndex;
            populateGridview();

        }
        protected void gvallusers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvallusers.EditIndex = -1;
            populateGridview();

        }
        protected void gvallusers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    String query = "UPDATE person SET Name=@Name,Surname=@Surname,Email=@Email,Phone_num=@Phone_num,Reigon=@Reigon WHERE ID=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Name", (gvallusers.Rows[e.RowIndex].FindControl("tbname") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Surname", (gvallusers.Rows[e.RowIndex].FindControl("tbsurname") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Email", (gvallusers.Rows[e.RowIndex].FindControl("tbemail") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Phone_num", (gvallusers.Rows[e.RowIndex].FindControl("tbphonenum") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Reigon", (gvallusers.Rows[e.RowIndex].FindControl("tbreigon") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvallusers.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvallusers.EditIndex = -1;
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
        protected void btnchangepassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("changepass.aspx");
        }

    }
}