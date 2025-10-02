<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="Online_Library_Management_System.adminbookinventory" %>

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


        function readyURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#imgview').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
        }
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
                                    <h5>Book Details</h5>


                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" height="50px" width="40px"  src="images/memberdetails.png" />
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
                        <div class="col">
                            <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />
                        </div>
                        <br />
                        <br />
                    </div>


                    <div class="row">

                        <div class="col-md-4">
                            <lable>Book ID</lable>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Book ID"></asp:TextBox>
                                    <asp:Button CssClass="btn btn-dark" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>


                        <div class="col-md-8">
                            <lable>Book Name</lable>
                            <div class="form-group">
                                <asp:TextBox Class="form-control" ID="TextBox2" runat="server" placeholder="Book Name"></asp:TextBox>
                            </div>
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-md-4">
                            <lable>Language</lable>
                            <div class="form-group">
                                <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                    <asp:ListItem Text="--" Value="--"></asp:ListItem>
                                    <asp:ListItem Text="English" Value="English"></asp:ListItem>
                                    <asp:ListItem Text="Tamil" Value="Tamil"></asp:ListItem>
                                    <asp:ListItem Text="Mandarin Chinese" Value="Mandarin Chinese"></asp:ListItem>
                                    <asp:ListItem Text="Hindi" Value="Hindi"></asp:ListItem>
                                    <asp:ListItem Text="Arabic" Value="Arabic"></asp:ListItem>
                                    <asp:ListItem Text="German" Value="German"></asp:ListItem>
                                </asp:DropDownList>

                            </div>

                            <lable>Publisher Name</lable>
                            <div class="form-group">
                                <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server">
                                    <asp:ListItem Text="--" Value="--"></asp:ListItem>
                                    <asp:ListItem Text="P1" Value="P1"></asp:ListItem>
                                    <asp:ListItem Text="P2" Value="P2"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <lable> Author Name</lable>
                            <div class="form-group">
                                <asp:DropDownList CssClass="form-control" ID="DropDownList3" runat="server">
                                    <asp:ListItem Text="--" Value="--"></asp:ListItem>
                                    <asp:ListItem Text="A1" Value="A1"></asp:ListItem>
                                    <asp:ListItem Text="A2" Value="A2"></asp:ListItem>
                                    <asp:ListItem Text="A3 " Value="A3 "></asp:ListItem>
                                    
                                </asp:DropDownList>
                            </div>

                            <lable>Published Date</lable>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>  
                            </div>
                        </div>

                        <div class="col-md-4">
                            <lable>Genre</lable>
                            <div class="form-group">
                                <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                                   <asp:ListItem Text="Action " Value="Action "></asp:ListItem> 
                                    <asp:ListItem Text="Adventure " Value="Adventure "></asp:ListItem> 
                                    <asp:ListItem Text="Comic " Value="Comic "></asp:ListItem> 
                                    <asp:ListItem Text="Self Help " Value="Self Help "></asp:ListItem> 
                                    <asp:ListItem Text="MOtivation " Value="Motivation "></asp:ListItem> 
                                    <asp:ListItem Text="Healthy living " Value="Healthy Living "></asp:ListItem> 
                                    <asp:ListItem Text="Crime " Value="Crime "></asp:ListItem> 
                                    <asp:ListItem Text="Drama " Value="Drama "></asp:ListItem> 
                                    <asp:ListItem Text="Fantacy " Value="Fantacy "></asp:ListItem> 
                                    <asp:ListItem Text="Horror " Value="Horror "></asp:ListItem> 
                                    <asp:ListItem Text="Poetry " Value="Poetry "></asp:ListItem> 
                                    <asp:ListItem Text="Personal Development " Value="Personal Development "></asp:ListItem> 
                                    <asp:ListItem Text="Business " Value="Business "></asp:ListItem> 
                                    <asp:ListItem Text="Art " Value="Art "></asp:ListItem> 
                                    <asp:ListItem Text="Autobiography " Value="Autobiography "></asp:ListItem> 
                                </asp:ListBox>
                            </div>
                        </div>
                    </div>

                     <div class="row">
                         <div class="col-md-4">
                             <lable> Edition</lable>
                             <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Edition"></asp:TextBox>
                             </div>
                         </div>

                         <div class="col-md-4">
                             <lable> Book Cost</lable>
                             <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Book Cost"></asp:TextBox>
                             </div>
                         </div>

                         <div class="col-md-4">
                            <lable> Pages</lable>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Pages" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>
                     </div>

                     <div class="row">
                         <div class="col-md-4">
                             <lable> Actual Stock</lable>
                             <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>
                             </div>
                         </div>

                         <div class="col-md-4">
                             <lable> Current Stock</lable>
                             <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Current Stock" ReadOnly="True" TextMode="Number"></asp:TextBox>
                             </div>
                         </div>

                         <div class="col-md-4">
                            <lable> Issued Books</lable>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Issued Books" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                     </div>
                
                    <div class="row">
                        <div class="col">
                            <label>Book Description</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" TextMode="MultiLine" placeholder="Book Description"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                  <div class="row">
                      <div class="col-4">   
                          <asp:Button Class="btn btn-1g btn-block btn-danger" ID="Button2" runat="server" Text="Delete" OnClick="Button2_Click" />
                      </div>
                      <div class="col-4">   
                          <asp:Button Class="btn btn-1g btn-block btn-primary" ID="Button3" runat="server" Text="Update" OnClick="Button3_Click" />
                      </div>
                      <div class="col-4">   
                          <asp:Button Class="btn btn-1g btn-block btn-success" ID="Button4" runat="server" Text="Add" OnClick="Button4_Click" />
                      </div>
                  </div> 
                    </div>

                        


                    




                </div>
            <a href="homepage.aspx"><< Back to home</a>
            <br/> 
        </div>




        <%------------------------------------------------------------------Right side-----------------------------------------------------------------%>



        <div class="col-md-7">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <center>
                                <h4>Books Inventory List</h4>
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString4 %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                            <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="true" SortExpression="book_id" />
                                    <asp:TemplateField>

                                        <ItemTemplate>
                                            <dev class="container-fluid">
                                                <dev class="row">
                                                    <dev class="col-lg-10">
                                                       <dev class="row">
                                                           <dev class="col-12">
                                                               <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                           </dev>
                                                       </dev>
                                             <%----------------2----------------------------------------------------------------------------------%>
                                                        <dev class="row">
                                                            <dev class="col-12">
                                                                <span>Author -</span>
                                                                <asp:Label ID="Label3" runat="server" Font-Bold="true" Text='<%# Eval("author_name") %>'></asp:Label> &nbsp| 
                                                                <span> Genre - </span> 
                                                                <asp:Label ID="Label5" Font-Bold="true" runat="server" Text='<%# Eval("genre") %>'></asp:Label> &nbsp| 
                                                                <span> Language - </span> 
                                                                <asp:Label ID="Label6" Font-Bold="true" runat="server" Text='<%# Eval("language") %>'></asp:Label>
                                                            </dev>
                                                       </dev>
                                            <%-------------------3-------------------------------------------------------------------------------%>
                                                        <dev class="row">
                                                            <dev class="col-12">
                                                                <span>Publisher -</span>
                                                                <asp:Label ID="Lable3" runat="server" Font-Bold="true" Text='<%# Eval("publisher_name") %>'></asp:Label> &nbsp| 
                                                                <span> Published Date - </span> 
                                                                <asp:Label ID="Label2" Font-Bold="true" runat="server" Text='<%# Eval("publish_date") %>'></asp:Label> &nbsp| 
                                                                <span> Pages - </span> 
                                                                <asp:Label ID="Label4" Font-Bold="true" runat="server" Text='<%# Eval("no_of_pages") %>'></asp:Label> &nbsp| 
                                                                <span> Edtion - </span> 
                                                                <asp:Label ID="Label13" Font-Bold="true" runat="server" Text='<%# Eval("edition") %>'></asp:Label>
                                                            </dev>
                                                       </dev>
                                            <%----------------4----------------------------------------------------------------------------------%>
                                                        <dev class="row">
                                                            <dev class="col-12">
                                                                <span>Cost -</span>
                                                                <asp:Label ID="Label7" runat="server" Font-Bold="true" Text='<%# Eval("book_cost") %>'></asp:Label> &nbsp| 
                                                                <span> Actiual Cost - </span> 
                                                                <asp:Label ID="Label8" Font-Bold="true" runat="server" Text='<%# Eval("actual_stock") %>'></asp:Label> &nbsp| 
                                                                <span> Available Stock - </span> 
                                                                <asp:Label ID="Label9" Font-Bold="true" runat="server" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                            </dev>
                                                       </dev>
                                          <%----------------5----------------------------------------------------------------------------------%>
                                                        <dev class="row">
                                                            <dev class="col-12">
                                                                <span>Description -</span>
                                                                <asp:Label ID="Label10" runat="server" Font-Bold="true" Text='<%# Eval("book_description") %>'></asp:Label>
                                                                
                                                            </dev>
                                                       </dev>


                                                    </dev>

                                                    <dev class="col-lg-2">
                                                        <asp:Image class="img-fluid " ID="image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' Width="100px" Height="150px"/>
                                                    </dev>
                                                </dev>
                                            </dev>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>



</asp:Content>
