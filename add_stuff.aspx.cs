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

    public partial class add_stuff : System.Web.UI.Page
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * from staff", sqlCon);
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

        protected void gvallusers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        String query = "INSERT INTO staff(Task,place)values(@Task,@place)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@Task", (gvallusers.FooterRow.FindControl("tbtaskFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@place", (gvallusers.FooterRow.FindControl("tbplaceFooter") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();
                        populateGridview();
                        lblsucces.Text = "New person Added";
                        lblerror.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblsucces.Text = "";
                lblerror.Text = ex.Message;
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
                    String query = "UPDATE staff SET Task=@Task,place=@place WHERE ID=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Task", (gvallusers.Rows[e.RowIndex].FindControl("tbtask") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@place", (gvallusers.Rows[e.RowIndex].FindControl("tbplace") as TextBox).Text.Trim());
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

        protected void gvallusers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    String query = "DELETE FROM staff WHERE ID=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvallusers.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    populateGridview();
                    lblsucces.Text = "selected person deleted";
                    lblerror.Text = "";
                }

            }
            catch (Exception ex)
            {
                lblsucces.Text = "";
                lblerror.Text = ex.Message;
            }
        }


    }

}