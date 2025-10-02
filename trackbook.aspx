<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="trackbook.aspx.cs" Inherits="Online_Library_Management_System.trackbook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

         <script type="text/javascript">
    $(document).ready(function () {
        // the first row in <thead> if it's not already there
        $(".table").each(function () {
            // Check if <thead> is missing and add it if necessary
            if ($(this).find("thead").length === 0) {
                // Move the first row to <thead>
                let headerRow = $(this).find("tr:first");
                $(this).prepend($("<thead></thead>").append(headerRow));
            }
        });
        // Initialize DataTable
        $('.table').DataTable(); 
    });
         </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <center>
          <div class="col-md-10">
          <div class="card">  
              <div class="card-body">
                  <div class="row">
                      <div class="col">
                      <center>
                          <h4>All Issued Book List</h4>
                      </center>
                      </div>
                  </div>
                 
                 
                  <div class="row">
                      <div class="col">
                          <hr />
                      </div>
                  </div>


                  <div class="row">
                      <div class="col">
                          <div class="table-responsive">
                          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=ZAFRI;Initial Catalog=elibraryDB;Integrated Security=True;Encrypt=False" SelectCommand="SELECT book_issue_table.member_id, book_issue_table.book_id, book_issue_table.book_name, book_issue_table.due_date, member_master_tbl.email FROM book_issue_table INNER JOIN member_master_tbl ON book_issue_table.member_id = member_master_tbl.member_id"></asp:SqlDataSource>
                          <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
                              <Columns>
                                  <asp:HyperLinkField NavigateUrl="https://mail.google.com/mail/u/0/#signin" Target="_blank" Text="Click Here" FooterText="Click Here">
                                      <ControlStyle Font-Bold="True"></ControlStyle>
                                  </asp:HyperLinkField>
                              </Columns>
                          </asp:GridView>
                        </div>
                      </div>
                  </div>


              </div>           
          </div>
      </div>
    </center>
</asp:Content>
