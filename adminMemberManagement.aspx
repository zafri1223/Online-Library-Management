<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminMemberManagement.aspx.cs" Inherits="Online_Library_Management_System.adminMemberManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .col-form-label{
             font-weight: 500;
        display: block;
        margin-bottom: 1px;
        }

        .card{
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        border: 1px solid #5E6265;
        }
        

    </style>

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


    <div class="container-fluid">
  <div class="row">
      <div class="col-md-5">
          <%-- card creating part--%>
          <div class="card">  
              <div class="card-body">
                  <div class="center-content">
                  <div class="row">
                     
                  </div>


                  <%-- heading part--%>
                  <div class="row">
                      <div class="col">
                      <center>
                          <h5> Member Details</h5>
                         
                          
                      </center>
                      </div>
                  </div>

                  <div class="row">
                    <div class="col">
                    <center>
                        <img width="40px" src="images/memberdetails.png" />
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

                      <div class="col-md-3">
                           <lable class="col-form-label"> Member ID</lable>
                             <div class="form-group">
                                 <div class="input-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID" ></asp:TextBox>
                                     <asp:LinkButton CssClass="btn btn-success ml-1" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"><i class="fas fa-check-double"></i></asp:LinkButton>
                                   </div>
                             </div> 
                        </div>


                      <div class="col-md-4" >
                          <lable class="col-form-label"> Full Name</lable>
                          <div class="form-group"> 
                              <asp:TextBox Class="form-control" ID="TextBox2" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                          </div>
                      </div>

                      <div class="col-md-5">
                          <lable class="col-form-label"> Account Status</lable>
                          <div class="form-group">
                              <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Account Status" ReadOnly="True"></asp:TextBox>
                                  <asp:LinkButton CssClass="btn btn-success ml-1 mr-1" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-check-double"></i></asp:LinkButton>
                                  <asp:LinkButton CssClass="btn btn-warning mr-1" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><i class="fas fa-pause"></i></asp:LinkButton>
                                  <asp:LinkButton CssClass="btn btn-danger mr-1" ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"><i class="fas fa-times"></i></asp:LinkButton>

                              </div>
                           </div>
                      </div>
                  </div>



                  <div class="row">
                          <div class="col-md-4">
                              <lable class="col-form-label"> Date Of Birth</lable>
                              <div class="form-group">
                                  <asp:TextBox Class="form-control" ID="TextBox3" runat="server" placeholder="Date Of Birth" ReadOnly="True" TextMode="Date"></asp:TextBox>
                              </div>
                          </div>


                          <div class="col-md-4">
                                <lable class="col-form-label"> Contact NUmber</lable>
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="TextBox4" runat="server" placeholder="Contact NUmber" ReadOnly="True" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <lable class="col-form-label">Email ID</lable>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="Email ID" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                      </div>

                       
                      <div class="row">
                        <div class="col-md-4">
                            <lable class="col-form-label"> City Name</lable>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="city Name" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-4">
                           <lable class="col-form-label"> Postal Code </lable>
                             <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Postal Code" ReadOnly="True"></asp:TextBox>
                             </div> 
                        </div>

                          <div class="col-md-4">
                               <lable class="col-form-label"> District </lable>
                                 <div class="form-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="District" ReadOnly="True"></asp:TextBox>
                                 </div> 
                            </div>
                       </div>

                      
                     <div class="row">
                         <div class="col">
                             <label class="col-form-label">Full Address</label>
                             <div class="form-group">
                                 <asp:TextBox class="form-control" ID="TextBox5" runat="server" placeholder="Full Address" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                             </div>
                         </div>
                     </div>
 
             
                  <div class="row">
                      <div class="col-12">   
                          <asp:Button Class="btn btn-1g btn-block btn-danger" ID="Button2" runat="server" Text="Delete  User Permanently" OnClick="Button2_Click" />
                      </div>
                  </div>
              
              </div>
      </div> 
           <a href="homepage.aspx"> << Back to home</a> 
      </div>

<%------------------------------------------------------------------Right side-----------------------------------------------------------------%>

      <div class="col-md-7">
          <div class="card">  
              <div class="card-body">
                  <div class="row">
                      <div class="col">
                      <center>
                          <h4>Members List</h4>
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
                          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString4 %>" SelectCommand="SELECT * FROM [member_master_tbl]" ProviderName="<%$ ConnectionStrings:elibraryDBConnectionString4.ProviderName %>"></asp:SqlDataSource>
                          <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1"></asp:GridView> 
                          </div>
                      </div>
                  </div>
              </div>           
          </div>
      </div>
  </div>
</div>


</asp:Content>
