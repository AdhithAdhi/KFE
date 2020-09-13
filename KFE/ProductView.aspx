<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="KFE.ProductView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server" id="form1">

        <div class="container">
    <div class="card card-solid">
        <div class="card-body">
            <div class="row">
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
                    <div class="bg-success py-2 px-3 mt-4">
                        <h2 class="mb-0"><i class="fas fa-rupee-sign mr-1"></i>
                            <asp:Label ID="PriceText" runat="server"></asp:Label>
                        </h2>
                        <h4 class="mt-0">
                            <small>Ex Tax: <i class="fas fa-rupee-sign mr-1"></i>
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

                        <p class="text-muted text-sm">*After Cleaning 250 grams of 1 Kg will lose.</p>

                    </div>
                    <div class="mt-4">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-cart-plus"></i></span>
                            </div>
                            <asp:Button class="btn btn-success btn-lg btn-flat" ID="BtnAddToCart" runat="server" Text="Add to Cart" OnClick="BtnAddToCart_Click" />

                        </div>
                    </div>
                    <div class="mt-4">
                        <label class="text-bold">Check Delivery</label>
                        <div class="input-group input-group">
                        <asp:TextBox ID="DeliveryPin" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                        
                            <span class="input-group-append">
                                <asp:Button class="btn btn-success btn-sm" ID="CheckDeliveryBtn" runat="server" Text="Check"/>
                            </span>
                        </div>
                        <asp:Label CssClass="text-danger" ID="ResultText" runat="server"></asp:Label>

                    </div>
                    <div class="mt-4 product-share">
                        <a href="#" class="text-dark">
                            <i class="fab fa-facebook-square fa-2x"></i>
                        </a>
                        <a href="#" class="text-dark">
                            <i class="fab fa-twitter-square fa-2x"></i>
                        </a>
                        <a href="#" class="text-dark">
                            <i class="fas fa-envelope-square fa-2x"></i>
                        </a>
                        <a href="#" class="text-dark">
                            <i class="fas fa-rss-square fa-2x"></i>
                        </a>
                    </div>

                </div>
            </div>
            <%--<div class="row mt-4">
                <nav class="w-100">
                    <div class="nav nav-tabs" id="product-tab" role="tablist">
                        <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">Description</a>
                        <a class="nav-item nav-link" id="product-comments-tab" data-toggle="tab" href="#product-comments" role="tab" aria-controls="product-comments" aria-selected="false">Comments</a>
                        <a class="nav-item nav-link" id="product-rating-tab" data-toggle="tab" href="#product-rating" role="tab" aria-controls="product-rating" aria-selected="false">Rating</a>
                    </div>
                </nav>
                <div class="tab-content p-3" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae condimentum erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed posuere, purus at efficitur hendrerit, augue elit lacinia arcu, a eleifend sem elit et nunc. Sed rutrum vestibulum est, sit amet cursus dolor fermentum vel. Suspendisse mi nibh, congue et ante et, commodo mattis lacus. Duis varius finibus purus sed venenatis. Vivamus varius metus quam, id dapibus velit mattis eu. Praesent et semper risus. Vestibulum erat erat, condimentum at elit at, bibendum placerat orci. Nullam gravida velit mauris, in pellentesque urna pellentesque viverra. Nullam non pellentesque justo, et ultricies neque. Praesent vel metus rutrum, tempus erat a, rutrum ante. Quisque interdum efficitur nunc vitae consectetur. Suspendisse venenatis, tortor non convallis interdum, urna mi molestie eros, vel tempor justo lacus ac justo. Fusce id enim a erat fringilla sollicitudin ultrices vel metus. </div>
                    <div class="tab-pane fade" id="product-comments" role="tabpanel" aria-labelledby="product-comments-tab">Vivamus rhoncus nisl sed venenatis luctus. Sed condimentum risus ut tortor feugiat laoreet. Suspendisse potenti. Donec et finibus sem, ut commodo lectus. Cras eget neque dignissim, placerat orci interdum, venenatis odio. Nulla turpis elit, consequat eu eros ac, consectetur fringilla urna. Duis gravida ex pulvinar mauris ornare, eget porttitor enim vulputate. Mauris hendrerit, massa nec aliquam cursus, ex elit euismod lorem, vehicula rhoncus nisl dui sit amet eros. Nulla turpis lorem, dignissim a sapien eget, ultrices venenatis dolor. Curabitur vel turpis at magna elementum hendrerit vel id dui. Curabitur a ex ullamcorper, ornare velit vel, tincidunt ipsum. </div>
                    <div class="tab-pane fade" id="product-rating" role="tabpanel" aria-labelledby="product-rating-tab">Cras ut ipsum ornare, aliquam ipsum non, posuere elit. In hac habitasse platea dictumst. Aenean elementum leo augue, id fermentum risus efficitur vel. Nulla iaculis malesuada scelerisque. Praesent vel ipsum felis. Ut molestie, purus aliquam placerat sollicitudin, mi ligula euismod neque, non bibendum nibh neque et erat. Etiam dignissim aliquam ligula, aliquet feugiat nibh rhoncus ut. Aliquam efficitur lacinia lacinia. Morbi ac molestie lectus, vitae hendrerit nisl. Nullam metus odio, malesuada in vehicula at, consectetur nec justo. Quisque suscipit odio velit, at accumsan urna vestibulum a. Proin dictum, urna ut varius consectetur, sapien justo porta lectus, at mollis nisi orci et nulla. Donec pellentesque tortor vel nisl commodo ullamcorper. Donec varius massa at semper posuere. Integer finibus orci vitae vehicula placerat. </div>
                </div>
            </div>--%>
        </div>
        <!-- /.card-body -->
    </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
