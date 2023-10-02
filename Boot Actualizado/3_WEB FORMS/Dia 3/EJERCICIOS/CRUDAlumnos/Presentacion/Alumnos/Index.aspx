<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Presentacion.Alumnos.Index" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="gvAlumnos" runat="server" AllowPaging="True" AutoGenerateColumns="False" Height="369px" OnPageIndexChanging="gvAlumnos_PageIndexChanging" OnRowCommand="gvAlumnos_RowCommand" Width="998px" OnSelectedIndexChanged="gvAlumnos_SelectedIndexChanged" >
                <Columns>
                    <asp:BoundField DataField ="id"        HeaderText="Id" />
                    <asp:BoundField DataField ="nombre"  HeaderText="Nombre" />
                    <asp:BoundField DataField ="primerApellido" HeaderText="Primer Apellido" />
                    <asp:BoundField DataField ="segundoaPellido" HeaderText="Segundo Apellido" />
                    <asp:BoundField DataField ="correo" HeaderText="Correo" />
                    <asp:BoundField DataField ="telefono" HeaderText="Telefono" />
                    <asp:BoundField DataField="idEstadoOrigen" HeaderText="Estados" />
                    <asp:BoundField DataField="idEstatus" HeaderText="Estatus" />
                    <asp:ButtonField Text="Detalles" CommandName="btnDetalles">
                    <ControlStyle CssClass="btn btn-warning btn-sm" />
                    </asp:ButtonField>
                    <asp:ButtonField Text="Editar" CommandName="btnEditar">
                    <ControlStyle CssClass="btn btn-success btn-sm" />
                    </asp:ButtonField>
                    <asp:ButtonField Text="Eliminar" CommandName="btnEliminar">
                    <ControlStyle CssClass="btn btn-danger btn-sm" />
                    </asp:ButtonField>
                </Columns>
               </asp:GridView>
    
</asp:Content>
