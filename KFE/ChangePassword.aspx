<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="KFE.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <form id="user" runat="server">

            <div class="card card-secondary">
                <div class="card-header">
                    <h3 class="card-title"><i class="fas fa-edit"></i>Security</h3>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                <div class="card-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Current Password</label>
                        <asp:TextBox ID="CuPass" class="form-control" required="" placeholder="Current Password"
                            runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">New Password</label>
                        <asp:TextBox ID="NePass" class="form-control" required="" placeholder="New Password"
                            runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Confirm Password</label>
                        <asp:TextBox ID="CoPass" class="form-control" required="" placeholder="Confirm Password"
                            runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords not matching" CssClass="text-bold text-danger" ControlToCompare="NePass" ControlToValidate="CoPass"></asp:CompareValidator>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                    <a class="text-bold" href="MyPersonalInfo.aspx"><b>Personal Info</b></a> 
                    <asp:Button runat="server" ID="UpdatePassBtn" CssClass="btn btn-primary float-right" Text="Change" OnClick="UpdatePassBtn_Click" />

                </div>
            </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
