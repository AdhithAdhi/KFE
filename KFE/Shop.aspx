<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="KFE.Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                <img class="d-block w-100" src="/Images/Sliders/<%:Sliders[i].ImagePath %>" alt="" />
            </div>
            <%
                }
                else
                {
            %>
            <!-- Item -->
            <div class="carousel-item">
                <img class="d-block w-100" src="/Images/Sliders/<%:Sliders[i].ImagePath %>" alt="" />
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
    <div class="container">
        <!-- ./col -->
        <div class="row">

            <div class="col-lg-3 col-6">
                <div class="card card-primary card-outline">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>

                        <p class="card-text">
                            Some quick example text to build on the card title and make up the bulk of the card's
                  content.
               
                        </p>
                        <a href="#" class="card-link">Card link</a>
                        <a href="#" class="card-link">Another link</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
