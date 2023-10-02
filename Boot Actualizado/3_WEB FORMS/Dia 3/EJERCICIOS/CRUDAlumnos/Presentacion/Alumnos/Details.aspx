<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Presentacion.Alumnos.Details" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <div class="container d-flex flex-column w-50 position-relative m-0">
        <h1>Datos del Alumno</h1>
        <div class ="row">
            <div class="col-sm d-flex justify-content-end"><strong><asp:Label ID="lblId" runat="server" Text="ID"></asp:Label></strong></div>
            <div class="col-sm"><asp:Label ID="lblidR" runat="server" Text=""></asp:Label></div>
        </div>
        <div class ="row">
            <div class="col-sm d-flex justify-content-end"><strong><asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label></strong></div>
            <div class="col-sm"><asp:Label ID="lblNombreR" runat="server" Text=""></asp:Label></div>
        </div>
        <div class ="row">
            <div class="col-sm d-flex justify-content-end"><strong><asp:Label ID="lblPA" runat="server" Text="Primer Apellido"></asp:Label></strong></div>
            <div class="col-sm"><asp:Label ID="lblPAR" runat="server" Text=""></asp:Label></div>
        </div>
        <div class ="row">
            <div class="col-sm d-flex justify-content-end"><strong><asp:Label ID="lblSA" runat="server" Text="Segundo Apellido"></asp:Label></strong></div>
            <div class="col-sm"><asp:Label ID="lblSAR" runat="server" Text=""></asp:Label></div>
        </div>
        <div class ="row">
            <div class="col-sm d-flex justify-content-end"><strong><asp:Label ID="lblFN" runat="server" Text="Label">Fecha Nacimiento</asp:Label></strong></div>
            <div class="col-sm"><asp:Label ID="lblFechaN" runat="server" Text=""></asp:Label></div>
        </div>
        <div class ="row">
            <div class="col-sm d-flex justify-content-end"><strong><asp:Label ID="lblCURP" runat="server" Text="Label">CURP</asp:Label></strong></div>
            <div class="col-sm"><asp:Label ID="lblCURPR" runat="server" Text=""></asp:Label></div>
        </div>
        <div class ="row">
            <div class="col-sm d-flex justify-content-end"><strong><asp:Label ID="lblCorreo" runat="server" Text="Label">Correo</asp:Label></strong></div>
            <div class="col-sm"><asp:Label ID="lblCorreoR" runat="server" Text=""></asp:Label></div>
        </div>
         <div class ="row">
            <div class="col-sm d-flex justify-content-end"><strong><asp:Label ID="lblTel" runat="server" Text="Label">Telefono</asp:Label></strong></div>
            <div class="col-sm"><asp:Label ID="lblTelR" runat="server" Text=""></asp:Label></div>
        </div>
         <div class ="row">
            <div class="col-sm d-flex justify-content-end"><strong><asp:Label ID="lblSM" runat="server" Text="Label">Sueldo Mensual</asp:Label></strong></div>
            <div class="col-sm"><asp:Label ID="lblSMR" runat="server" Text=""></asp:Label></div>
        </div>
         <div class ="row">
            <div class="col-sm d-flex justify-content-end"><strong><asp:Label ID="lblEstado" runat="server" Text="Label">Estado</asp:Label></strong></div>
            <div class="col-sm"><asp:Label ID="lblEstadoR" runat="server" Text=""></asp:Label></div>
        </div>
         <div class ="row">
            <div class="col-sm d-flex justify-content-end"><strong><asp:Label ID="lblEstatus" runat="server" Text="Label">Estatus</asp:Label></strong></div>
            <div class="col-sm"><asp:Label ID="lblEstatusR" runat="server" Text=""></asp:Label></div>
        </div>
            <br />
        <br />
    </div>
    <div>         
             <div class="col-sm">
                 <br />
                 <br />
               <!--  <asp:Button ID="Button1" runat="server" Text="CalcularIMSS" class="btn btn-light" OnClick="btnIMSS_Click" Height="68px" Width="109px" BackColor="#3399FF"/> -->
               <!--   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="lblCalcularIMSS" runat="server" Text="Calculo IMSS"></asp:Label>-->
                 <a id="btnCalcularIMSS" class="btn btn-default" onclick="CalcularIMSS()">Calcular IMSS</a>
                 <br />
                 <br />
                 <br />
                 <br />
                 <asp:Button ID="btnISR" runat="server" Text="CalcularISR" class="btn btn-light" OnClick="btnISR_Click" Height="68px" Width="109px" BackColor="Red"/>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <!--  <asp:Label ID="lblCalcularISR" runat="server" Text="Calculo de ISR"></asp:Label>-->
                 <br />
                 <br />
             </div>
        </div>

    <a href ="Index.aspx" class="btn text-decoration-none text-primary">Regresar a Lista</a>




    <div class="modal fade" tabindex="-1" role="dialog" id="MiModalISR">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Calcular ISR</h4>
              </div>
              <div class="modal-body">
                <dl>
                    <dt>Limite Superior</dt>
                    <dd><asp:Label ID="lbllS" runat="server" Text="Label"></asp:Label></dd>
                    <dt>limiteInferior</dt>
                    <dd><asp:Label ID="lblLI" runat="server" Text="Label"></asp:Label> </dd>
                    <dt>cuotaFija</dt>
                    <dd><asp:Label ID="lblCF" runat="server" Text="Label"></asp:Label></dd>
                    <dt>excedente</dt>
                    <dd><asp:Label ID="lblE" runat="server" Text="Label"></asp:Label></dd>
                    <dt>subsidio</dt>
                    <dd><asp:Label ID="lblS" runat="server" Text="Label"></asp:Label></dd>
                    <dt>isr</dt>
                    <dd><asp:Label ID="lblISR" runat="server" Text="Label"></asp:Label></dd>
                </dl>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <!--<button type="button" class="btn btn-primary">Save changes</button>-->
              </div>
            </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->







            <div class="modal" id="modalIMSS" tabindex="-1" aria-labelledby="modalIMSSlabel" aria-hidden="false">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header" style="margin-bottom: 2rem">
                        <h1 class="modal-title fs-5">Calculo del IMSS</h1>
                        <asp:Button ID="btnCrerrarImms" runat="server" CssClass="btn btn-close"/>
                    </div>
                    <div class="modal-body">
                        <div class="row"><asp:Label ID="Label13" runat="server" Text="Enfermedades y Maternidad" CssClass="fw-bold"></asp:Label></div>
                        <div class="row"><asp:Label ID="lblEyM" runat="server" Text=""></asp:Label></div>
                        <div class="row"><asp:Label ID="Label15" runat="server" Text="Invalidez y Vida" CssClass="fw-bold"></asp:Label></div>
                        <div class="row"><asp:Label ID="lblIyV" runat="server" Text=""></asp:Label></div>
                        <div class="row"><asp:Label ID="Label17" runat="server" Text="Retiro" CssClass="fw-bold"></asp:Label></div>
                        <div class="row"><asp:Label ID="lblR" runat="server" Text=""></asp:Label></div>
                        <div class="row"><asp:Label ID="Label19" runat="server" Text="Cesantia" CssClass="fw-bold"></asp:Label></div>
                        <div class="row"><asp:Label ID="lblC" runat="server" Text=""></asp:Label></div>
                        <div class="row"><asp:Label ID="Label21" runat="server" Text="Infonavit" CssClass="fw-bold"></asp:Label></div>
                        <div class="row"><asp:Label ID="lblI" runat="server" Text=""></asp:Label></div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnCerrarIMSS" runat="server" Text="Cerrar" CssClass="btn btn-danger"/>
                        
                    </div>
                </div>
            </div>
        </div>











      <script type="text/javascript">
          function CalcularIMSS() {
              var urlws = 'http://localhost:54402/WSAlumnos.asmx/'
              var idA = $("#<%= lblidR.ClientID%>").text();
              var alumno = { id: idA };
              var parametros = JSON.stringify(alumno);
              $.ajax(
                  {
                      type: 'POST',
                      url: urlws,
                      data: parametros,
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: MuestraAportacionesIMSS

                  }
              );



          }
          function MuestraAportacionesIMSS(data) {
              try {
                  var IMSS = data.d;
                  if (data != null) {
                      $("#<%=lblEyM.ClientID%>").text(IMSS.enfermedadMaternidad);
                    $("#<%=lblIyV.ClientID%>").text(IMSS.invalidezVida);
                    $("#<%=lblR.ClientID%>").text(IMSS.retiro);
                    $("#<%=lblC.ClientID%>").text(IMSS.cesantia);
                    $("#<%=lblI.ClientID%>").text(IMSS.infonavit);
                    $('#MiModalIMSS').modal('show');
                }
                else {
                    alert('La respuesta recibida es incorrecta ' + data.d);
                }

            }
            catch (ex) {
                alert('Error al recibir los datos');
            }
        }
          
      </script>
</asp:Content>
