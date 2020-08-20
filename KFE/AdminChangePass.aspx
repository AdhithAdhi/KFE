<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminChangePass.aspx.cs" Inherits="KFE.AdminChangePass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container-fluid">
        <div class="error-page">
            <!-- form start -->

            <form id="quickForm" method="post" runat="server">
                <!-- left column -->
                <div class="col-md-9">
                    <div class="card card-secondary">
                        <!-- /.card-header -->
                        <div class="card-header">
                            <h3 class="card-title">ChangePassword</h3>
                        </div>
                        <div class="card-body">
                            <div class="input-group mb-3">
                                <asp:TextBox ID="CurrentPass" TextMode="Password" runat="server" class="form-control"
                                    placeholder="Current Password"></asp:TextBox>
                                <div class="input-group-append">
                                    <div class="input-group-text">
                                        <span class="fas fa-lock"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" class="form-control"
                                    placeholder="New Password"></asp:TextBox>
                                <div class="input-group-append">
                                    <div class="input-group-text">
                                        <span class="fas fa-lock"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <asp:TextBox ID="ConfirmPass" runat="server" TextMode="Password" class="form-control"
                                    placeholder="Confirm Password"></asp:TextBox>
                                <div class="input-group-append">
                                    <div class="input-group-text">
                                        <span class="fas fa-lock"></span>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- /.card-body -->

                        <div class="card-footer">
                            <asp:Button ID="Change" CssClass="btn btn-primary float-right" runat="server" Text="Change" OnClick="Change_Click" />
                        </div>
                    </div>
                </div>
                <ul style="list-style-type: none;">
                    <li>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CurrentPass" ErrorMessage="Must enter current password" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </li>
                    <li>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Must enter new password" ControlToValidate="NewPassword" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </li>
                    <li>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Must enter confirm password" ControlToValidate="ConfirmPass" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </li>
                    <li>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Must contain 8 to 15  a-z, A-Z, 0-9, [@$!%*?&] characters" CssClass="text-danger" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$" ControlToValidate="NewPassword"></asp:RegularExpressionValidator>
                    </li>
                    <li>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmPass" ErrorMessage="Passwords not matching" CssClass="text-danger"></asp:CompareValidator>
                    </li>
                </ul>
            </form>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
