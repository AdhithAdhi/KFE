<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="KFE.CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>CheckOut</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <form id="checkout" runat="server">
            <div class="row">
                <section class="col-lg-7 connectedSortable">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">
                                <i class="ion ion-clipboard mr-1"></i>
                                CheckOut
                            </h3>

                        </div>
                        <div class="card-body">

                            <div class="card card-secondary">
                                <div class="card-header">
                                    <h3 class="card-title"><i class="fas fa-map-marker-alt mr-1"></i>Delivery Info</h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Full Name</label>
                                        <asp:TextBox ID="NameText" class="form-control" required="" placeholder="Name"
                                            runat="server" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <asp:TextBox ID="EmailText" class="form-control" required="" placeholder="Email"
                                            runat="server" TextMode="Email"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Mobile Number</label>
                                        <asp:TextBox ID="MobileText" class="form-control" required="" placeholder="Mobile"
                                            runat="server" TextMode="Phone"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Address</label>
                                        <asp:TextBox ID="adr_Textarea" class="form-control" required="" placeholder="Enter Address" runat="server" Rows="2" Height="90px" TextMode="MultiLine"></asp:TextBox>

                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Pin Number</label>
                                        <asp:TextBox ID="PinText" class="form-control" required="" placeholder="Pin Number"
                                            runat="server" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.card-body -->

                            </div>
                            <div class="card card-primary card-outline-tabs">
                                <div class="card-header">
                                    <h3 class="card-title"><i class="fas fa-credit-card pr-2"></i>Payment Info</h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Payment Type</label>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="radio1" checked="">
                                            <label class="form-check-label">Cash On Delivery(cod)</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" disabled="">
                                            <label class="form-check-label">Credit Card</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" disabled="">
                                            <label class="form-check-label">Debit Card</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" disabled="">
                                            <label class="form-check-label">Net Banking</label>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->

                            </div>
                        </div>
                        <div class="card-footer">
                            <asp:Button CssClass="btn btn-warning float-right" ID="CheckOut1" runat="server" Text="CheckOut" OnClick="CheckOut_Click" />
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
                        <!-- /.card-body -->
                        <div class="card-footer">
                            
                            <asp:Button CssClass="btn btn-warning btn-block" ID="CheckOut2" runat="server" Text="CheckOut"  OnClick="CheckOut_Click" />
                        </div>
                    </div>
                </section>
            </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
