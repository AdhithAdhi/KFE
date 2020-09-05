<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="KFE.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <h2>Admin Home</h2>
            <div class="row mb-2">
                <div class="col-sm-6">
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <asp:ScriptManager ID="ScriptManager1"
                        runat="server">
                    </asp:ScriptManager>

                    <asp:Timer ID="Timer1" runat="server" Interval="100" OnTick="Timer1_Tick">
                    </asp:Timer>

                    <asp:UpdatePanel ID="UpdatePanel1"
                        runat="server">

                        <ContentTemplate>

                            <asp:Label ID="Label1" runat="server" Font-Bold="True" ></asp:Label>

                        </ContentTemplate>

                        <Triggers>

                            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick"></asp:AsyncPostBackTrigger>

                        </Triggers>

                    </asp:UpdatePanel>

                    <br />
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
            <div class="card card-secondary">
                
              <div class="card-header">
                <h3 class="card-title">
                  <i class="far fa-chart-bar"></i>
                  Visitors Count
                </h3>

              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="row">
                    <div class="col-lg-3 col-6">
                      <!-- small box -->
                      <div class="small-box bg-success">
                          <div class="inner">
                              <h3>
                                  <asp:Label ID="TodayVisitor" runat="server" Text=""></asp:Label>
                              </h3>
                              <p>Today's Visitors</p>
                          </div>
                          <div class="icon">
                              <i class="ion ion-stats-bars"></i>
                          </div>
                          <div class="small-box-footer"></div>
                      </div>
                  </div>
                  <!-- ./col -->
                    <div class="col-lg-3 col-6">
                      <!-- small box -->
                      <div class="small-box bg-danger">
                          <div class="inner">
                              <h3>
                                  <asp:Label ID="TotalVisitor" runat="server" Text=""></asp:Label>
                              </h3>

                              <p>Total Visitors</p>
                          </div>
                          <div class="icon">
                              <i class="ion ion-pie-graph"></i>
                          </div>
                          <div class="small-box-footer"></div>
                      </div>
                  </div>
                  <!-- ./col -->
                </div>
                <!-- /.row -->
              </div>
              <!-- /.card-body -->
                <div class="card-footer">
                    <asp:Button ID="Clear" class="btn btn-primary float-right" runat="server" Text="Delete All" OnClick="DeleteAllOnClick" OnClientClick="if (!confirm('Are you sure you want to delete?')) return false;" />
                </div>
            </div>

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

    <!-- page script -->
    <script>
        $(function () {
            $("#example1").DataTable({
                "responsive": true,
                "autoWidth": false,
            });
            $('#example2').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            bsCustomFileInput.init();
        });
    </script>
</asp:Content>
