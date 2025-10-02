<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="Online_Library_Management_System.adminlogin" %>
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


    <div class="container">
    <div class="row">
        <div class="col-md-6 mx-auto">
            <%-- card creating part--%>
            <div class="card">  
                <div class="card-body">
                    <div class="center-content">
                    <div class="row">
                        <div class="col">
                        <center>
                            <img height="200px" src="images/admin1.jpg" />

                        </center>
                        </div>
                    </div>
                    <%-- heading part--%>
                    <div class="row">
                        <div class="col">
                        <center>
                            <h3> Admin Login</h3>
                        </center>
                        </div>
                    </div>
                </div>
                    <%-- deviding--%>
                    <div class="row">
                        <div class="col">
                            <hr />
                        </div>
                    </div>

                <%--text boxes member login--%>
                    <div class="row">
                        <div class="col">
                            <lable > Admin Name</lable>
                            <div class="form-group" ">
                                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Admin Name"></asp:TextBox>

                                </div>
                            <lable> Password</lable>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password" MaxLength="4"></asp:TextBox>

                            </div>

                            <div class="form-group" style="display: flex; justify-content: center; gap: 10px";>
                                <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Admin Login" OnClick="Button1_Click" Style="width: 260px; height: 38px;" />
 
                            </div>


                        </div>
                    </div>
                </div>

                </div>

            <a href="homepage.aspx" class="custom-link link-left">Back to home <br><br>
            </div>


        </div>
    </div>


</asp:Content>
