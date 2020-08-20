<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdiminCategories.aspx.cs" Inherits="KFE.AdiminCategories" %>
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
                            <h3 class="card-title">Add Categories</h3>
                        </div>
                        <div class="card-body">
                            <div class="input-group mb-3">
                                <asp:TextBox ID="CatName" runat="server" class="form-control"
                                    placeholder="Name"></asp:TextBox>
                                <div class="input-group-append">
                                    <div class="input-group-text">
                                        <span class="fas fa-lock"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <asp:TextBox ID="CatShort" runat="server" class="form-control"
                                    placeholder="Short-form"></asp:TextBox>
                                <div class="input-group-append">
                                    <div class="input-group-text">
                                        <span class="fas fa-lock"></span>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- /.card-body -->

                        <div class="card-footer">
                            <asp:Button ID="Submit" CssClass="btn btn-primary float-right" runat="server" Text="Change" OnClick="Submit_Click" />
                        </div>
                    </div>
                </div>
                <ul style="list-style-type: none;">
                    <li>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CatName" ErrorMessage="Must enter name" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </li>
                    <li>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Must enter short-form" ControlToValidate="CatShort" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </li>
                </ul>
            </form>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
