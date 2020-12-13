<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyCart.aspx.cs" Inherits="KFE.MyCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>My Cart</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <form id="cart" runat="server">

            <div class="row">

                <%if (carts.Count == 0)
                    {%>

                <section class="col-lg-7 connectedSortable">
                    <div class="error-content">

                        <h2 class="headline text-warning">Cart is Empty</h2>
                        <h3>
                            <i class="fas fa-cart-arrow-down"></i>Oops! Your cart is empty.</h3>

                        <p>
                            Looks like you have no items in your shopping cart.<br>
                            Click <a class="text-bold" href="Shop.aspx"><b>Here</b></a> to continue shopping.
                        </p>


                    </div>
                </section>
                <%}
                    else
                    { %>
                <section class="col-lg-7 connectedSortable">

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
                            <%foreach (KFE.Cart cart in carts)
                                {
                                    var CartId = cart.CartId;
                            %>
                            <div class="align-items-stretch">
                                <div class="card bg-light">
                                    <div class="card-body pt-0">
                                        <div class="row">
                                            <div class="col-5 text-center mt-3">
                                                <a href="ProductView.aspx?Product=<%:KFE.MyClass.EncryptDecrypt.Encrypt(HttpUtility.UrlEncode(cart.ProductId.ToString())) %>">
                                                    <img src="https://static.kfefresh.com/Images/Products/<%:GetProdyctById(cart.ProductId).ImagePath%>" alt="" class="img-circle img-fluid">
                                                </a>
                                            </div>
                                            <div class="col-7 mt-3">
                                                <h2 class="lead text-bold"><b><%:GetProdyctById(cart.ProductId).Title%></b></h2>
                                                <p class="text-muted text-sm"><b>Price : </b>₹<%:GetProdyctById(cart.ProductId).Price%></p>

                                                <div class="text-left">
                                                    <span class="text-warning">Qty (Kg)</span>
                                                    <div class="input-group">
                                                        <input disabled="disabled" class="form-control align-content-center" value="<%:cart.Count %>" />
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
                                                    <%if (IsProductOutOfStock(cart.ProductId))
                                                        { %>

                                                    <h2 class="lead text-bold"><b>Out of Stock</b></h2>
                                                    <%}
                                                        else
                                                        { %>

                                                    <h2 class="lead text-bold"><b>Total :₹<%:GetProdyctById(cart.ProductId).Price * cart.Count%></b></h2>

                                                    <%} %>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer">
                                            <div class="row d-flex">
                                                <div class="text-right">
                                                    <div class="btn-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><i class="fas fa-eye"></i></span>
                                                        </div>
                                                        <a class="btn btn-sm btn-success" href="ProductView.aspx?Product=<%:KFE.MyClass.EncryptDecrypt.Encrypt(HttpUtility.UrlEncode(cart.ProductId.ToString())) %>">View Product</a>

                                                    </div>
                                                    <div class="btn-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><i class="fas fa-trash"></i></span>
                                                        </div>
                                                        <a class="btn btn-sm btn-danger" href="RemoveFromCart.aspx?cId=<%:KFE.MyClass.EncryptDecrypt.Encrypt(HttpUtility.UrlEncode(cart.CartId.ToString())) %>">Remove</a>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%} %>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer clearfix">
                                <%if (!ContainsOutOfStockProducts())
                                    { %>

                                <asp:Button ID="BuyBtn" runat="server" Text="Buy Items" class="btn btn-info float-right" OnClick="BuyBtn_Click" />

                                <%} %>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="col-lg-4 connectedSortable">

                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">
                                <i class="ion ion-clipboard mr-1"></i>
                                Total
                            </h3>

                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">


                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <th style="width: 50%">Subtotal:</th>
                                        <td>₹<asp:Label ID="SubTotalText" runat="server"></asp:Label></td>
                                    </tr>
                                    <%--<tr>
                                    <th>Tax (9.3%)</th>
                                    <td>$10.34</td>
                                </tr>--%>
                                    <tr>
                                        <th>Shipping:</th>
                                        <td>₹<asp:Label ID="ShippingText" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th>Total:</th>
                                        <td>₹<asp:Label ID="TotalText" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer">
                            <%if (!ContainsOutOfStockProducts())
                                { %>

                            <asp:Button ID="Button1" runat="server" Text="Buy Items" class="btn btn-info float-right" OnClick="BuyBtn_Click" />

                            <%} %>
                        </div>
                        <!-- /.card-body -->
                    </div>
                </section>
                <%} %>
            </div>
        </form>
    </div>
    <!-- /.card -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
