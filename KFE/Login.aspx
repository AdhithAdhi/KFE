<%@ Page Title="" Language="C#" MasterPageFile="~/LoginLayout.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KFE.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>User Login</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <div class="login-logo">
        <a href="/Index"><b>KFE </b>Login</a>
    </div>
    <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">Login to shop</p>

            <form id="account" method="post" runat="server">
                <div class="text-danger"></div>
                <div class="form-group input-group mb-3">
                    <asp:TextBox ID="Username" class="form-control" required="" placeholder="Email Or Phone"
                        runat="server" TextMode="Email"></asp:TextBox>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>
                <div class="form-group input-group mb-3">
                    <asp:TextBox ID="UserPassword" class="form-control" placeholder="Password"
                        runat="server" TextMode="Password"></asp:TextBox>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserPassword" CssClass="text-danger" ErrorMessage="Must enter password"></asp:RequiredFieldValidator>
                <%-- <div class="form-group">
                    <div class="icheck-primary">
                        <input type="checkbox" id="remember">
                        <label for="remember">
                            Remember Me
             
                        </label>
                    </div>
                </div>--%>
                <div class="form-group">
                    <asp:Button ID="LoginBtn" runat="server" Text="Login" class="btn btn-primary float-right" OnClick="LoginBtn_Click"/>
                </div>
            </form>
            <div class="social-auth-links">
                <p class="mb-1">
                    <a href="forgot-password.html">I forgot my password</a>
                </p>
                <p class="mb-0">
                    <a href="/Register" class="text-center">New User? Register Here</a>
                </p>
            </div>
        </div>
        <!-- /.login-card-body -->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
