<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyPersonalInfo.aspx.cs" Inherits="KFE.MyPersonalinfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <form id="user" runat="server">

            <div class="card card-secondary">
                <div class="card-header">
                    <h3 class="card-title"><i class="fas fa-edit"></i>Personal Info</h3>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                <div class="card-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Full Name</label>
                        <asp:TextBox ID="NameText" class="form-control" required="" placeholder="Name"
                            runat="server" TextMode="SingleLine"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <asp:TextBox ID="EmailText" class="form-control" required="" placeholder="Email"
                            runat="server" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Mobile Number</label>
                        <asp:TextBox ID="MobileText" class="form-control" required="" placeholder="Mobile"
                            runat="server" TextMode="Phone"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Address</label>
                        <asp:TextBox ID="adr_Textarea" class="form-control" required="" placeholder="Enter Address" runat="server" Rows="2" Height="90px" TextMode="MultiLine"></asp:TextBox>

                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Pin Number</label>
                        <asp:TextBox ID="PinText" class="form-control" required="" placeholder="Pin Number"
                            runat="server" TextMode="Number"></asp:TextBox>
                    </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                    <a class="text-bold" href="ChangePassword.aspx"><b>Change Password</b></a> 
                    <asp:Button runat="server" ID="UpdateUser" CssClass="btn btn-primary float-right" Text="Update" OnClick="UpdateUser_Click" />
                </div>
            </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
