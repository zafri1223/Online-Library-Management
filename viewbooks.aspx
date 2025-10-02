<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs" Inherits="Online_Library_Management_System.viewbooks" %>
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
        <div class="col-md-10 mx-auto">
                 <div class="row">
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
        <div>
    <a href="homepage.aspx">Back to home</a> <br><br>
</div>
    </div>


</asp:Content>
