<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="VerificationSuccess.aspx.cs" Inherits="KFE.VerificationSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <form id="cart" runat="server">

            <div class="row">
                <section class="col-lg-7 connectedSortable">

                    <h3 class="text text-warning">Your email has verified</h3>
                    <p>
                        Your email has been verified. Please <a href="Login.aspx"> click </a> here to login.
                    </p>
                </section>
            </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
