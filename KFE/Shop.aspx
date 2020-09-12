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
            <%foreach (KFE.Product product in Products)
                { %>
            <div class="col-lg-3 col-6">
                <div class="card card-success card-outline">
                    <div class="card-header">
                        <img src="https://static.kfefresh.com/Images/Products/<%:product.ImagePath%>" style="width:100%" alt="Product Image">
                    </div>
                    <div class="card-body">
                        <h4 class="card-title text-bold"><%:product.Title %></h4>
                        
                                <p class="card-text">₹ <%:product.Price%>/Kg</p>
                    </div>
                    <div class="card-footer">
                        <a href="/ProductView?Product=<%:KFE.MyClass.EncryptDecrypt.Encrypt(HttpUtility.UrlEncode(product.Id.ToString())) %>" class="card-link btn btn-success">View</a>
                        <a href="#" class="card-link btn btn-outline-success">Add to Cart</a>
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
