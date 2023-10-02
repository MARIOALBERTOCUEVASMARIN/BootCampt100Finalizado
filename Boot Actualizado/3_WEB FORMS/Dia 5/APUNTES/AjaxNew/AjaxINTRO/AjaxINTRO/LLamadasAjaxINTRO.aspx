<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LLamadasAjaxINTRO.aspx.cs" Inherits="AjaxINTRO.LLamadasAjaxINTRO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
        <h2>Datos del Alumno</h2>
        <dl class="dl-horizontal">
            <dt>ID</dt>
            <dd>
                <asp:Label ID="lblID" runat="server" Text=""></asp:Label>
            </dd>
            <dt>Nombre</dt>
            <dd>
                <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
            </dd>
            <dt>Edad</dt>
            <dd>
                <asp:Label ID="lblEdad" runat="server" Text=""></asp:Label>
            </dd>
            <dt>Estado</dt>
            <dd>
                <asp:Label ID="lblEstado" runat="server" Text=""></asp:Label>
            </dd>
        </dl>
        <div class="form-group">
            <div class="col-md-2">
                <a href="javascript:void(0)" id="btnPaseIDAjax" class="btn btn-default" onclick="PaseID()">PaseID - Ajax</a>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-2">
                <a href="javascript:void(0)" id="btnPaseParametrosAjax" class="btn btn-default" onclick="PaseParametros()">PaseParametros - Ajax</a>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-2">
                <a href="javascript:void(0)" id="btnPaseObjetoAjax" class="btn btn-default" onclick="PaseObjeto()">PaseObjeto - Ajax</a>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-2">
                <a href="javascript:void(0)" id="btnPaseStringAjax" class="btn btn-default" onclick="PaseString()">PaseString - Ajax</a>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-2">
                <a href="javascript:void(0)" id="btnRecibeAjax" class="btn btn-default" onclick="RegresaObjeto()">RegresaObjeto - Ajax</a>
            </div>
        </div>

    </div>
    <script type="text/javascript">
        function PaseID() {
            $.ajax(
                {
                    type: 'POST',
                    url: "https://localhost:44320/LLamadasAjaxINTRO.aspx/PaseID",
                    data: "{'id':'1'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: funcExito,
                    error: errorGenerico
                }
            );

        }
        function PaseParametros() {
            var urlws = '<%= ResolveUrl("~/LLamadasAjaxINTRO.aspx/PaseParametros")%>'
            var alumno = { id: 1, nombre: "Jorge", edad: 25, estado: "CDMX" };
            var parametros = JSON.stringify(alumno);
            $.ajax(

                {
                    type: 'POST',
                    url: urlws,
                    data: "{'id':'1','nombre':'Jorge','edad':'25','estado':'CDMX'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: funcExito,
                    error: errorGenerico
                }
            );

        }

        function PaseObjeto() {
            var urlws = '<%= ResolveUrl("~/LLamadasAjaxINTRO.aspx/PaseObjeto")%>';
            var alumno = { id: 1, nombre: "Jorge", edad: 25, estado: "CDMX" };
            var alumnoJson = JSON.stringify(alumno);
            var parametro = "{'alumno':" + alumnoJson + "}";
            $.ajax({
                type: 'POST',
                url: urlws,
                data: parametro,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: funcExito,
                error: errorGenerico
            });

        }
        function PaseString() {
            var urlws = '<%= ResolveUrl("~/LLamadasAjaxINTRO.aspx/PaseString")%>';
            var alumno = { id: 1, nombre: "Jorge", edad: 25, estado: "CDMX" };
            var alumnoJson = JSON.stringify(alumno);
            var parametro = "{'alumno':'" + alumnoJson + "'}";
            $.ajax({
                type: 'POST',
                url: urlws,
                data: parametro,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: funcExito,
                error: errorGenerico
            });
        }

        function RegresaObjeto() {
            var urlws = '<%= ResolveUrl("~/LLamadasAjaxINTRO.aspx/RegresaObjeto")%>';
            var alumno = { id: 1 };
            var parametros = JSON.stringify(alumno);

            $.ajax({
                type: 'POST',
                url: urlws,
                data: parametros,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: RecibeObjeto,
                error: errorGenerico
            });

        }
        function funcExito(resultado, estatus, jqXHR) {
            var oRespuesta;
            try {
                oRespuesta = JSON.parse(resultado.d);
                if (oRespuesta != null) {
                    if (oRespuesta.Mensaje == "Exito") {
                        alert('Transacción efectuada con éxito');
                        /*window.location.href = "Default.aspx";*/
                    }
                    else {
                        alert(oRespuesta.Mensaje);
                    }
                }
                else {
                    alert('La respuesta recibida del Web Service es incorrecta ' + resultado.d);
                }
            }
            catch (ex) {
                alert('Error al recibir los datos');
            }
        }



        function RecibeObjeto(resultado, estatus, jqXHR) {
            try {
                alumno = resultado.d;
                if (alumno != null) {
                    $("#<%=lblID.ClientID%>").text(alumno.id);
                    $("#<%=lblNombre.ClientID%>").text(alumno.nombre);
                    $("#<%=lblEdad.ClientID%>").text(alumno.edad);
                    $("#<%=lblEstado.ClientID%>").text(alumno.estado);
                }
                else {
                    alert('La respuesta recibida es incorrecta ' + resultado.d);
                }

            }
            catch (ex) {
                alert('Error al recibir los datos');
            }
        }




        function errorGenerico(jqXHR, estatus, error) {
            var msg = '';
            if (jqXHR.status === 0) {
                msg = 'No está conectado, favor de verificar su conexión.';
            }
            else if (jqXHR.status === 404) {
                msg = 'Página no encontrada [404]';
            }
            else if (jqXHR.status === 500) {
                msg = 'Error no hay conexión al servidor [500]';
            }
            else if (jqXHR.status === 'parseerror') {
                msg = 'El parseo del JSON es erróneo.';
            }
            else if (jqXHR.status === 'timeout') {
                $('body').addClass('loaded');
            }
            else if (jqXHR.status === 'abort') {
                msg = 'La petición Ajax fue abortada.';
            }
            else {
                msg = 'Error no conocido. ';
                console.log(exception);
            }
            alert(msg);
        }

    </script>
</asp:Content>
