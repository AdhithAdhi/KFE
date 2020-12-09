<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="KFE.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Index</title>
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

        <div class="mt-5">
            <div class="card card-primary">
                <div class="card-header">
                    Shop Now
                </div>
                <div class="card-body">
                    <p>
                        Shop fresh fish from us.
                    </p>
                    <a href="Shop.aspx" class="btn btn-success float-right">Shop Now</a>
                </div>
            </div>
            <div class="card card-success">
                <div class="card-header">
                    About Us
                </div>
                <div class="card-body">
                    <p>
                        <a rel="nofollow noopener" href="/" class="text-bold" target="_parent">KFE' s</a> aim is to provide fresh fish at your doorstep. We collect freshly catched fish directly from the local fisherman and sells them at reasonable prices to our customers.
                            <br />
                    </p>
                    <p>
                        We ensure that all our fish are
                    <label class="text-danger">ammonia</label>
                        and
                    <label class="text-danger">formaline</label>
                        free beacuse customer satisfaction is our
                    <label class="text-primary">happiness</label>.
                    </p>
                </div>
            </div>
            <div class="card card-success card-outline">
                <div class="card-header">
                    Contact Us
                </div>
                <div class="card-body">
                    <label class="text-bold">Feel free to keep in touch with us!</label>
                    <div  class="m-2">
                    <i class="fas fa-lg fa-phone-alt mr-2"><small class="text-bold ml-2">+91 81138 11177</small>
                    </i>
                    </div>
                    <div class="m-2">
                    <i class="fas fa-lg fa-phone-alt mr-2"><small class="text-bold ml-2">+91 95261 80763</small>
                    </i>
                    </div>
                    <div class="m-2">
                    <i class="fas fa-lg fa-mail-bulk mr-2"><small class="text-bold ml-2">kfefresh@gmail.com</small>
                    </i>
                    </div>
                    <div class="m-2">
                    <i class="fas fa-lg fa-globe mr-2"><small class="text-bold ml-2">Kfefresh.com</small>
                    </i>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="product-share">
                        <a href="#" class="text-gray">
                            <i class="fab fa-facebook-square fa-2x"></i>
                        </a>
                        <a href="#" class="text-gray">
                            <i class="fab fa-twitter-square fa-2x"></i>
                        </a>
                        <a href="#" class="text-gray">
                            <i class="fas fa-envelope-square fa-2x"></i>
                        </a>
                        <a href="#" class="text-gray">
                            <i class="fas fa-rss-square fa-2x"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    
</asp:Content>
