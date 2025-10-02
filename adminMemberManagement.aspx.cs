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
    public partial class adminMemberManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        // Go Button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getMemberByID();
        }
        // Active Button
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            UpdateMemberById("Active");
        }
        // Pending BUtton
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            UpdateMemberById("Pending");
        }
        // Deactive Botton
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            UpdateMemberById("Deactive");
        }
        // Delete Botton
        protected void Button2_Click(object sender, EventArgs e)
        {      
                deleteMemberById();           
        }

        // user defined function
        void getMemberByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl WHERE member_id='" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                       TextBox2.Text = dr.GetValue(0).ToString();
                       TextBox7.Text = dr.GetValue(10).ToString();
                       TextBox3.Text = dr.GetValue(1).ToString();
                       TextBox4.Text = dr.GetValue(2).ToString();
                       TextBox8.Text = dr.GetValue(3).ToString();
                       TextBox9.Text = dr.GetValue(5).ToString();
                       TextBox10.Text = dr.GetValue(6).ToString();
                       TextBox11.Text = dr.GetValue(4).ToString();
                       TextBox5.Text = dr.GetValue(7).ToString();
                    }
                    
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials'); </script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "'); </script>");
            }
        }

        void UpdateMemberById(string status)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                // Corrected SQL query syntax
                SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_state=@status WHERE member_id=@memberId", con);

                // Using parameters to prevent SQL injection
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@memberId", TextBox1.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();

                GridView1.DataBind();
                Response.Write("<script>alert('Member Status Updated')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "'); </script>");
            }
        }


        void deleteMemberById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM member_master_tbl WHERE member_id = @MemberId", con);
                cmd.Parameters.AddWithValue("@MemberId", TextBox1.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Member deleted successfully');</script>");
               

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}