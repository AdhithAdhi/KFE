<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewOrder.aspx.cs" Inherits="KFE.ViewOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <form id="cart" runat="server">
            <!-- /.card-header -->

            <div class="card card-outline card-green">
                <div class="card-header">
                    <div class="mt-2">

                        <h2 class="lead text-bold"><b>Order Id : <%:KFE.MyClass.EncryptDecrypt.Encrypt(order.OrderId.ToString())%></b></h2>

                    </div>
                </div>
                <div class="card-body">


                    <div class="mt-2">

                        <b class="text-capitalize"><small>Orderd On : <%:order.Date%></small></b>

                    </div>
                    <div class="mt-2">
                        <i class="fas fa-lg fa-home"><small>Delivery Address : </small>
                        </i>
                        <br />
                        <label class="text text-capitalize"><%:order.Address %></label>
                    </div>
                    <div class="mt-2">
                        <i class="fas fa-lg fa-phone-alt"><small class="ml-2">Contact Number : </small>
                        </i>
                        <br />
                        <label class="text text-capitalize"><%:order.ContactNumber %></label>
                    </div>
                    <div class="mt-2">

                        <label class="text-capitalize">
                            Order Status :
                                        <%if (order.Status.Contains("Cancel"))
                                            {%>
                            <b class="text-danger"><%:order.Status%></b>
                            <%}
                                else
                                { %>
                            <b class="text-info"><%:order.Status%></b>
                            <%} %>
                        </label>
                    </div>
                    
                    <div class="mt-2">
                        <label class="text-capitalize">
                            Payment Type :
                                        <b class="text-info text-bold"><%:order.PaymentType%></b>
                        </label>
                    </div>
                    <div class="mt-2">

                        <h2 class="lead text-bold"><b>Order Summery </b></h2>
                        <%foreach (KFE.OrderItem cart in GetOrderdItemsById(order.OrderId))
                            {
                        %><div class="align-items-stretch">
                            <div class="card bg-light">
                                <div class="card-body pt-0">
                                    <div class="row">
                                        <div class="col-5 text-center mt-3">
                                            <img src="https://static.kfefresh.com/Images/Products/<%:GetProdyctById(cart.ProductId).ImagePath%>" alt="" class="img-circle img-fluid" width="200" height="200">
                                        </div>
                                        <div class="col-7 mt-3">
                                            <a href="ProductView.aspx?Product=<%:KFE.MyClass.EncryptDecrypt.Encrypt(HttpUtility.UrlEncode(cart.ProductId.ToString())) %>" class="lead text-bold"><b><%:GetProdyctById(cart.ProductId).Title%></b></a>
                                            <p class="text-muted text-sm"><b>Price : </b>₹<%:GetProdyctById(cart.ProductId).Price%></p>

                                            <div class="text-left">
                                                <span class="text-warning">Qty (Kg)</span>
                                                <div class="input-group">
                                                    <input disabled="disabled" class="form-control align-content-center" value="<%:cart.Quantity %>" />
                                                </div>
                                            </div>
                                            <div class="mt-3">
                                                <%if (cart.Extras != "")
                                                    { %>
                                                <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false" Checked="true" />
                                                <%}
                                                    else
                                                    { %>
                                                <asp:CheckBox ID="CheckBox2" runat="server" Enabled="false" Checked="false" />

                                                <%} %>

                                                <label class="text-primary">Need Cutting & Cleaning</label><br />

                                                <p class="text-muted text-sm">*After Cleaning 100 grams of 1 Kg will lose.</p>

                                                <h2 class="lead text-bold"><b>Total :₹<%:GetProdyctById(cart.ProductId).Price*cart.Quantity%></b></h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <% }%>
                        </div>

                    </div>

                </div>

                <div class="card-footer">
                    <h3 class="card-title">
                        <i class="ion ion-clipboard mr-1"></i>
                        <b>Total : <%:"₹"+order.Price%></b>
                    </h3>
                    <div class="row d-flex float-right">
                        <%if (CanCancel(order.Status))
                            { %>
                        <div class="btn-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-trash"></i></span>
                            </div>
                            <a class="btn btn-sm btn-danger" href="CancelOrder.aspx?Order=<%:KFE.MyClass.EncryptDecrypt.Encrypt(HttpUtility.UrlEncode(order.OrderId.ToString())) %>">Cancel Order</a>
                        </div>
                        <%}
                            else
                            { %>
                        <div class="btn-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-print"></i></span>
                            </div>
                            <a class="btn btn-sm btn-secondary" href="Invoice.aspx?Order=<%:KFE.MyClass.EncryptDecrypt.Encrypt(HttpUtility.UrlEncode(order.OrderId.ToString())) %>">View Invoice</a>
                        </div>
                        <%} %>
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
