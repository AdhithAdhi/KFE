<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminGallery.aspx.cs" Inherits="KFE.AdminGallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="form1" runat="server">
        <div class="container-fluid">


            <div class="card card-secondary">
                <div class="card-header">
                    <h3 class="card-title">Add New Image</h3>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Image Name</label>
                                <asp:TextBox ID="img_NameText" required="" class="form-control" placeholder="Name" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="customFile">Select Image</label>

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
                                <label for="inputStatus">Select Tag</label>
                                <select id="ddlFruits" class="form-control custom-select" onchange="SetSelectedText(this)">
                                    
                                    <option selected disabled>Select one</option>
                                    <%foreach(KFE.Models.GalleryWithTag gwt in GalleryTags.Tags) 
                                        { 
                                    %>
                                    <option value="<%:gwt.Tag %>"><%:gwt.ImageName %></option>
                                    <%}
                                    %>
                                </select>
                                <input type="hidden" id="hfFruitName" name="FruitName" />
                                <label class="text text-sm text-warning">Must select tag</label>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                    <asp:Button ID="upload" class="btn btn-primary float-right" runat="server" Text="Upload" OnClick="Upload_Click" />
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Available Sliders</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">


                    <asp:GridView ID="GridView1" class="table table-bordered table-striped"  runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnRowDeleting="SliderRowDeleting" OnSelectedIndexChanging="SliderRowViewing">
                        <Columns>
                            <asp:BoundField DataField="ImagePath" HeaderText="ImagePath" SortExpression="ImagePath" />
                            <asp:BoundField DataField="Tag" HeaderText="Tag" SortExpression="Tag" />
                            <asp:CommandField SelectText="View" ShowDeleteButton="True" ShowSelectButton="True">
                            <ControlStyle CssClass="btn btn-primary" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Kfe_Fresh_DBConnectionString %>" DeleteCommand="DELETE FROM [Gallery] WHERE [Id] = @original_Id AND [ImagePath] = @original_ImagePath AND [Tag] = @original_Tag" InsertCommand="INSERT INTO [Gallery] ([ImagePath], [Tag]) VALUES (@ImagePath, @Tag)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Gallery]" UpdateCommand="UPDATE [Gallery] SET [ImagePath] = @ImagePath, [Tag] = @Tag WHERE [Id] = @original_Id AND [ImagePath] = @original_ImagePath AND [Tag] = @original_Tag">
                        <DeleteParameters>
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_ImagePath" Type="String" />
                            <asp:Parameter Name="original_Tag" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ImagePath" Type="String" />
                            <asp:Parameter Name="Tag" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ImagePath" Type="String" />
                            <asp:Parameter Name="Tag" Type="String" />
                            <asp:Parameter Name="original_Id" Type="Int32" />
                            <asp:Parameter Name="original_ImagePath" Type="String" />
                            <asp:Parameter Name="original_Tag" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>


                </div>
                <!-- /.card-body -->
            </div>
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
        function SetSelectedText(ddlFruits) {
            var selectedText = ddlFruits.options[ddlFruits.selectedIndex].value;
            document.getElementById("hfFruitName").value = selectedText;
        }
    </script>
</asp:Content>
