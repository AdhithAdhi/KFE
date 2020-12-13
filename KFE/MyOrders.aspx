<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="KFE.MyOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>My Orders</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <form id="cart" runat="server">

            <%if (orders.Count == 0)
                {%>

            <section class="col-lg-7 connectedSortable">
                <div class="error-content">

                    <h2 class="headline text-warning">Orders are Empty</h2>
                    <h3>
                        <i class="fas fa-cart-arrow-down"></i>Oops! You don't have any orders.</h3>

                    <p>
                        Looks like you have no orders.
                        Click <a class="text-bold" href="Shop.aspx"><b>Here</b></a> to continue shopping.<br>
                        Or  <a class="text-bold" href="MyCart.aspx"><b>Here</b></a> to checkout.
                    </p>


                </div>
            </section>
            <%}
                else
                { %>
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">
                        <i class="ion ion-clipboard mr-1"></i>
                        My Orders

                    </h3>

                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <%="" %>
                    <%foreach (KFE.Order order in orders)
                        {
                    %>
                    <div class="align-items-stretch">
                        <div class="card card-success card-outline">
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
                                    <i class="fas fa-lg fa-home"><small class="ml-2">Delivery Address : </small>
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
                                        <b class="text-info"> <%:order.PaymentType%></b>
                                         </label>
                                </div>

                                <div class="mt-2">

                                    <h2 class="lead text-bold"><b>Order Summery </b></h2>
                                    <%foreach (KFE.OrderItem cart in GetOrderdItemsById(order.OrderId))
                                        {
                                    %>
                                    <div class="info-box ml-3">
                                        <div class="product-img">
                                            <img src="https://static.kfefresh.com/Images/Products/<%:GetProdyctById(cart.ProductId).ImagePath%>" width="50" height="50" alt="Product Image">
                                        </div>

                                        <div class="info-box-content">
                                            <span class="info-box-text"><a class="lead text-bold" href="ProductView.aspx?Product=<%:KFE.MyClass.EncryptDecrypt.Encrypt(HttpUtility.UrlEncode(cart.ProductId.ToString())) %>"><%:GetProdyctById(cart.ProductId).Title%></a></span>
                                            <%--<span class="info-box-number">5,200</span>

                                            <div class="progress">
                                                <div class="progress-bar" style="width: 50%"></div>
                                            </div>--%>
                                            <p class="mt-2">
                                                <%:GetProdyctById(cart.ProductId).Description.Substring(0, 75) + "...(more)"%>
                                            </p>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <% }%>
                                </div>
                                
                            </div>
                            <div class="card-footer">
                                <h3 class="card-title">
                                    <i class="ion ion-clipboard mr-1"></i>
                                    <b>Total : <%:"₹" + order.Price%></b>
                                </h3>
                                <div class="row d-flex float-right">
                                    <div class="btn-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-eye"></i></span>
                                        </div>
                                        <a class="btn btn-sm btn-info" href="ViewOrder.aspx?Order=<%:KFE.MyClass.EncryptDecrypt.Encrypt(HttpUtility.UrlEncode(order.OrderId.ToString())) %>">View Order Items</a>

                                    </div>
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
                        <%} %>
                    </div>
                    <!-- /.card-body -->

                </div>
            </div>
            <%} %>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
