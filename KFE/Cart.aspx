<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="KFE.Cart" %>

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
