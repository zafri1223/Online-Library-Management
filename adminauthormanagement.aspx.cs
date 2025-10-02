using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Library_Management_System
{
    public partial class adminauthormanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataBind();
            }
        }

        // Add button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                Response.Write("<script>alert('Author ID already exists');</script>");
                GridView1.DataBind();
            }
            else
            {
                addNewAuthor();
            }
        }

        // Update button click
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (!checkIfAuthorExists())
            {
                Response.Write("<script>alert('Author ID does not exist');</script>");
            }
            else
            {
                updateAuthor();
            }
        }

        // Delete button click
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                deleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author ID does not exist');</script>");
            }
        }

        // Go button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            GetAuthorById();
        }

        // User-defined functions

        void GetAuthorById()
        {
            try
            {
                // Define the connection string
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                // SQL query to get the author's name using a parameterized query
                SqlCommand cmd = new SqlCommand("SELECT author_name FROM author_master_tbl WHERE author_id = @AuthorId", con);
                cmd.Parameters.AddWithValue("@AuthorId", TextBox2.Text.Trim());

                // Execute the query and retrieve the result
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                
                if (dt.Rows.Count >= 1)
                {
                    // Populate the TextBox with the author's name
                    TextBox1.Text = dt.Rows[0]["author_name"].ToString();
                }
                else
                {
                    // Show an alert if the author_id is invalid
                    Response.Write("<script>alert('Invalid Author ID.');</script>");
                }
            }
            catch (Exception ex)
            {
                // Log the exception and display a user-friendly message
                Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
            }
            
        }


        void deleteAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM author_master_tbl WHERE author_id = @AuthorId", con);
                cmd.Parameters.AddWithValue("@AuthorId", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author deleted successfully');</script>");
                clearForm();
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE author_master_tbl SET author_name = @AuthorName WHERE author_id = @AuthorId", con);
                cmd.Parameters.AddWithValue("@AuthorName", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@AuthorId", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author updated successfully');</script>");
                GridView1.DataBind();
                clearForm();
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            
        }
        

        void addNewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tbl(author_id, author_name) VALUES(@AuthorId, @AuthorName)", con);
                cmd.Parameters.AddWithValue("@AuthorId", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@AuthorName", TextBox1.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author added successfully');</script>");
                clearForm();
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfAuthorExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM author_master_tbl WHERE author_id = @AuthorId", con);
                cmd.Parameters.AddWithValue("@AuthorId", TextBox2.Text.Trim());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt.Rows.Count >= 1;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}