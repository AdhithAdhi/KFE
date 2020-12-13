<%@ Page Title="" Language="C#" MasterPageFile="~/LoginLayout.Master" AutoEventWireup="true" CodeBehind="ResetSuccess.aspx.cs" Inherits="KFE.ResetSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <form id="cart" runat="server">

            <div class="row">
                <section class="col-lg-7 connectedSortable">

                    <h3 class="text text-warning">Password Reset Success</h3>
                    <p>
                        Your password reseted successfully. Please <a href="Login.aspx">click </a>here to login.
                    </p>
                </section>
            </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
