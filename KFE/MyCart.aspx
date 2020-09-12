<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyCart.aspx.cs" Inherits="KFE.MyCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">

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
                        <div class="col-12 d-flex align-items-stretch">
                            <div class="card bg-light">
                                <div class="card-body pt-0">
                                    <div class="row">
                                        <div class="col-5 text-center">
                                            <img src="https://static.kfefresh.com/Images/Products/" alt="" class="img-circle img-fluid">
                                        </div>
                                        <div class="col-7">
                                            <h2 class="lead"><b>Nicole Pearson</b></h2>
                                            <p class="text-muted text-sm"><b>About: </b>Web Designer / UX / Graphic Artist / Coffee Lover </p>
                                            <ul class="ml-4 mb-0 fa-ul text-muted">
                                                <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span>Address: Demo Street 123, Demo City 04312, NJ</li>
                                                <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>Phone #: + 800 - 12 12 23 52</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="text-right">
                                        <a href="#" class="btn btn-sm bg-teal">
                                            <i class="fas fa-comments"></i>
                                        </a>
                                        <a href="#" class="btn btn-sm btn-primary">
                                            <i class="fas fa-user"></i>View Profile
                    </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer clearfix">
                        <button type="button" class="btn btn-info float-right"><i class="fa fa-rupee"></i>Buy Items</button>
                    </div>
                </div>
            </section>

            <section class="col-lg-4 connectedSortable">

                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">
                            <i class="ion ion-clipboard mr-1"></i>
                            Total Amount
                </h3>

                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                    </div>
                    <!-- /.card-body -->
                </div>
            </section>
        </div>
    </div>
    <!-- /.card -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
