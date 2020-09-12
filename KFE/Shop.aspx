<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="KFE.Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <%="" %>
            <%  for (int i = 0; i < Sliders.Count; i++)
                {
                    if (i == 0)
                    {
            %>
            <li data-target="#carouselExampleIndicators" data-slide-to="<%:i %>" class="active"></li>
            <%
                }
                else
                {
            %>
            <li data-target="#carouselExampleIndicators" data-slide-to="<%:i %>"></li>
            <%
                    }

                }
            %>
        </ol>
        <div class="carousel-inner">
            <% for (int i = 0; i < Sliders.Count; i++)
                {
                    if (i == 0)
                    {
            %>
            <div class="carousel-item active">
                <img class="d-block w-100" src="https://static.kfefresh.com/Images/Sliders/<%:Sliders[i].ImagePath %>" alt="" />
            </div>
            <%
                }
                else
                {
            %>
            <!-- Item -->
            <div class="carousel-item">
                <img class="d-block w-100" src="https://static.kfefresh.com/Images/Sliders/<%:Sliders[i].ImagePath %>" alt="" />
            </div>
            <!-- // Item -->
            <%
                    }
                }
            %>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
        <!-- ./col -->
        <div class="row mt-5">
            <%="" %>
            <%foreach (KFE.Models.Products product in Products)
                { %>
            <div class="col-lg-3 col-6">
                <div class="card card-secondary card-outline">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="product-image-thumb">
                                    <img src="https://static.kfefresh.com/Images/Products/<%:product.ImagePath%>" alt="Product Image">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <h4 class="card-title text-bold"><%:product.Title %></h4>

                                <%if (product.Description.Length < 45)
                                    { %>
                                <p class="card-text">
                                    <%:product.Description%></label>
                                    <%}
                                        else
                                        { %>

                                <p class="card-text"><%:product.Description.Substring(0, 42) + "..."%></p>
                                <%} %>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="card-link">View</a>
                        <a href="#" class="card-link">Add to Cart</a>
                    </div>
                </div>
            </div>
            <%} %>
        </div>
        <!-- /.row -->
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
