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
    public partial class products : System.Web.UI.Page
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * from newadd", sqlCon);
                sqlDa.Fill(dtb1);
            }
            if (dtb1.Rows.Count > 0)
            {
                gvproducts.DataSource = dtb1;
                gvproducts.DataBind();
            }
            else
            {
                dtb1.Rows.Add(dtb1.NewRow());
                gvproducts.DataSource = dtb1;
                gvproducts.DataBind();
                gvproducts.Rows[0].Cells.Clear();
                gvproducts.Rows[0].Cells.Add(new TableCell());
                gvproducts.Rows[0].Cells[0].ColumnSpan = dtb1.Columns.Count;
                gvproducts.Rows[0].Cells[0].Text = "No Data Found...! ";
                gvproducts.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;

            }

        }
        //protected void gvproducts_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    try
        //    {
        //        if (e.CommandName.Equals("AddNew"))
        //        {
        //            using (SqlConnection sqlCon = new SqlConnection(connectionString))
        //            {
        //                sqlCon.Open();
        //                String query = "INSERT INTO product(pro_Name,pro_Desc,pro_Price)values(@pro_Name,@pro_Desc,@pro_Price)";
        //                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
        //                sqlCmd.Parameters.AddWithValue("@Name", (gvproducts.FooterRow.FindControl("tbpronameFooter") as TextBox).Text.Trim());
        //                sqlCmd.Parameters.AddWithValue("@Surname", (gvproducts.FooterRow.FindControl("tbprodescFooter") as TextBox).Text.Trim());
        //                sqlCmd.Parameters.AddWithValue("@Email", (gvproducts.FooterRow.FindControl("tbpropriceFooter") as TextBox).Text.Trim());

        //                sqlCmd.ExecuteNonQuery();
        //                populateGridview();
        //                lblsucces.Text = "New product Added";
        //                lblerror.Text = "";
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        lblsucces.Text = "";
        //        lblerror.Text = ex.Message;
        //    }
        //}

        protected void gvproducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvproducts.EditIndex = e.NewEditIndex;
            populateGridview();

        }

        protected void gvproducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvproducts.EditIndex = -1;
            populateGridview();

        }

        protected void gvproducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    String query = "UPDATE newadd SET pro_Name=@pro_Name,pro_Desc=@pro_Desc,pro_Price=@pro_Price WHERE ID=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@pro_Name", (gvproducts.Rows[e.RowIndex].FindControl("tbproname") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@pro_Desc", (gvproducts.Rows[e.RowIndex].FindControl("tbprodesc") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@pro_Price", (gvproducts.Rows[e.RowIndex].FindControl("tbproprice") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvproducts.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvproducts.EditIndex = -1;
                    populateGridview();
                    lblsucces.Text = "selected product updated";
                    lblerror.Text = "";
                }

            }
            catch (Exception ex)
            {
                lblsucces.Text = "";
                lblerror.Text = ex.Message;
            }
        }

        protected void gvproducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    String query = "DELETE FROM newadd WHERE ID=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvproducts.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    populateGridview();
                    lblsucces.Text = "selected product deleted";
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