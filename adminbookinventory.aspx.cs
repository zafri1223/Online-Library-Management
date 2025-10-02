using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Library_Management_System
{
    public partial class adminbookinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static int global_actual_stock, global_current_stock, global_issued_books;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                fillAuthorPublisherValues();
                GridView1.DataBind();
            }
        }
        // add Button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                Response.Write("<script>alert('Book Already Exists ,Try Some Other Book ID.');</script>");
            }
            else
            {
                addNewBook();
            }
        }

        // Update Button
        protected void Button3_Click(object sender, EventArgs e)
        {
            updateBookByID();
        }

        // delete button
        protected void Button2_Click(object sender, EventArgs e)
        {
            
                DeleteBook();
            
        }


        // user defined function


        void DeleteBook()
        {
            if (checkIfBookExists())
            {

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from book_master_tbl WHERE book_id = '" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book deleted successfully');</script>");
                    GridView1.DataBind();


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }


        void updateBookByID()
        {
            if (checkIfBookExists())
            {
                try
                {
                    int actual_stock = Convert.ToInt32(TextBox7.Text.Trim());
                    int current_stock = Convert.ToInt32(TextBox8.Text.Trim());

                    if (global_actual_stock != actual_stock)
                    {
                        if (actual_stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Actual Stock Value Cannot be less Than The Issued Books');</script>");
                            return;
                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_books;
                            TextBox8.Text = current_stock.ToString();
                        }
                    }

                    string genre = string.Join(",", ListBox1.GetSelectedIndices().Select(i => ListBox1.Items[i].Text));

                    string filepath = "~/book_inventory/books2.png";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (!string.IsNullOrEmpty(filename))
                    {
                        FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                        filepath = "~/book_inventory/" + filename;
                    }

                    using (SqlConnection con = new SqlConnection(strcon))
                    {
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl SET book_name=@book_name, genre=@genre, author_name=@author_name, publisher_name=@publisher_name, publish_date=@publish_date, language=@language, book_cost=@book_cost, no_of_pages=@no_of_pages, book_description=@book_description, actual_stock=@actual_stock, current_stock=@current_stock, book_img_link=@book_img_link WHERE book_id=@BookId", con);
                        cmd.Parameters.AddWithValue("@BookId", TextBox1.Text.Trim());
                        // Adding parameters
                        cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@genre", genre);
                        cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@publish_date", TextBox3.Text.Trim()); // Ensure this is valid
                        cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@edition", TextBox5.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_cost", TextBox6.Text.Trim());
                        cmd.Parameters.AddWithValue("@no_of_pages", TextBox4.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_description", TextBox10.Text.Trim());
                        cmd.Parameters.AddWithValue("@actual_stock", actual_stock);
                        cmd.Parameters.AddWithValue("@current_stock", current_stock);
                        cmd.Parameters.AddWithValue("@book_img_link", filepath);
                        

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('Book Status Updated');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('No book found with the given ID or no changes were made');</script>");
                        }
                    }

                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        void getBookById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='"+TextBox1.Text.Trim()+"';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >=1)
                {
                    TextBox2.Text = dt.Rows[0]["book_name"].ToString();
                    DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                    TextBox3.Text = dt.Rows[0]["publish_date"].ToString();
                    TextBox5.Text = dt.Rows[0]["edition"].ToString();
                    TextBox6.Text = dt.Rows[0]["book_cost"].ToString();
                    TextBox4.Text = Convert.ToInt32(dt.Rows[0]["no_of_pages"]).ToString();
                    TextBox7.Text = Convert.ToInt32(dt.Rows[0]["actual_stock"]).ToString();
                    TextBox8.Text = Convert.ToInt32(dt.Rows[0]["current_stock"]).ToString();

                    TextBox9.Text = (Convert.ToInt32(dt.Rows[0]["actual_stock"]) - Convert.ToInt32(dt.Rows[0]["current_stock"])).ToString();


                    TextBox10.Text = dt.Rows[0]["book_description"].ToString();

                    ListBox1.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');  
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; i++)
                        {
                            if (ListBox1.Items[j].ToString() == genre[i])
                            {
                                ListBox1.Items[j].Selected = true;  
                            }
                        }
                    }



                }    
                else 
                {
                    Response.Write("<script>alert('Invalid Book ID.');</script>");
                }
            }
            catch (Exception ex)
            {
                
            }
        }

        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT author_name from author_master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "author_name";
                DropDownList3.DataBind();

                cmd = new SqlCommand("SELECT publisher_name from publisher_master_tbl;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "publisher_name";
                DropDownList2.DataBind();
            }
            catch (Exception ex)
            {
                
            }
        }

        void addNewBook()
        {
            try
            {
                // listbox genre
                string genre = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    genre += ListBox1.Items[i] + ",";  // genre adding
                }
                genre = genre.TrimEnd(',');

                // book upload img
                string filepath = "~/book_inventory/books2.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if (!string.IsNullOrEmpty(filename))
                {
                    FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                    filepath = "~/book_inventory/" + filename;
                }

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl (book_id, book_name, genre, author_name, publisher_name, publish_date, language, edition, book_cost, no_of_pages, book_description, actual_stock, current_stock, book_img_link) VALUES " +
                    "(@book_id, @book_name, @genre, @author_name, @publisher_name, @publish_date, @language, @edition, @book_cost, @no_of_pages, @book_description, @actual_stock, @current_stock, @book_img_link)", con);

                cmd.Parameters.AddWithValue("@book_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genre);
                cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);
                cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book added successfully');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }



        bool checkIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id = @BookId", con);
                cmd.Parameters.AddWithValue("@BookId", TextBox1.Text.Trim());
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

        // Go BUtton 
        protected void Button1_Click(object sender, EventArgs e)
        {
            getBookById();
        }
    }
}