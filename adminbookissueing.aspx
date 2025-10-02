<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookissueing.aspx.cs" Inherits="Online_Library_Management_System.adminbookissueing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.table').DataTable({
                "responsive": true // Key for responsiveness
            });
        });
    </script>
    <style>
        /* Optional: Improve table responsiveness on very small screens */
        @media (max-width: 767px) {
            .table-responsive {
                overflow-x: auto;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card mb-3"> <%-- Added margin bottom --%>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h5>Booking Issuing</h5>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="40px" src="images/book2.png" alt="Book Image" /> 
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row mb-3"> 
                            <div class="col-md-6">
                                <label for="<%= TextBox1.ClientID %>">Member ID</label> 
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="<%= TextBox2.ClientID %>">Book ID</label> 
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox Class="form-control" ID="TextBox2" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:Button Class="btn btn-dark" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>

                         <div class="row mb-3"> 
                            <div class="col-md-6">
                                <label for="<%= TextBox3.ClientID %>">Member Name</label> 
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="TextBox3" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="<%= TextBox4.ClientID %>">Book Name</label> 
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="TextBox4" runat="server" placeholder="Book Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-3"> 
                            <div class="col-md-6">
                                <label for="<%= TextBox5.ClientID %>">Borrowing Date</label> 
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="<%= TextBox6.ClientID %>">Returning Date</label> 
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6 mb-2"> 
                                <asp:Button Class="btn btn-lg btn-block btn-danger" ID="Button2" runat="server" Text="Return" OnClick="Button2_Click" /> <%-- Corrected class name --%>
                            </div>
                            <div class="col-6 mb-2"> 
                                <asp:Button Class="btn btn-lg btn-block btn-success" ID="Button3" runat="server" Text="Issue" OnClick="Button3_Click" /> <%-- Corrected class name --%>
                            </div>
                        </div>
                    </div>
                    <a href="homepage.aspx"> << Back to home</a><br>
                </div>
            </div>

            <div class="col-md-7">
                <div class="card mb-3"> 
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Issued Book List</h4>
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:elibraryDBConnectionString4 %>' SelectCommand="SELECT * FROM [book_issue_table]"></asp:SqlDataSource>
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                                        <Columns>
                                        </Columns>
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