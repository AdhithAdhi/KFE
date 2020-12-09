<%@ Page Title="" Language="C#" MasterPageFile="~/LoginLayout.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="KFE.ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Reset Password</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="login-box">

        <form runat="server" method="post">
            <div class="login-logo">
                <a href="/Index"><b>KFE </b>Reset Password</a>
            </div>
            <!-- /.login-logo -->
            <div class="card">
                <%if (ValidateUrl())
                    { %>
                <div class="card-body login-card-body">
                    <p class="login-box-msg">You are only one step a way from your new password, recover your password now.</p>

                    <div class="input-group mb-3">
                        <asp:TextBox ID="NewPasswordText" runat="server" TextMode="Password" required="" placeholder="New Password" CssClass="form-control"></asp:TextBox>

                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="CoPasswordText" runat="server" TextMode="Password" required="" placeholder="Confirm Password" CssClass="form-control"></asp:TextBox>

                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords not matching" ControlToCompare="NewPasswordText" ControlToValidate="CoPasswordText" CssClass="text text-danger text-bold"></asp:CompareValidator>
                    <div class="row">

                        <div class="col-12">

                            <asp:Button ID="ChangeBtn" CssClass="btn btn-primary btn-block" Text="Change password" runat="server" OnClick="ChangeBtn_Click" />

                        </div>
                        <!-- /.col -->
                    </div>

                    <p class="mt-3 mb-1">
                        <a href="Login.aspx">Login</a>
                    </p>
                </div>
                <%}
                    else
                    { %>
                <div class="card-body login-card-body">

                    <h3 class="text text-warning">Opps! </h3>
                    <p class="login-box-msg">Opps! Something went wrong, may be the link exiperd</p>


                    <p class="mt-3 mb-1">
                        <a href="ForgetPassword.aspx">Forget Password</a>
                    </p>
                </div>
                <%} %>
                <!-- /.login-card-body -->
            </div>

        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
