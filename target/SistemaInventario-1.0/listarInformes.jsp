<%-- 
    Document   : listarEmpleados
    Created on : 31 mar. 2022, 08:43:44
    Author     : Empleado
--%>

<%@page import="sistemainventarios.capadatos.entidades.Empleado"%>
<%@page import="sistemainventarios.capadatos.entidades.Venta"%>
<%@page import="sistemainventarios.capadatos.entidades.Compra"%>
<%@page import="sistemainventarios.capadatos.entidades.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

%>
<jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.EmpleadoFacade" scope="session"></jsp:useBean>
<jsp:useBean id="fachadaV" class="sistemainventarios.negocio.facade.VentaFacade"></jsp:useBean>
<jsp:useBean id="fachadaC" class="sistemainventarios.negocio.facade.CompraFacade"></jsp:useBean>
<jsp:useBean id="fachadaP" class="sistemainventarios.negocio.facade.ProveedorFacade"></jsp:useBean>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Gestión Empleados</title>
            <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/dataTable/jquery.dataTables.min.css" rel="stylesheet">
            <link href="css/dataTable/buttons.dataTables.min.css" rel="stylesheet">
            <script src="js/validaciones.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/jquery-3.2.1.min.js"></script>
            <script src="js/dataTable/jquery.dataTables.min.js"></script>

            <script>
                $(document).ready(function () {
                    $("#btnVentas").click(function () {

                        var tablaFull = $('#tablaVentasFull').DataTable();

                        var valores = null;
                        var inicial = parseInt(tablaFull.data().length);

                        var tablaVacia = $('#tablaVentas').DataTable();
                        tablaVacia.clear().draw();

                        var fechai = Date.parse(document.getElementById("fechai").value);
                        var fechaf = Date.parse(document.getElementById("fechaf").value);

                        for (var i = 0; i < inicial; i++) {

                            valores = (tablaFull.row(i).data().toString()).split(",");

                            var fecha = Date.parse(valores[4]);

                            if (fecha >= fechai && fecha <= fechaf) {

                                tablaVacia.row.add([valores[0], valores[1], valores[2], valores[3], valores[4]]).draw(false);
                            }
                        }
                        document.getElementById("tablaComprasCB").style = "display:none;";
                        document.getElementById("tablaVentasCB").style = 'display:"";';

                    });
                });

                $(document).ready(function () {
                    $("#btnCompras").click(function () {

                        //window.alert("compras");

                        var tablaFull = $('#tablaComprasFull').DataTable();

                        var valores = null;
                        var inicial = parseInt(tablaFull.data().length);

                        var tablaVacia = $('#tablaCompras').DataTable();
                        tablaVacia.clear().draw();

                        var fechai = Date.parse(document.getElementById("fechai").value);
                        var fechaf = Date.parse(document.getElementById("fechaf").value);

                        for (var i = 0; i < inicial; i++) {

                            valores = (tablaFull.row(i).data().toString()).split(",");

                            var fecha = Date.parse(valores[4]);

                            if (fecha >= fechai && fecha <= fechaf) {

                                tablaVacia.row.add([valores[0], valores[1], valores[2], valores[3], valores[4]]).draw(false);
                            }
                        }
                        document.getElementById("tablaVentasCB").style = "display:none;";
                        document.getElementById("tablaComprasCB").style = 'display:"";';

                    });
                });

                $(document).ready(function () {
                    $("#btnProveedor").click(function () {

                        //window.alert("compras");

                        var tablaFull = $('#tablaComprasFull').DataTable();

                        var valores = null;
                        var inicial = parseInt(tablaFull.data().length);

                        var tablaVacia = $('#tablaCompras').DataTable();
                        tablaVacia.clear().draw();

                        var idPro1 = document.getElementById("idProveedor").value;
                        

                        for (var i = 0; i < inicial; i++) {

                            valores = (tablaFull.row(i).data().toString()).split(",");

                            var idPro2 = valores[1];

                            if (idPro1 === idPro2) {

                                tablaVacia.row.add([valores[0], valores[1], valores[2], valores[3], valores[4]]).draw(false);
                            }
                        }
                        document.getElementById("tablaVentasCB").style = "display:none;";
                        document.getElementById("tablaComprasCB").style = 'display:"";';

                    });
                });
            </script>

        </head>

        <div class="card-header">
            <h1>Administracion de Informes</h1>
        </div>

        <br>

        <table>
            <tr>
                <th>
                    <div>
                        <label style="width:10em; text-align:right;">Fecha Inicial: </label>
                    </div>
                </th>

                <th>
                    <div>
                        <input type="date" name="fecha" id="fechai" style="width: 200px; vertical-align:10px">
                    </div>
                </th>

                <th>
                    <div>
                        <label style="width:10em; text-align:right;">Fecha Final: </label>
                    </div>
                </th>

                <th>
                    <div>
                        <input type="date" name="fecha" id="fechaf" style="width: 200px; vertical-align:10px">
                    </div>
                </th>

                <th>
                    <div>
                        <label style="width:10em; text-align:right;">Proveedor:</label>
                    </div>
                </th>

                <th>
                    <div>
                        <select id="idProveedor" name="idProveedor" required class="form-control" name="proveedor" id="proveedor" style="width: 200px; height: 35px">
                            <option value="" selected >  </option>
                        <% for (Proveedor proveedor : fachadaP.buscarProveedores()) {
                        %>
                        <option value="<%= proveedor.getIdProveedor()%>"> <%= (proveedor.getNombre()).replace("_", " ")%> - <%= proveedor.getIdProveedor()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </th>
        </tr>

        <tr>
            <th>
            </th>

            <th>
                <div>
                    <button class="btn" id="btnCompras">
                        <i class="fa fa-toolbox" >
                        </i> Informe de Compras
                    </button>
                </div>
            </th>

            <th>
            </th>

            <th>
                <div>
                    <button class="btn" id="btnVentas">
                        <i class="fa fa-toolbox" >
                        </i> Informe de Ventas
                    </button>
                </div>
            </th>

            <th>
            </th>

            <th>
                <div>
                    <button class="btn" id="btnProveedor">
                        <i class="fa fa-toolbox" >
                        </i> Informe de Proveedor
                    </button>
                </div>
            </th>

        </tr>
    </table>


    <div class="card-body" id="tablaComprasCB" style="display: none;" >
        <div class="table-responsive">
            <table id="tablaCompras" class="table table-bordered">
                <thead>
                    <tr>
                        <th>Id Factura</th>
                        <th>Id Proveedor</th>
                        <th>Id Empleado</th>
                        <th>Total</th>
                        <th>Fecha</th>
                    </tr>                            
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>


    <div class="card-body" id="tablaVentasCB" style="display: none;" >
        <div class="table-responsive">
            <table id="tablaVentas" class="table table-bordered">
                <thead>
                    <tr>
                        <th>Id Factura</th>
                        <th>Id Cliente</th>
                        <th>Id Empleado</th>
                        <th>Total</th>
                        <th>Fecha</th>
                    </tr>                            
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>


    <div class="card-body" style="display: none;">
        <div class="table-responsive">
            <table id="tablaComprasFull" class="table table-bordered">
                <thead>
                    <tr>
                        <th>Id Factura</th>
                        <th>Id Proveedor</th>
                        <th>Id Empleado</th>
                        <th>Total</th>
                        <th>Fecha</th>
                    </tr>                            
                </thead>
                <tbody>
                    <% for (Compra compra : fachadaC.buscarCompras()) {
                    %>
                    <tr>                               
                        <td><%= compra.getIdCompra()%></td>
                        <td><%= compra.getIdProveedor()%></td>
                        <td><%= compra.getIdEmpleado()%></td>
                        <td><%= compra.getTotal()%></td>
                        <td><%= compra.getFecha()%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>

            </table>
        </div>
    </div>


    <div class="card-body" style="display: none;">
        <div class="table-responsive">
            <table id="tablaVentasFull" class="table table-bordered">
                <thead>
                    <tr>
                        <th>Id Factura</th>
                        <th>Id Cliente</th>
                        <th>Id Empleado</th>
                        <th>Total</th>
                        <th>Fecha</th>
                    </tr>                            
                </thead>
                <tbody>
                    <% for (Venta venta : fachadaV.buscarVentas()) {
                    %>
                    <tr>                               
                        <td><%= venta.getIdVenta()%></td>
                        <td><%= venta.getIdCliente()%></td>
                        <td><%= venta.getIdEmpleado()%></td>
                        <td><%= venta.getTotal()%></td>
                        <td><%= venta.getFecha()%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>

            </table>
        </div>
    </div>


    <div class="card-footer">

        <input type="button" style="display: none;"  value="Ir a inicio" 
               onclick="location.href = 'index.jsp'"
               class="btn btn-success">                       
    </div>

    <script src="js/dataTable/dataTables.buttons.min.js"></script>
    <script src="js/dataTable/buttons.flash.min.js"></script>
    <script src="js/dataTable/jszip.min.js"></script>
    <script src="js/dataTable/pdfmake.min.js"></script>
    <script src="js/dataTable/vfs_fonts.js"></script>
    <script src="js/dataTable/buttons.html5.min.js"></script>
    <script src="js/dataTable/buttons.print.min.js"></script>
    <script type="text/javascript">
                   $(document).ready(function () {
                       $('#tablaVentas').DataTable({
                           dom: 'Bfrtip',
                           buttons: [
                               'copy', 'csv', 'excel', 'pdf', 'print'
                           ]
                       });

                       $('#tablaCompras').DataTable({
                           dom: 'Bfrtip',
                           buttons: [
                               'copy', 'csv', 'excel', 'pdf', 'print'
                           ]
                       });
                   });
    </script>
</html>