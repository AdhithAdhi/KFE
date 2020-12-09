<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="KFE.ProductView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><%:GetProductName()+" | KfeFresh" %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server" id="form1">

        <div class="container">
            <div class="card card-solid">
                <div class="card-body">
                    <div class="row">
                        <%="" %>
                        <div class="col-12 col-sm-6">
                            <%--<h3 class="d-inline-block d-sm-none">Product Name</h3>--%>
                            <div class="col-12">
                                <asp:Image ID="ProductImg" CssClass="product-image" runat="server" AlternateText="Product Image" />
                            </div>
                        </div>
                        <div class="col-12 col-sm-6">
                            <h3 class="my-3">
                                <asp:Label ID="ProductNameText" runat="server"></asp:Label></h3>
                            <ul class="list-unstyled">
                                <li>Category
                    <ul>
                        <li>
                            <asp:Label ID="CategoryText" runat="server"></asp:Label></li>
                    </ul>
                                </li>
                            </ul>

                            <p>
                                <asp:Label ID="DescriptionText" runat="server"></asp:Label>
                            </p>

                            <hr>
                            <%if (HasStock())
                                {%>

                            <div class="bg-success py-2 px-3 mt-4">
                                <h2 class="mb-0"><i class="fas fa-rupee-sign mr-1"></i>
                                    <asp:Label ID="PriceText" runat="server"></asp:Label>
                                </h2>
                                <h4 class="mt-0">
                                    <small><i class="fas fa-rupee-sign mr-1"></i>
                                        <asp:Label ID="FinalPriceText" runat="server"></asp:Label>
                                    </small>
                                </h4>
                            </div>
                            <div class="mt-4">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Qty (Kg)</span>
                                    </div>
                                    <asp:TextBox ID="QantityText" runat="server" CssClass="form-control" requird="" Text="1"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="txtPremium_Integer"
                                        ControlToValidate="QantityText" ValidationGroup="Insert" ForeColor="Red"
                                        runat="server" Display="Dynamic"
                                        ErrorMessage="'Quantity' must be decimal like '5.24'"
                                        ValidationExpression="^\d+([,\.]\d{1,2})?$">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="mt-4">

                                <asp:CheckBox ID="NeedCheckBox" runat="server" />

                                <label class="text-primary">Need Cutting & Cleaning</label><br />

                                <p class="text-muted text-sm">*After Cleaning 100 grams of 1 Kg will lose.</p>

                            </div>
                            <div class="mt-4">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-cart-plus"></i></span>
                                    </div>
                                    <asp:Button class="btn btn-success btn-lg btn-flat" ID="BtnAddToCart" runat="server" Text="Add to Cart" OnClick="BtnAddToCart_Click" />

                                    <asp:Label CssClass="text-danger" ID="StockResult" runat="server"></asp:Label>
                                </div>
                            </div>
                            <%}
                                else
                                {%>
                            <div class="bg-warning py-2 px-3 mt-4">
                                <h2 class="mb-0">Out of Stock
                                </h2>
                                <h4 class="mt-0">
                                    <small>please contact us for more details
                                    </small>
                                </h4>
                            </div>
                            <%} %>
                            <div class="mt-4">
                                <label class="text-bold">Check Delivery</label>
                                <div class="input-group input-group">
                                    <asp:TextBox ID="DeliveryPin" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>

                                    <span class="input-group-append">
                                        <asp:Button class="btn btn-success btn-sm" ID="CheckDeliveryBtn" runat="server" Text="Check" OnClick="CheckDeliveryBtn_Click" />
                                    </span>
                                </div>
                                <asp:Label CssClass="text-danger" ID="DeliveryResultText" runat="server"></asp:Label>

                            </div>
                            <div class="mt-4 product-share">
                                <a href="http://fb.com/kfefresh.kerala.1" target="_blank" class="text-dark">
                                    <i class="fab fa-facebook-square fa-2x"></i>
                                </a>
                                <a href="mailto:info@kfefresh.com" class="text-dark">
                                    <i class="fab fa-twitter-square fa-2x"></i>
                                </a>
                                <a href="mailto:info@kfefresh.com" class="text-dark">
                                    <i class="fas fa-envelope-square fa-2x"></i>
                                </a>
                                <a href="#" class="text-dark">
                                    <i class="fas fa-rss-square fa-2x"></i>
                                </a>
                            </div>

                        </div>
                    </div>

                </div>
                <!-- /.card-body -->
            </div>
            <div class="card card-outline card-secondary">
                <div class="card-header">
                    <strong>Other Products</strong>
                    <a href="Shop.aspx" class="btn btn-success btn-sm  float-right">View All</a>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
