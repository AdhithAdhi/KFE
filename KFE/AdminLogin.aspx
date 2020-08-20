<%@ Page Title="" Language="C#" MasterPageFile="~/LoginLayout.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="KFE.AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="login-logo">
        <a href="/AdminLogin"><b>KFE </b>Admin</a>
    </div>
    <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">Sign in to start your session</p>

            <form id="account" method="post" runat="server">
                <div class="text-danger"></div>
                <div class="form-group input-group mb-3">
                    <asp:TextBox ID="Username" class="form-control" required="" placeholder="Username"
                        runat="server" TextMode="Email"></asp:TextBox>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>
                <div class="form-group input-group mb-3">
                    <asp:TextBox ID="Password" class="form-control" placeholder="Password"
                        runat="server" TextMode="Password"></asp:TextBox>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="Must enter password"></asp:RequiredFieldValidator>
               <%-- <div class="form-group">
                    <div class="icheck-primary">
                        <input type="checkbox" id="remember">
                        <label for="remember">
                            Remember Me
             
                        </label>
                    </div>
                </div>--%>
                <div class="form-group">
                    <asp:Button ID="Login" runat="server" Text="Login" class="btn btn-primary float-right" OnClick="Login_Click" />
                </div>
                <a href="/">Home Page</a>
            </form>
        </div>
        <!-- /.login-card-body -->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
