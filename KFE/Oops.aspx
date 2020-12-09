<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Oops.aspx.cs" Inherits="KFE.Oops" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Ooops....</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <section class="content">
      <div class="error-page">
        <h2 class="headline text-warning p-1"> Oops </h2>

        <div class="error-content">
          <h3><i class="fas fa-exclamation-triangle text-warning"></i> Oops! Page not found.</h3>

          <p>
                We could not find the page you were looking for.
                Meanwhile, you may <a href="/Shop">return to Shop</a>.
          </p>

        </div>
        <!-- /.error-content -->
      </div>
      <!-- /.error-page -->
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
