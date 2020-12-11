<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="KFE.AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- ChartJS -->
    <script src="template/Admin/plugins/chart.js/Chart.min.js"></script>
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <form id="form1" runat="server">

        <div class="container-fluid">
            <h2>Admin Home</h2>
            <div class="row mb-2">
                <div class="col-sm-6">
                    

                    <div class="card">
                        <div class="card-header border-0">
                            <div class="d-flex justify-content-between">
                                <h3 class="card-title">Online Store Visitors</h3>
                            </div>
                        </div>

                        <div class="card-body">
                            <div class="d-flex">
                                <p class="d-flex flex-column">
                                    <span class="text-bold text-lg"><%:GetAllVisitersCount() %></span>
                                    <span>Visitors Over Time</span>
                                </p>
                                <%if (CompareToLastWeek() > 0)
                                    {%>
                                <p class="ml-auto d-flex flex-column text-right">
                                    <span class="text-success">
                                        <i class="fas fa-arrow-up"></i><%:CompareToLastWeek() %>%
                                    </span>
                                    <span class="text-muted">Since last week</span>
                                </p>
                                <%}
                                    else
                                    {%>
                                <p class="ml-auto d-flex flex-column text-right">
                                    <span class="text-danger">
                                        <i class="fas fa-arrow-down"></i><%:-(CompareToLastWeek()) %>%
                                    </span>
                                    <span class="text-muted">Since last week</span>
                                </p>
                                <%} %>
                            </div>
                            <div class="chart">
                                <asp:Literal ID="Literal" runat="server"></asp:Literal>

                            </div>
                            <div class="d-flex flex-row justify-content-end">
                                <span class="mr-2">
                                    <i class="fas fa-square text-primary mr-1"></i>This Week
                                </span>

                                <span>
                                    <i class="fas fa-square text-gray mr-1"></i>Last Week
                                </span>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <div class="card bg-gradient-info" style="position: relative; left: 0px; top: 0px;">
                        <div class="card-header border-0">
                            <h3 class="card-title">
                                <i class="fas fa-th mr-1"></i>
                                Sales Graph
                            </h3>

                        </div>
                        <div class="card-body">
                            <div class="chartjs-size-monitor">
                                <div class="chartjs-size-monitor-expand">
                                    <div class=""></div>
                                </div>
                                <div class="chartjs-size-monitor-shrink">
                                    <div class=""></div>
                                </div>
                            </div>

                                <asp:Literal ID="SalesLiteral" runat="server"></asp:Literal>
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer bg-transparent">
                            <div class="row">
                                <div class="col-lg-3 col-6">
                                    <!-- small card -->
                                    <div class="small-box bg-white">
                                        <div class="inner">
                                            <h3><%:orderController.GetNewOrdersCount() %></h3>

                                            <p>New Orders</p>
                                        </div>
                                        <div class="icon">
                                            <i class="fas fa-cart-plus"></i>
                                        </div>
                                        <a href="OrdersProcessing.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <!-- ./col -->
                                <div class="col-lg-3 col-6">
                                    <!-- small card -->
                                    <div class="small-box bg-success">
                                        <div class="inner">
                                            <h3><%:orderController.GetDeliverdOrdersCount() %></h3>

                                            <p>Completed Orders</p>
                                        </div>
                                        <div class="icon">
                                            <i class="fas fa-check-circle"></i>
                                        </div>
                                        <a href="OrderDeliverd.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <!-- ./col -->
                                <div class="col-lg-3 col-6">
                                    <!-- small card -->
                                    <div class="small-box bg-warning">
                                        <div class="inner">
                                            <h3><%:orderController.GetProcessingOrdersCount() %></h3>

                                            <p>Processing Orders</p>
                                        </div>
                                        <div class="icon">
                                            <i class="fas fa-3x fa-sync-alt"></i>
                                        </div>
                                        <a href="OrdersAccepted.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <!-- ./col -->
                                <div class="col-lg-3 col-6">
                                    <!-- small card -->
                                    <div class="small-box bg-danger">
                                        <div class="inner">
                                            <h3><%:orderController.GetTotalOrdersCount() %></h3>

                                            <p>Total Orders</p>
                                        </div>
                                        <div class="icon">
                                            <i class="fas fa-shopping-cart"></i>
                                        </div>
                                        <a href="" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <!-- ./col -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.card-footer -->
                    </div>

                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
            <%--<div class="card">
                <div class="card-header">
                    <h3 class="card-title">Available Sliders</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">

                    <asp:GridView class="table table-bordered table-striped" ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnRowDeleting="SliderRowDeleting" OnSelectedIndexChanging="SliderRowViewing">
                        <Columns>
                            <asp:BoundField DataField="ImagePath" HeaderText="ImagePath" SortExpression="ImagePath" />
                            <asp:CommandField SelectText="View" ShowDeleteButton="True" ShowSelectButton="True">
                                <ControlStyle CssClass="btn btn-primary" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>

                </div>
                <!-- /.card-body -->
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Kfe_Fresh_DBConnectionString %>" SelectCommand="SELECT * FROM [SliderImages]" OldValuesParameterFormatString="original_{0}"></asp:SqlDataSource>--%>
        </div>
    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <script src="template/Admin/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="template/Admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="template/Admin/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="template/Admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    
    <!-- bs-custom-file-input -->
    <script src="template/Admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            bsCustomFileInput.init();
        });
    </script>
</asp:Content>
