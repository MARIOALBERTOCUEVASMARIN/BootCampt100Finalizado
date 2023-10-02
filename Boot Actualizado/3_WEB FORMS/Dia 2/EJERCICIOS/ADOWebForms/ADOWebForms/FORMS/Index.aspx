<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ADOWebForms.FORMS.Index" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class ="container">
        <h1>INDICE</h1>
        <asp:DropDownList ID="ddlEstatus" runat="server"></asp:DropDownList>
        <hr />
        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" ForeColor="Red" />
        <asp:Button ID="btnDetalles" runat="server" Text="Detalles" OnClick="btnDetalles_Click" ForeColor="Lime" />
        <asp:Button ID="btnEditar" runat="server" Text="Editar" OnClick="btnEditar_Click" ForeColor="Blue" />
        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" ForeColor="#FF6600" />
    </div>
</asp:Content>
