<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="KFE.MyOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="ion ion-clipboard mr-1"></i>
                            My Cart
                </h3>

                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <%="" %>
                        <%foreach (KFE.Order order in orders)
                            {
                        %>
                        <div class="align-items-stretch">
                            <div class="card bg-light">
                                <div class="card-body pt-0">
                                    <div class="row">
                                        
                                        <div class="mt-3">
                                            <h2 class="lead text-bold"><b>Order Id :<%:KFE.MyClass.EncryptDecrypt.Encrypt(order.OrderId.ToString())%></b></h2>

                                            <p class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span>Address: <%:order.Address %></p>
                                            
                                            <h4 class="lead text-bold"><b>Order Id :<%:order.Status%></b></h4>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%} %>
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer clearfix">
                            <asp:Button ID="ViewOrderBtn" runat="server" Text="View Order" class="btn btn-info float-right" />
                        </div>
                    </div>
                </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
