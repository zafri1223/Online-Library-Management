<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="Online_Library_Management_System.userprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Add viewport meta tag -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div class="container-fluid">
        <div class="row">
            <!-- Left Column -->
            <div class="col-lg-5 col-md-12">
                <div class="card w-100">
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                <img class="img-fluid" width="40px" src="images/register%20form.png" alt="Profile" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                <h5>Your Profile</h5>
                                <span>Account Status - </span>
                                <asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col"><hr /></div>
                        </div>

                        <!-- Form Fields -->
                        <div class="row">
                            <div class="col-md-6 col-12">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 col-12">
                                <label>Date Of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Date Of Birth" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 col-12">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact Number" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 col-12">
                                <label>Mail ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Mail ID" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 col-12">
                                <label>City Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="City Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4 col-12">
                                <label>Postal Code</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Postal Code"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4 col-12">
                                <label>Province</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                     <asp:ListItem Text="--" Value="--"></asp:ListItem>
                                     <asp:ListItem Text="Jaffna" Value="Jaffna"></asp:ListItem>
                                     <asp:ListItem Text="Kilinochchi" Value="Kilinochchi"></asp:ListItem>
                                     <asp:ListItem Text="Mannar" Value="Mannar"></asp:ListItem>
                                     <asp:ListItem Text="Mullaitivu" Value="Mullaitivu"></asp:ListItem>
                                     <asp:ListItem Text="Vavuniya" Value="Vavuniya"></asp:ListItem>
                                     <asp:ListItem Text="Puttalam" Value="Puttalam"></asp:ListItem>
                                     <asp:ListItem Text="Kurunegala" Value="Kurunegala"></asp:ListItem>
                                     <asp:ListItem Text="Gampaha" Value="Gampaha"></asp:ListItem>
                                     <asp:ListItem Text="Colombo" Value="Colombo"></asp:ListItem>
                                     <asp:ListItem Text="Kalutara" Value="Kalutara"></asp:ListItem>
                                     <asp:ListItem Text="Anuradhapura" Value="Anuradhapura"></asp:ListItem>
                                     <asp:ListItem Text="Polonnaruwa" Value="Polonnaruwa"></asp:ListItem>
                                     <asp:ListItem Text="Matale" Value="Matale"></asp:ListItem>
                                     <asp:ListItem Text="Kandy" Value="Kandy"></asp:ListItem>
                                     <asp:ListItem Text="Nuwara Eliya" Value="Nuwara Eliya"></asp:ListItem>
                                     <asp:ListItem Text="Kegalle" Value="Kegalle"></asp:ListItem>
                                     <asp:ListItem Text="Ratnapura" Value="select"></asp:ListItem>
                                     <asp:ListItem Text="Trincomalee" Value="Trincomalee"></asp:ListItem>
                                     <asp:ListItem Text="Batticaloa" Value="Batticaloa"></asp:ListItem>
                                     <asp:ListItem Text="Ampara" Value="Ampara"></asp:ListItem>
                                     <asp:ListItem Text="Badulla" Value="Badulla"></asp:ListItem>
                                     <asp:ListItem Text="Monaragala" Value="Monaragala"></asp:ListItem>
                                     <asp:ListItem Text="Hambantota" Value="Hambantota"></asp:ListItem>
                                     <asp:ListItem Text="Matara" Value="Matara"></asp:ListItem>
                                     <asp:ListItem Text="Galle" Value="Galle"></asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Full Address" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <span class="badge badge-pill badge-primary">Credentials</span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 col-12">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="User ID" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4 col-12">
                                <label>Old Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Old Password" TextMode="Password" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4 col-12">
                                <label>New Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 ">
                                <div class="col-12 ">
                            <center>
                             <p>
                                <B> When updating details, don't forget to set a password.<br />
                                 The password must be set with only 4 letters. </B>
                             </p>
                            </center>
                        </div>
                                <asp:Button CssClass="btn btn-success btn-lg" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Column -->
            <div class="col-lg-7 col-md-12 mt-3">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                <img class="img-fluid" width="40px" src="images/book.png" alt="Issued Books" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                <h5>Issued Books</h5>
                                <asp:Label class="badge badge-pill badge-info" ID="Label2" runat="server" Text="Your Books Info"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col"><hr /></div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:GridView CssClass="table table-striped table-bordered" ID="GridView1" runat="server" OnRowDataBound="Gridview1_RowDataBound"></asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
