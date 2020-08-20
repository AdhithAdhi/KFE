<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminSliderView.aspx.cs" Inherits="KFE.AdminSliderView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="form1" runat="server">
<div class="container-fluid">


    <div class="card card-secondary">
        <div class="card-header">
            <h3 class="card-title">Create New Slider</h3>
        </div>
        <!-- /.card-header -->
        <!-- form start -->
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Slider Heading</label>
                            <asp:TextBox ID="img_NameText" required="" class="form-control" placeholder="Name" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="customFile">Slider Image</label>

                            <div class="custom-file">
                                <asp:FileUpload ID="customFile" class="custom-file-input" runat="server" />
                                <label class="custom-file-label" for="customFile">Choose file</label>
                                <asp:RegularExpressionValidator
                                    ID="FileUpLoadValidator" runat="server"
                                    ErrorMessage="Upload Jpegs and Png only." CssClass="text-red"
                                    ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.png|.PNG)$"
                                    ControlToValidate="customFile">  
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.card-body -->

            <div class="card-footer">
                <asp:Button ID="sub_Button1" class="btn btn-primary float-right" runat="server" Text="Upload" OnClick="sub_Button1_Click" />
            </div>
    </div>

    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Available Sliders</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">

            <asp:GridView class="table table-bordered table-striped" ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnRowDeleting="SliderRowDeleting" OnSelectedIndexChanging="SliderRowViewing" AllowSorting="True">
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Kfe_Fresh_DBConnectionString %>" SelectCommand="SELECT * FROM [SliderImages]" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [SliderImages] WHERE [Id] = @original_Id AND (([ImagePath] = @original_ImagePath) OR ([ImagePath] IS NULL AND @original_ImagePath IS NULL))" InsertCommand="INSERT INTO [SliderImages] ([ImagePath]) VALUES (@ImagePath)" UpdateCommand="UPDATE [SliderImages] SET [ImagePath] = @ImagePath WHERE [Id] = @original_Id AND (([ImagePath] = @original_ImagePath) OR ([ImagePath] IS NULL AND @original_ImagePath IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_ImagePath" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ImagePath" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ImagePath" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_ImagePath" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
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

