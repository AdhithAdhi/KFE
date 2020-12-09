<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDeliveryArea.aspx.cs" Inherits="KFE.AdminDeliveryArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
<div class="container-fluid">

    <form id="area" runat="server">
        
    <div class="card card-secondary">
        <div class="card-header">
            <h3 class="card-title">Add New Area</h3>
        </div>
        <!-- /.card-header -->
        <!-- form start -->
        <div class="card-body">

            <div class="form-group">
                <label for="exampleInputEmail1">Pin Number</label>
                <asp:TextBox ID="Pin_Text" required="" class="form-control" placeholder="Pin Number" runat="server"></asp:TextBox>
            </div>
            </div>
            <!-- /.card-body -->

            <div class="card-footer">
                <asp:Button ID="sub_Button1" class="btn btn-primary float-right" runat="server" Text="Add" OnClick="sub_Button1_Click" />
            </div>
    </div>

    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Available Pincodes</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">

            <asp:GridView class="table table-bordered table-striped" ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped" EmptyDataText="No areas added" DataKeyNames="Id" OnRowDeleting="DeleteArea">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Pincode" HeaderText="Pincode" SortExpression="Pincode" />
                    <asp:CommandField ShowDeleteButton="True">
                    <ControlStyle CssClass="btn btn-primary" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>

        </div>
        <!-- /.card-body -->
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Kfe_Fresh_DBConnectionString %>" SelectCommand="SELECT [Id], [Pincode] FROM [DeliveryPincodes]" OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [DeliveryPincodes] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [DeliveryPincodes] ([Pincode]) VALUES (@Pincode)" UpdateCommand="UPDATE [DeliveryPincodes] SET [Pincode] = @Pincode WHERE [Id] = @original_Id">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Pincode" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Pincode" Type="Int32" />
            <asp:Parameter Name="original_Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
