<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="Online_Library_Management_System.userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">


    <%--geting center and creating container--%>
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
                                <img src="images/member%20login.png" />

                            </center>
                            </div>
                        </div>
                        <%-- heading part--%>
                        <div class="row">
                            <div class="col">
                            <center>
                                <h3> Member Login</h3>
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

                    <%--text boxes member login--%>
                        <div class="row">
                            <div class="col">
                                <lable > Member ID</lable>
                                <div class="form-group" ">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID" MaxLength="4"></asp:TextBox>
                                    </div>

                                <lable> Member Password</lable>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Member Password" TextMode="Password" MaxLength="4"></asp:TextBox>
                                    </div>

                                <div class="form-group" style="display: flex; justify-content: center; gap: 10px";>
                                   <a href="user signup.aspx"><input class="btn btn-warning" id="Button2" type="button"  value="Sign Up" style="width: 230px; height: 38px;" />
                                   <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Login" Style="width: 230px; height: 38px;" OnClick="Button1_Click" />           
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx">Back to home</a> <br><br>
                </div>
            </div>
        </div>
    

</asp:Content>
