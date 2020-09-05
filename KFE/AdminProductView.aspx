<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminProductView.aspx.cs" Inherits="KFE.AdminProductView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server"><form id="form1" runat="server">
<div class="container-fluid">


    <div class="card card-secondary">
        <div class="card-header">
            <h3 class="card-title">Add New Product</h3>
        </div>
        <!-- /.card-header -->
        <!-- form start -->
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Product Name</label>
                            <asp:TextBox ID="img_NameText" required="" class="form-control" placeholder="Name" runat="server"></asp:TextBox>
                        </div>
                            <div class="form-group">
                                <label for="inputStatus">Select Category</label>
                                <select id="ddlFruits" class="form-control custom-select" onchange="SetSelectedText(this)">
                                    
                                    <option selected disabled>Select one</option>
                                    <%foreach(KFE.Category gwt in categories.GetCategories()) 
                                        { 
                                    %>
                                    <option value="<%:gwt.Id %>"><%:gwt.Name %></option>
                                    <%}
                                    %>
                                </select>
                                <input type="hidden" id="hfFruitName" name="FruitName" />
                                <label class="text text-sm text-warning">Must select tag</label>
                            </div>
                        <div class="form-group">
                            <label for="customFile">Product Image</label>

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
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Product Price</label>
                            <asp:TextBox ID="PriceText" required="" class="form-control" placeholder="Price" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Current Stock</label>
                            <asp:TextBox ID="StockText" required="" class="form-control" placeholder="Stock Count" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Product Description</label>
                            <asp:TextBox ID="img_Textarea"  class="form-control" required="" placeholder="Enter Description.." runat="server" Rows="3" Height="90px" TextMode="MultiLine"></asp:TextBox>
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
            <h3 class="card-title">Available Products</h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">

            <asp:GridView class="table table-bordered table-striped" ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnRowDeleting="SliderRowDeleting">
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="StockCount" HeaderText="StockCount" SortExpression="StockCount" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                    <ControlStyle CssClass="btn btn-primary" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>

        </div>
        <!-- /.card-body -->
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Kfe_Fresh_DBConnectionString %>" SelectCommand="SELECT * FROM [Products]" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Products] WHERE [Id] = @original_Id AND [Title] = @original_Title AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([ImagePath] = @original_ImagePath) OR ([ImagePath] IS NULL AND @original_ImagePath IS NULL))" InsertCommand="INSERT INTO [Products] ([Title], [Description], [ImagePath]) VALUES (@Title, @Description, @ImagePath)" UpdateCommand="UPDATE [Products] SET [Title] = @Title, [Description] = @Description, [ImagePath] = @ImagePath WHERE [Id] = @original_Id AND [Title] = @original_Title AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([ImagePath] = @original_ImagePath) OR ([ImagePath] IS NULL AND @original_ImagePath IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_ImagePath" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ImagePath" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ImagePath" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_ImagePath" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
    
    </form>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <!-- DataTables -->
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
        function SetSelectedText(ddlFruits) {
            var selectedText = ddlFruits.options[ddlFruits.selectedIndex].value;
            document.getElementById("hfFruitName").value = selectedText;
        }
    </script>
</asp:Content>
