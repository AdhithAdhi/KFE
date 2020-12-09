<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="VerificationError.aspx.cs" Inherits="KFE.VerificationError" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <form id="cart" runat="server">

            <div class="row">
                <section class="col-lg-7 connectedSortable">
                    
                    <h3 class="text text-warning">Verify yor email</h3>
                    <p>
                        We sent an email to make sure you own it. Please check your inbox and click the link to verify.
                    </p><br/>Or
                    <asp:Button ID="Resend" Text="Resend" CssClass="btn btn-primary" runat="server" OnClick="Resend_Click" />
                    <br />
                </section>
            </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
