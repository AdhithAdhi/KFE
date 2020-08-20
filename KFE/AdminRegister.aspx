<%@ Page Title="" Language="C#" MasterPageFile="~/LoginLayout.Master" AutoEventWireup="true" CodeBehind="AdminRegister.aspx.cs" Inherits="KFE.AdminRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="login-logo">
        <a href="/AdminLogin"><b>KFE </b>Admin</a>
    </div>
    <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">Register</p>

            <form id="account" method="post" runat="server">
                <div class="text-danger"></div>
                <div class="form-group input-group mb-3">
                    <asp:TextBox ID="Username" runat="server" placeholder="User Name" AutoCompleteType="Email" class="form-control" TextMode="Email"></asp:TextBox>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>
                <div class="form-group input-group mb-3">
                    <asp:TextBox ID="Password" runat="server" placeholder="Password" class="form-control" TextMode="Password"></asp:TextBox>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="form-group input-group mb-3">
                    <asp:TextBox ID="ConfirmPass" runat="server" placeholder="Confirm Password" class="form-control" TextMode="Password"></asp:TextBox>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPass" ErrorMessage="Passwords not match" CssClass="text-danger"></asp:CompareValidator>
                <div class="form-group">
                    <asp:Button ID="Register" runat="server" Text="Register" class="btn btn-primary float-right" OnClick="Register_Click" />
                </div>
                <a href="/AdminLogin">Login Page</a>
            </form>
        </div>
        <!-- /.login-card-body -->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
