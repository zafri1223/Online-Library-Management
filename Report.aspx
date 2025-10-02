<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Online_Library_Management_System.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

<div class="container">
  <div class="row">
      <div class="col-md-6 mx-auto" style="margin-bottom: 20px;">
          <%-- card creating part--%>
          <div class="card">  
              <div class="card-body">
                  <div class="row">
                      <div class="col">
                      <center>
                          <h3>Stock As At Report</h3>
                      </center>
                         <asp:Button ID="Button2" runat="server" Text="Generate" cssclass="btn btn-warning responsive-button" Font-Bold="true" OnClick="Button2_Click"  />
                     </div>
                  </div>        
                 </div>
            </div>
        </div>  <br /><br />


       <div class="col-md-6 mx-auto"  style="margin-bottom: 20px;">
     <%-- card creating part--%>
     <div class="card">  
         <div class="card-body">
             <div class="row">
                 <div class="col-12">
                 <center>
                     <h3>Customer Report</h3>
                 </center>
                        
                         <asp:Button ID="Button1" runat="server" Text="Generate" cssclass="btn btn-warning responsive-button" Font-Bold="true" OnClick="Button1_Click"  />
                  </div>
               </div>
             </div>
         </div>
     </div>  

      <div class="container">
  <div class="row">
      <div class="col-md-6 mx-auto" style="margin-bottom: 20px;">
          <%-- card creating part--%>
          <div class="card">  
              <div class="card-body">
                  <div class="row">
                      <div class="col">
                      <center>
                          <h3>Book Inventory Report</h3>
                      </center>
                         <asp:Button ID="Button3" runat="server" Text="Generate" cssclass="btn btn-warning responsive-button" Font-Bold="true" OnClick="Button3_Click"  />
                     </div>
                  </div>        
                 </div>
            </div>
        </div> <br /> 


       <div class="col-md-6 mx-auto" style="margin-bottom: 20px;">
     <%-- card creating part--%>
     <div class="card">  
         <div class="card-body">
             <div class="row">
                 <div class="col-12">
                 <center>
                     <h3>Publisher Report</h3>
                 </center>
                        
                         <asp:Button ID="Button4" runat="server" Text="Generate" cssclass="btn btn-warning responsive-button" Font-Bold="true" OnClick="Button4_Click"  />
                  </div>
               </div>
             </div>
         </div>
     </div>
</div>

        

  </div>

</div>

        

  </div>


</asp:Content>

  