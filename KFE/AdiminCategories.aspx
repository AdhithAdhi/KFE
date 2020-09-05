<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdiminCategories.aspx.cs" Inherits="KFE.AdiminCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container-fluid">
        <!-- form start -->

        <form id="quickForm" method="post" runat="server">
            <!-- left column -->
            <div class="card card-secondary">
                <!-- /.card-header -->
                <div class="card-header">
                    <h3 class="card-title">Add Categories</h3>
                </div>
                <div class="card-body">
                    <div class="input-group mb-3">
                        <asp:TextBox ID="CatName" runat="server" class="form-control"
                            placeholder="Name"></asp:TextBox>
                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="CatShort" runat="server" class="form-control"
                            placeholder="Short-form"></asp:TextBox>
                    </div>

                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                    <asp:Button ID="Submit" CssClass="btn btn-primary float-right" runat="server" Text="Add" OnClick="Submit_Click" />
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
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Available Categories</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">

                    <asp:GridView ID="GridView1" runat="server" class="table table-bordered table-striped" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" OnRowDeleting="CategoryDelete">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="SF" HeaderText="SF" SortExpression="SF" />
                            <asp:CommandField ShowDeleteButton="True">
                                <ControlStyle CssClass="btn btn-primary" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                </div>
                <!-- /.card-body -->
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Kfe_Fresh_DBConnectionString %>" DeleteCommand="DELETE FROM [Category] WHERE [Id] = @original_Id AND [Name] = @original_Name AND [SF] = @original_SF" InsertCommand="INSERT INTO [Category] ([Name], [SF]) VALUES (@Name, @SF)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Category]" UpdateCommand="UPDATE [Category] SET [Name] = @Name, [SF] = @SF WHERE [Id] = @original_Id AND [Name] = @original_Name AND [SF] = @original_SF">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_SF" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="SF" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="SF" Type="String" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_SF" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
