<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="user signup.aspx.cs" Inherits="Online_Library_Management_System.member_signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        

        .card {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        border: 1px solid #dee2e6; /* Added border */
        }

        .card-body {
            padding: 25px;
        }

        .form-group{
            margin-bottom: 15px;
        }

        label {
        font-weight: 500;
        display: block;
        margin-bottom: 5px;
        }

        .form-control:focus {
        border-color: #80bdff;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
    }

        .img-fluid {
        max-width: 100%;
        height: auto;
    }

    .center-content {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #212529;
            width: 100%;
            height: 38px;
        }

    

    
    



        /* Media query for mobile responsiveness */
@media (max-width: 767px) {
    .col-md-6, .col-md-4 {
        width: 100%;
        margin-bottom: 15px;
    }

    .row { /*added for correct the row spacing*/
        margin-left: 0px;
        margin-right: 0px;
    }
}


    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">


    <%--geting center and creating container--%>
<div class="container">
    <div class="row">
        <div class="col-md-8 mx-auto">
            <%-- card creating part--%>
            <div class="card">  
                <div class="card-body">
                    <div class="center-content">
                    <div class="row">
                        <div class="col">
                        <center>
                            <img width="40px" src="images/register%20form.png" class="img-fluid"/>
                        </center>
                        </div>
                    </div>
                    <%-- heading part--%>
                    <div class="row">
                        <div class="col">
                        <center>
                            <h5> Registration Form</h5>
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
                        <div class="col-md-6">
                            <lable> Full Name</lable>
                            <div class="form-group">
                
                                <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Ful Name"></asp:TextBox>
                            </div>
                        </div>
                    

                        <div class="col-md-6">
                           <lable> Date Of Birth</lable>
                             <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Date Of Birth" TextMode="Date"></asp:TextBox>
                             </div> 
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-md-6">
                            <lable> Contact Number</lable>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact Number" TextMode="Phone"></asp:TextBox>
                            </div>
                        </div>
                   
                        <div class="col-md-6">
                           <lable> Mail ID</lable>
                             <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Mail ID" TextMode="Email"></asp:TextBox>
                             </div> 
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-md-4">
                            <lable> City Name</lable>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="city Name"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-4">
                           <lable> Postal Code </lable>
                             <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Postal Code"></asp:TextBox>
                             </div> 
                        </div>

                        <div class="col-md-4">
                           <lable> district</lable>
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
                    <div class="col">
                        <lable> Full Address</lable>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Full Address" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                </div>


                <%--Pill badge--%>
                             <div class="row">
                                 <div class="col">
                                     <div class="form-group" style="display: flex; justify-content: center; gap: 10px";>
                                         <span class="badge badge-pill badge-primary">Credentials</span>
                                     </div>
         
                                 </div>
                             </div>


                    <div class="row">
                        <div class="col-md-6">
                            <lable> User ID</lable>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="User ID" TextMode="Number" MaxLength="4"></asp:TextBox>
                            </div>
                        </div>
                   
                        <div class="col-md-6">
                           <lable> Password</lable>
                             <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Password" TextMode="Password" MaxLength="4"></asp:TextBox>
                             </div> 
                        </div>
                    </div>

                

               
                    <div class="row">
                        <div class="col">
                            <div>
                                <center>
                                    <asp:Button ID="Button2" runat="server" Text="Signup" style="width: 100%; height: 38px;" cssclass="btn btn-warning" OnClick="Button2_Click" /> <br /><br />
                                </center>
                            </div>
                            
                        </div>
                    </div>
                    </div>
        </div> 
            <a href="userlogin.aspx">Back to Member Login</a> <br/> <br />
        </div>
    </div>    
</div>   


</asp:Content>
