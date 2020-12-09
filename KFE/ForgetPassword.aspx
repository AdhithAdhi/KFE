<%@ Page Title="" Language="C#" MasterPageFile="~/LoginLayout.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="KFE.ForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Forget Password</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="login-box">
        <div class="login-logo">
        <a href="/Index"><b>KFE </b>Forget Password</a>
        </div>
        <!-- /.login-logo -->
        <div class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg">You forgot your password? Here you can easily retrieve a new password.</p>

                <form id="Forget" runat="server" method="post">
                    <div class="form-group input-group mb-3">
                        <asp:TextBox ID="EmailText" runat="server" AutoCompleteType="Email"  TextMode="Email" required="" placeholder="Email"  CssClass="form-control"></asp:TextBox>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-12">
                            <asp:Button ID="RequestBtn" CssClass="btn btn-primary btn-block" Text="Request new password" runat="server" OnClick="RequestBtn_Click" />
                        </div>
                        <!-- /.col -->
                    </div>
                </form>

                <p class="mt-3 mb-1">
                    <a href="Login.aspx">Login</a>
                </p>
                <p class="mb-0">
                    <a href="Register.aspx" class="text-center">Register a new membership</a>
                </p>
            </div>
            <!-- /.login-card-body -->
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
