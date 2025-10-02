<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminpublishermanagement.aspx.cs" Inherits="Online_Library_Management_System.adminpublishermanagement" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">
        $(document).ready(function () {
            // Wrap the first row in <thead> if it's not already there
            $(".table").each(function () {
                // Check if <thead> is missing and add it if necessary
                if ($(this).find("thead").length === 0) {
                    // Move the first row to <thead>
                    let headerRow = $(this).find("tr:first");
                    $(this).prepend($("<thead></thead>").append(headerRow));
                }
            });
            // Initialize DataTable
            $('.table').DataTable(); // Ensure you have DataTables loaded in your project
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

          <div class="container">
  <div class="row">
      <div class="col-md-6">
          <%-- card creating part--%>
          <div class="card">  
              <div class="card-body">
                  <div class="center-contant">
                  <div class="row">
                     
                  </div>
                  <%-- heading part--%>
                  <div class="row">
                      <div class="col">
                      <center>
                          <h5> Publisher Details</h5>
                         
                          
                      </center>
                      </div>
                  </div>

                  <div class="row">
                    <div class="col">
                    <center>
                        <img width="40px" src="images/adminpublishermanagement.png" />
                    </center>
                    </div>
                </div>

              </div>
                  <%-- heading part--%>
                  <div class="row">
                      <div class="col">
                          <hr />
                      </div>
                  </div>


                  <div class="row">
                      <div class="col-md-4">
                          <lable> Publisher ID</lable>
                          <div class="form-group">
                            <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Publisher ID" ></asp:TextBox>
                                <asp:Button Class="btn btn-dark" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                             </div>
                          </div>
                      </div>
                  

                      <div class="col-md-8">
                         <lable> Publisher Name</lable>
                           <div class="form-group">
                               <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Publisher Name" ></asp:TextBox>
                           </div> 
                      </div>
                  </div>







             
                  <div class="row">
                      <div class="col-4">   
                          <asp:Button Class="btn btn-1g btn-block btn-primary" ID="Button2" runat="server" Text="Add" OnClick="Button2_Click" />
                      </div>
                      <div class="col-4">   
                          <asp:Button Class="btn btn-1g btn-block btn-warning" ID="Button3" runat="server" Text="Update" OnClick="Button3_Click" />
                      </div>
                      <div class="col-4">   
                          <asp:Button Class="btn btn-1g btn-block btn-danger" ID="Button4" runat="server" Text="Delete" OnClick="Button4_Click" />
                      </div>
                  </div>
                  </div>
              <br /> 

      </div> 
           <a href="homepage.aspx"> << Back to home</a> <br>
      </div>




<%------------------------------------------------------------------Right side-----------------------------------------------------------------%>



      <div class="col-md-6">
          <div class="card">  
              <div class="card-body">
                  <div class="row">
                      <div class="col">
                      <center>
                          <h4>Publisher List</h4>
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
                          <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnSelecting="SqlDataSource1_Selecting" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString4 %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                          <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>
                          </div>
                      </div>
                  </div>





      </div> 
          
      </div>

      </div>

  </div>

</asp:Content>
