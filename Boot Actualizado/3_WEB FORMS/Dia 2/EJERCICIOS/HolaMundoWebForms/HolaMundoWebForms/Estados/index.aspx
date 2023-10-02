<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HolaMundoWebForms.Estados.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblEstados" runat="server" Text="Estados"></asp:Label>
    <asp:DropDownList ID="ddlEstados" runat="server"></asp:DropDownList>
    <asp:Button ID="btnConsultar" runat="server" Text="Consultar" OnClick="btnConsultar_Click" />
</asp:Content>
