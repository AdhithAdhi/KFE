<%@ Page Title="" Language="C#" MasterPageFile="~/LoginLayout.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="KFE.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>User Register</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server"><div class="login-logo">
        <a href="/Index"><b>KFE </b>Register</a>
    </div>
    <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">Register a new membership</p>
            <form id="account" method="post" runat="server">

                <div class="row">
            <div  class="col-sm-6">
                <div class="text-danger"></div>
                <div class="form-group input-group mb-3">
                    <asp:TextBox ID="NameText" class="form-control" required="" placeholder="Name"
                        runat="server" TextMode="SingleLine"></asp:TextBox>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-user"></span>
                        </div>
                    </div>
                </div>
                <div class="form-group input-group mb-3">
                    <asp:TextBox ID="UserMail" class="form-control" required="" placeholder="Email"
                        runat="server" TextMode="Email"></asp:TextBox>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>
                <div class="form-group input-group mb-3">
                    <asp:TextBox ID="PhoneText" class="form-control" required="" placeholder="Phone Number"
                        runat="server" TextMode="Number"></asp:TextBox>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-mobile"></span>
                        </div>
                    </div>
                </div>
                <div class="form-group input-group mb-3">
                    <asp:TextBox ID="PinCodeTextBox" class="form-control datetimepicker-input" required="" data-target="#reservationdate" placeholder="Pincode"
                        runat="server" TextMode="Number"></asp:TextBox>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-map-marker-alt mr-1"></span>
                        </div>
                    </div>

                </div>
            </div>
            <div  class="col-sm-6">
                <div class="text-danger"></div>
                <div class="form-group input-group mb-3">
                    <asp:TextBox ID="adr_Textarea" class="form-control" required="" placeholder="Enter Address" runat="server" Rows="2" Height="90px" TextMode="MultiLine"></asp:TextBox>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-home"></span>
                        </div>
                    </div>
                </div>
                <div class="form-group input-group mb-3">
                    <asp:TextBox ID="UserPassword" class="form-control" required="" placeholder="Password"
                        runat="server" TextMode="Password"></asp:TextBox>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="form-group input-group mb-3">
                    <asp:TextBox ID="TextBox3" class="form-control" required="" placeholder="Confirm Password"
                        runat="server" TextMode="Password"></asp:TextBox>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserPassword" CssClass="text-danger" ErrorMessage="Must enter password"></asp:RequiredFieldValidator>
               <%-- <div class="form-group">
                    <div class="icheck-primary">
                        <input type="checkbox" id="remember">
                        <label for="remember">
                            Remember Me
             
                        </label>
                    </div>
                </div>--%>
            </div>
                </div>
                
                <div class="row">
                    <div class="col-8">
                        <%--<div class="icheck-primary">
                            <input type="checkbox" id="agreeTerms" name="terms" value="agree">
                            <label for="agreeTerms">
                                I agree to the <a href="#">terms</a>
                            </label>
                        </div>--%>
                    </div>
                    <!-- /.col -->
                    <div class="col-4">
                    <asp:Button ID="Button1" runat="server" Text="Register" class="btn btn-primary float-right" OnClick="RegisterBtn_Click" />
                    </div>
                    <!-- /.col -->
                </div>   
            </form>
            <div class="social-auth-links">
                <a href="/Login" class="text-center">I already have a membership</a>
            </div>
        </div>
        <!-- /.login-card-body -->
    </div>
    <div class="callout callout-info">
        By clicking Register you agree to our <a class="text-primary">Terms and Conditions</a>.
           
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <!-- jQuery -->
<!-- InputMask -->
<script src="template/Admin/plugins/moment/moment.min.js"></script>

<script src="template/Admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Bootstrap Switch -->
<!-- Page script -->
    <script>
</script>
</asp:Content>
