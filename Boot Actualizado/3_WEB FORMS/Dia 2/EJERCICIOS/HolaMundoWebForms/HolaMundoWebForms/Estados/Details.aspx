<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="HolaMundoWebForms.Estados.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <dl>
       <dt>
           <asp:Label ID="lblIdterm" runat="server" Text="Id"></asp:Label>
       </dt>
       <dd>
           <asp:Label ID="lblIddef" runat="server" Text=""></asp:Label>
       </dd>
        <dt>
           <asp:Label ID="lblNombreterm" runat="server" Text="Nombre"></asp:Label>
       </dt>
       <dd>
           <asp:Label ID="lblNombredef" runat="server" Text=""></asp:Label>
       </dd>
        <dt>
           <asp:Label ID="lblClaveterm" runat="server" Text="Clave"></asp:Label>
       </dt>
       <dd>
           <asp:Label ID="lblClavedef" runat="server" Text=""></asp:Label>
       </dd>
   </dl>
</asp:Content>
