﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="OrderShipped.aspx.cs" Inherits="KFE.OrderShipped" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Orders Shipped</h3>
                    <a href="OrderDeliverd.aspx" class="btn btn-primary float-right">Orders Deliverd</a>
                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">


                    <asp:GridView ID="GridView1" class="table table-hover text-nowrap" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrderId" DataSourceID="SqlDataSource1" CssClass="table table-hover text-nowrap" OnSelectedIndexChanging="OrderDeliverd" OnRowEditing="OrderView">
                        <Columns>
                            <asp:BoundField DataField="OrderId" HeaderText="OrderId" SortExpression="OrderId" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />

                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                            <asp:CommandField ButtonType="Button" EditText="View" SelectText="Delivered" ShowEditButton="True" ShowSelectButton="True">
                            <ControlStyle CssClass="btn btn-primary" />
                            </asp:CommandField>


                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Kfe_Fresh_DBConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [OrderId], [Date], [Status], [Address], [Price] FROM [Orders] WHERE ([Status] LIKE '%' + @Status + '%')">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Ship" Name="Status" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>


                </div>
                <!-- /.card-body -->
            </div>
        </div>

    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
