using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Library_Management_System
{
    public partial class adminbookissueing : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // go button
        protected void Button1_Click(object sender, EventArgs e)
        {
            getBookandMembername();
        }

        // returned button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if(checkIfBookExist() && checkIfMemberExist())
            {
                returnbook();
            }
            else
            {
                Response.Write("<script>alert('Entry Not Exist')</script>");
            }
        }


        // book issuing Button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkIfBookExist() && checkIfMemberExist())
            {
                issuebook();
            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID Or Member ID') </script>");
            }
        }

        // User define Function


        void returnbook()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    // Delete the record from book_issue_table
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM book_issue_table WHERE book_id = @BookId AND member_id = @MemberId", con))
                    {
                        cmd.Parameters.AddWithValue("@BookId", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@MemberId", TextBox1.Text.Trim());

                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            // Update the current_stock in book_master_tbl
                            using (SqlCommand updateCmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock + 1 WHERE book_id = @BookId", con))
                            {
                                updateCmd.Parameters.AddWithValue("@BookId", TextBox2.Text.Trim());
                                updateCmd.ExecuteNonQuery();
                            }

                            Response.Write("<script>alert('Book Returned successfully');</script>");
                            GridView1.DataBind(); // Refresh the GridView
                        }
                        else
                        {
                            Response.Write("<script>alert('Invalid Book ID or Member ID');</script>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void issuebook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_table(member_id, member_name, book_id, book_name, issue_name, due_date) VALUES(@member_id, @member_name, @book_id, @book_name, @issue_name, @due_date)", con);
                cmd.Parameters.AddWithValue("@member_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_name", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@due_date", TextBox6.Text.Trim());

                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock-1 WHERE book_id=@BookId", con);
                cmd.Parameters.AddWithValue("@BookId", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Book Issued successfully');</script>");


                GridView1.DataBind();


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfBookExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from book_master_tbl WHERE book_id=@BookId AND current_stock > 0", con);
                cmd.Parameters.AddWithValue("@BookId", TextBox2.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            } 
            catch 
            {
                return false;
            } 
        }


        bool checkIfMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from member_master_tbl WHERE member_id=@MemberId", con);
                cmd.Parameters.AddWithValue("@MemberId", TextBox1.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
        }



        void getBookandMembername()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select book_name from book_master_tbl WHERE book_id=@BookId", con);
                cmd.Parameters.AddWithValue("@BookId", TextBox2.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox4.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Book ID.') </script>");
                }

                // member-id

                cmd = new SqlCommand("select full_name from member_master_tbl WHERE member_id=@MemberId", con);
                cmd.Parameters.AddWithValue("@MemberId", TextBox1.Text.Trim());

                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox3.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Wrong Member ID.') </script>");
                }

            }
            catch (Exception ex)
            { 
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

       
protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
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
    }
}