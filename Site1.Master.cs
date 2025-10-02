using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Library_Management_System
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] != null && Session["role"].Equals("")) 
                {
                    LinkButton1.Visible = true; //user login link btn
                    LinkButton2.Visible = true; //signup link btn

                    //after login only this two want to show
                    LinkButton7.Visible = false; //logout link btn
                    LinkButton5.Visible = false; //hello user linkbtn

                    LinkButton6.Visible = true; //admin
                    LinkButton11.Visible = false; //author management linkbtn
                    LinkButton12.Visible = false; //publisher management linkbtn
                    LinkButton8.Visible = false; //book inventory linkbtn
                    LinkButton9.Visible = false; //book issueing linkbtn
                    LinkButton10.Visible = false; //member management linkbtn
                    LinkButton3.Visible = false; // reports
                    LinkButton13.Visible = false; // book track by member


                }
                else if (Session["role"] != null && Session["role"].Equals("User"))
                {
                    LinkButton1.Visible = false; //user login link btn
                    LinkButton2.Visible = false; //signup link btn

                    //after login only this two want to show
                    LinkButton7.Visible = true; //logout link btn
                    LinkButton5.Visible = true; //hello user linkbtn
                    LinkButton5.Text = "Hello " +Session["username"].ToString();

                    LinkButton6.Visible = true; //admin
                    LinkButton11.Visible = false; //author management linkbtn
                    LinkButton12.Visible = false; //publisher management linkbtn
                    LinkButton8.Visible = false; //book inventory linkbtn
                    LinkButton9.Visible = false; //book issueing linkbtn
                    LinkButton10.Visible = false; //member management linkbtn
                    LinkButton3.Visible = false; // reports
                    LinkButton13.Visible = true; // book track by member
                }
                else if (Session["role"] != null && Session["role"].Equals("Admin"))
                {
                    LinkButton1.Visible = false; //user login link btn
                    LinkButton2.Visible = false; //signup link btn

                    //after login only this two want to show
                    LinkButton7.Visible = true; //logout link btn
                    LinkButton5.Visible = true; //hello user linkbtn
                    LinkButton5.Text = "Hello Admin";

                    LinkButton6.Visible = false; //admin
                    LinkButton11.Visible = true; //author management linkbtn
                    LinkButton12.Visible = true; //publisher management linkbtn
                    LinkButton8.Visible = true; //book inventory linkbtn
                    LinkButton9.Visible = true; //book issueing linkbtn
                    LinkButton10.Visible = true; //member management linkbtn
                    LinkButton3.Visible = true; // reports
                    LinkButton13.Visible = false; // book track by member
                }
            }
            catch { }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthormanagement.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanagement.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookinventory.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookissueing.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminMemberManagement.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("user signup.aspx");
        }

        protected void LinkButton4_Click1(object sender, EventArgs e)
        {
            Response.Redirect("viewbooks.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton1.Visible = true; //user login link btn
            LinkButton2.Visible = true; //signup link btn

            //after login only this two want to show
            LinkButton7.Visible = false; //logout link btn
            LinkButton5.Visible = false; //hello user linkbtn

            LinkButton6.Visible = true; //admin
            LinkButton11.Visible = false; //author management linkbtn
            LinkButton12.Visible = false; //publisher management linkbtn
            LinkButton8.Visible = false; //book inventory linkbtn
            LinkButton9.Visible = false; //book issueing linkbtn
            LinkButton10.Visible = false; //member management linkbtn
            LinkButton13.Visible = false; // book track by member

            Response.Redirect("homepage.aspx");
        }



        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Report.aspx");
        }

        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            Response.Redirect("trackbook.aspx");
        }
    }
}