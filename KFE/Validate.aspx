<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Validate.aspx.cs" Inherits="KFE.Validate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <form id="cart" runat="server">

            <h3>
                <asp:Label ID="VerifiedLabel" CssClass="text text-warning" runat="server" Text=""></asp:Label></h3>
            <p>
                Oops! Something Went wrong, may be the link expired.<br />
                Click Resend button to generate new verification link.
            </p>
            <br />
            <asp:Button ID="Resend" Text="Resend" CssClass="btn btn-primary" runat="server" OnClick="Resend_Click" />
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
