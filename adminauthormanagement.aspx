<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="Online_Library_Management_System.adminauthormanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            // Wrap the first row in <thead> if it's not already there
            $(".table").each(function () {
                if ($(this).find("thead").length === 0) {
                    let headerRow = $(this).find("tr:first");
                    $(this).prepend($("<thead></thead>").append(headerRow));
                }
            });

            // Initialize DataTable with responsive option
            $('.table').DataTable({
                "responsive": true // This is the key for responsiveness
            });
        });
    </script>
    <style>
        /* Optional: Improve table responsiveness on very small screens */
        @media (max-width: 767px) {
            .table-responsive {
                overflow-x: auto; /* Enable horizontal scrolling if needed */
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="card mb-3"> <%-- Added margin-bottom for spacing --%>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h5>Author Details</h5>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="40px" src="images/adminauthormanagement.jpg" alt="Author Image" /> <%-- Added alt attribute --%>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row mb-3"> <%-- Added margin-bottom for spacing --%>
                            <div class="col-md-4">
                                <label for="<%= TextBox2.ClientID %>">Author ID</label> <%-- Added for attribute --%>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Author ID"></asp:TextBox>
                                        <asp:Button Class="btn btn-dark" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label for="<%= TextBox1.ClientID %>">Author Name</label> <%-- Added for attribute --%>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Author Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4 mb-2"> <%-- Added margin-bottom for spacing --%>
                                <asp:Button Class="btn btn-lg btn-block btn-primary" ID="Button2" runat="server" Text="Add" OnClick="Button2_Click" /> <%-- Corrected class name --%>
                            </div>
                            <div class="col-4 mb-2"> <%-- Added margin-bottom for spacing --%>
                                <asp:Button Class="btn btn-lg btn-block btn-warning" ID="Button3" runat="server" Text="Update" OnClick="Button3_Click" /> <%-- Corrected class name --%>
                            </div>
                            <div class="col-4 mb-2"> <%-- Added margin-bottom for spacing --%>
                                <asp:Button Class="btn btn-lg btn-block btn-danger" ID="Button4" runat="server" Text="Delete" OnClick="Button4_Click" /> <%-- Corrected class name --%>
                            </div>
                        </div>
                    </div>
                    <a href="homepage.aspx"> << Back to home</a><br>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card mb-3"> <%-- Added margin-bottom for spacing --%>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author List</h4>
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
                                <div class="table-responsive"> <%-- Added table-responsive div --%>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString4 %>" ProviderName="<%$ ConnectionStrings:elibraryDBConnectionString4.ProviderName %>" SelectCommand="SELECT * FROM [author_master_tbl]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
                                    <asp:GridView Class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>