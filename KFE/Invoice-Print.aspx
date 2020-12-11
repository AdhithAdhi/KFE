<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice-Print.aspx.cs" Inherits="KFE.Invoice_Print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KfeFresh | Invoice Print</title>

    <link rel="stylesheet" href="template/Admin/plugins/fontawesome-free/css/all.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="template/Admin/dist/css/adminlte.min.css" />

    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <!-- Main content -->
            <section class="invoice">
                <!-- title row -->
                <div class="row">
                    <div class="col-12">
                        <%=""%>
                        <h2 class="page-header">
                            <img src="KFE_128.ico"/>
         
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
                            <strong>Kerala Fish Express</strong><br />
                            KFE, Kilikollur,<br />
                            Chandhanathope, Kollam<br />
                            Phone: (+91) 70 12 524 800<br />
                            Phone: (+91) 90 74 949 343<br />
                            Email: info@kfefresh.com
       
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        To
       
                        <address>
                            <strong><%:order.Address%></strong><br />
                            Phone: <%:order.ContactNumber %><br />
                            Email: <%:order.ContactEmail %>
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-3 invoice-col">
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
                                    <th>Qty(kg)</th>
                                    <th>Description</th>
                                    <th>Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%foreach (KFE.OrderItem ordItm in GetAllOderItemBy(order.OrderId))
                                    { %>
                                <tr>
                                    <td><%:GetProductBy(ordItm.ProductId).Title%></td>
                                    <td><%:ordItm.Quantity %></td>
                                    <td><%:GetProductBy(ordItm.ProductId).Description.Substring(0, 50)+"..."%></td>
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
                        <img src="template/Admin/dist/img/credit/visa.png" alt="Visa" />
                        <img src="template/Admin/dist/img/credit/mastercard.png" alt="Mastercard" />
                        <img src="template/Admin/dist/img/credit/american-express.png" alt="American Express" />
                        <img src="template/Admin/dist/img/credit/paypal2.png" alt="Paypal" />

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
            </section>
            <!-- /.content -->
        </div>
    </form>
    <script type="text/javascript"> 
        window.addEventListener("load", window.print());
</script>
</body>
</html>
