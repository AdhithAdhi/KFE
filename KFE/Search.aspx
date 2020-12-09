<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="KFE.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Search Results</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <!-- ./col -->
        <%if (Products.Count == 0)
                { %>
            <div class="error-page">
                
                    <h2 class="text-warning">Sad no results</h2>
                    <h3>
                        <i class="fas fa-cart-arrow-down"></i>Oops! We couldn't find the product.</h3>

                    <p>
                        Looks like we couldn't find the item you searched for.<br>
                        may be a little spelling mistake? Click <a class="text-bold" href="Shop.aspx"><b>Here</b></a> to continue shopping.
                    </p>


            </div>
        <%}
            else
            { %>
        <div class="row mt-5">
            <%="" %>
            <%foreach (KFE.Product product in Products)
                { %>
            <div class="col-lg-3 col-6">
                <div class="card card-success card-outline">
                    <div class="card-header">
                        <img src="https://static.kfefresh.com/Images/Products/<%:product.ImagePath%>" style="width: 100%" alt="Product Image">
                    </div>
                    <div class="card-body">
                        <h4 class="card-title text-bold"><%:product.Title %></h4>

                        <p class="card-text">₹ <%:product.Price%>/Kg</p>
                    </div>
                    <div class="card-footer">
                        <a href="/ProductView?Product=<%:KFE.MyClass.EncryptDecrypt.Encrypt(HttpUtility.UrlEncode(product.Id.ToString())) %>" class="card-link btn btn-sm btn-success float-sm-left">View</a>
                        <a href="/AddToCart?pId=<%:KFE.MyClass.EncryptDecrypt.Encrypt(product.Id.ToString())%>" class="card-link btn btn-sm btn-outline-success float-sm-right">Add to Cart</a>
                    </div>
                </div>
            </div>
            <%} %>
        </div>

        <nav aria-label="Contacts Page Navigation">
            <ul class="pagination justify-content-center m-0">
                <%for (int i = 1; i <= TotalPages; i++)
                    {
                        if (i == PageNumber)
                        { %><li class="page-item active"><a class="page-link" href="Search.aspx?S=<%:Qry%>&&Page=<%:i %>"><%:i %></a></li>
                <%}
                    else
                    { %>
                <li class="page-item"><a class="page-link" href="Search.aspx?S=<%:Qry%>&&Page=<%:i %>"><%:i %></a></li>
                <%}
                    } %>
            </ul>
        </nav>
        <!-- /.row -->
        <%} %>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
