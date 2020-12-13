<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="KFE.Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <title>Invoice | KfeFresh</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <form id="invoice" runat="server">
            <div class="col-12">
                <div class="callout callout-info">
                    <h5><i class="fas fa-info"></i>Note:</h5>
                    This page has been enhanced for printing. Click the print button at the bottom of the invoice to test.
                </div>


                <!-- Main content -->
            <section class="invoice p-3 mb-3">
                <!-- title row -->
                <div class="row">
                    <div class="col-12">
                        <%=""%>
                        <h2 class="page-header">
                            <img src="KFE_128.ico"/>KfeFresh.
         
                            <small class="float-right">Date: <%:order.Date.ToString("dd/MM/yyyy") %></small>
                        </h2>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- info row -->
                <div class="row invoice-info">
                    <div class="col-sm-4 invoice-col">
                        From
       
                        <address>
                           <strong>Kerala Fish Express.</strong><br />
                            KFE, Kilikollur,<br />
                            Chandhanathope, Kollam<br />
                            Phone: (+91) 70 12 524 800<br />
                            Phone: (+91) 90 74 949 343<br />
                            Email: info@kfefresh.com
       
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-3 invoice-col">
                        To
       
                        <address>
                            <strong><%:order.Address%></strong><br />
                            Phone: <%:order.ContactNumber %><br />
                            Email: <%:order.ContactEmail %>
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        <b>Invoice #Inv<%:EnrcyptedOrder().Substring(0,10)%></b><br />
                        <br />
                        <b>Order ID:</b> <%:EnrcyptedOrder()%><br />
                        <b>Payment Date:</b> <%:order.Date.ToString("dd/MMM/yyyy") %><br />

                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <!-- Table row -->
                <div class="row">
                    <div class="col-12 table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Description</th>
                                    <th>Qty(kg)</th>
                                    <th>Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%foreach (KFE.OrderItem ordItm in GetAllOderItemBy(order.OrderId))
                                    { %>
                                <tr>
                                    <td><%:GetProductBy(ordItm.ProductId).Title%></td>
                                    <td><%:GetProductBy(ordItm.ProductId).Description.Substring(0, 50)+"..."%></td>
                                    <td><%:ordItm.Quantity %></td>
                                    <td><%:ordItm.Amount%></td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <div class="row">
                    <!-- accepted payments column -->
                    <div class="col-6">
                        <p class="lead">Payment Methods:</p>
                        <img src="template/Admin/dist/img/credit/visa.png" alt="Visa"/>
                        <img src="template/Admin/dist/img/credit/mastercard.png" alt="Mastercard"/>
                        <img src="template/Admin/dist/img/credit/american-express.png" alt="American Express"/>
                        <img src="template/Admin/dist/img/credit/paypal2.png" alt="Paypal"/>

                        <p class="text-muted well well-sm shadow-none" style="margin-top: 10px;">
                            <%:order.PaymentType %>
       
                        </p>
                    </div>
                    <!-- /.col -->
                    <div class="col-6">
                        <p class="lead">Amount</p>

                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <th style="width: 50%">Subtotal:</th>
                                    <td>₹<%:order.Price %></td>
                                </tr>
                                <tr>
                                    <th>Tax (0.0%)</th>
                                    <td>₹0.0</td>
                                </tr>
                                <tr>
                                    <th>Shipping:</th>
                                    <td>₹0.0</td>
                                </tr>
                                <tr>
                                    <th>Total:</th>
                                    <td>₹<%:order.Price %></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
                <div class="row no-print">
                    <div class="col-12">
                        <a href="Invoice-Print?Order=<%:EnrcyptedOrder()%>" target="_blank" class="btn btn-primary float-right"><i class="fas fa-print mr-2"></i>Print</a>
                    </div>
                </div>
            </section>
                <!-- /.invoice -->
            </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
