using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Library_Management_System
{
    public partial class userprofile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"] == null || string.IsNullOrWhiteSpace(Session["username"].ToString()))

                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("userlogin.aspx");
                }
                else
                {
                    getUserBookData();

                    if (!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }

        }

        // User Update button

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["username"] == null || string.IsNullOrWhiteSpace(Session["username"].ToString()))
            {
                Response.Write("<script>alert('Session Expired. Please log in again.');</script>");
                Response.Redirect("userlogin.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                updateUserpersonaldetails();
            }
        }


        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.DarkOrange;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        // user defined function

        void updateUserpersonaldetails()
        {
            string password = string.IsNullOrWhiteSpace(TextBox10.Text.Trim()) ? TextBox9.Text.Trim() : TextBox10.Text.Trim();

            try
            {
                if (Session["username"] == null || string.IsNullOrWhiteSpace(Session["username"].ToString()))
                {
                    Response.Write("<script>alert('Session expired. Please log in again.');</script>");
                    Response.Redirect("userlogin.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                    return;
                }

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand(
                        "UPDATE member_master_tbl " +
                        "SET full_name=@full_name, dob=@dob, contact_no=@contact_no, email=@email, district=@district, city=@city, " +
                        "postal_code=@postal_code, full_address=@full_address, password=@password, account_state=@account_state " +
                        "WHERE member_id=@member_id", con);

                    // Adding parameters
                    cmd.Parameters.AddWithValue("@full_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@dob", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_no", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@district", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@city", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@postal_code", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@full_address", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@account_state", "Pending");
                    cmd.Parameters.AddWithValue("@member_id", Session["username"].ToString().Trim());

                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        Response.Write("<script>alert('Details Updated Successfully.');</script>");
                        getUserPersonalDetails();
                        getUserBookData();
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Entry. No rows updated.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }



        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl WHERE member_id='" + Session["username"].ToString() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                TextBox2.Text = dt.Rows[0]["full_name"].ToString();
                TextBox1.Text = dt.Rows[0]["dob"].ToString();
                TextBox3.Text = dt.Rows[0]["contact_no"].ToString();
                TextBox4.Text = dt.Rows[0]["email"].ToString();
                DropDownList1.SelectedValue = dt.Rows[0]["district"].ToString().Trim();
                TextBox5.Text = dt.Rows[0]["city"].ToString();
                TextBox6.Text = dt.Rows[0]["postal_code"].ToString();
                TextBox7.Text = dt.Rows[0]["full_address"].ToString();
                TextBox8.Text = dt.Rows[0]["member_id"].ToString();
                TextBox9.Text = dt.Rows[0]["password"].ToString();

                Label1.Text = dt.Rows[0]["account_state"].ToString().Trim();

                if (dt.Rows[0]["account_state"].ToString().Trim() == "Active")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-success");
                }
                else if (dt.Rows[0]["account_state"].ToString().Trim() == "Pending")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-warning");
                }
                else if (dt.Rows[0]["account_state"].ToString().Trim() == "Deactive")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-Danger");
                }
                else
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-secondary");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "'); </script>");
            }
        }



        void getUserBookData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_issue_table WHERE member_id='" + Session["username"].ToString() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "'); </script>");
            }
        }
    }
}