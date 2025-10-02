using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Online_Library_Management_System
{
    public partial class adminpublishermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Add Button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                Response.Write("<script>alert('Publisher ID already exists');</script>");
            }
            else
            {
                addNewPublisher();
            }
        }

        // Update Button Click
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (!checkIfPublisherExists())
            {
                Response.Write("<script>alert('Publisher ID does not exist');</script>");
            }
            else
            {
                updatePublisher();
            }
        }

        // Delete Button Click
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                deletePublisher();
            }
            else
            {   
                Response.Write("<script>alert('Publisher ID does not exist');</script>");
            }
        }

        // Go button Click
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Add functionality if needed
        }

        // Function to delete publisher
        void deletePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM publisher_master_tbl WHERE publisher_id=@PublisherID", con);
                cmd.Parameters.AddWithValue("@PublisherID", TextBox2.Text.Trim());

                int rowsAffected = cmd.ExecuteNonQuery();
                con.Close();

                if (rowsAffected > 0)
                {
                    Response.Write("<script>alert('Publisher deleted successfully');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Publisher ID does not exist');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // Function to update publisher
        void updatePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE publisher_master_tbl SET publisher_name=@PublisherName WHERE publisher_id=@PublisherID", con);
                cmd.Parameters.AddWithValue("@PublisherName", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@PublisherID", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher updated successfully');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // Function to add new publisher
        void addNewPublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO publisher_master_tbl (publisher_id, publisher_name) VALUES (@PublisherID, @PublisherName)", con);
                cmd.Parameters.AddWithValue("@PublisherID", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@PublisherName", TextBox1.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher added successfully');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // Function to check if publisher exists
        bool checkIfPublisherExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM publisher_master_tbl WHERE publisher_id=@PublisherID", con);
                cmd.Parameters.AddWithValue("@PublisherID", TextBox2.Text.Trim());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();

                return dt.Rows.Count >= 1;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        protected void SqlDataSource1_Selecting(object sender, System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}
