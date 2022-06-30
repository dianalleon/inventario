<%-- 
    Document   : insertarVenta.jsp
    Created on : 11 may. 2021, 09:57:25
    Author     : Videoadicto
--%>

<%-- <%@page import="sistemainventarios.capadatos.entidades.Venta"%> --%>
<%@page import="sistemainventarios.capadatos.entidades.Categoria"%>
<%@page import="sistemainventarios.capadatos.entidades.Producto"%>
<%@page import="sistemainventarios.capadatos.entidades.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="fachada2" class="sistemainventarios.negocio.facade.VentaFacade" scope="page"></jsp:useBean>
        <jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.ProductoFacade"></jsp:useBean>
        <jsp:useBean id="fachada3" class="sistemainventarios.negocio.facade.ClienteFacade"></jsp:useBean>
        <%--     <jsp:useBean id="fachada2" class="sistemainventarios.negocio.facade.CategoriaFacade"></jsp:useBean> --%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Gestión Productos</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/dataTable/jquery.dataTables.min.css" rel="stylesheet">
        <link href="css/dataTable/buttons.dataTables.min.css" rel="stylesheet">
        <script src="js/validaciones.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/dataTable/jquery.dataTables.min.js"></script>

        <title>Ventas</title>
        <script>
            $("button").click(function () {
                //separar($(this).val());

                //var dato = $('#tablaProductos1').DataTable().row('.selected').data();




                var table = $('#tablaProductos1').DataTable();

                $('#tablaProductos1 tbody').on('click', 'tr', function () {
                    var fila = table.row(this).index();
                    var datos = $('#tablaProductos1').DataTable().row(fila).data().toString();
                    //window.alert("" + datos.toString());


                    var inicio = 0;
                    var fin = 1;
                    valor = "";
                    do {

                        var valor = datos.substring(inicio, fin);
                        inicio++;
                        fin++;

                    } while (valor !== "<");
                    fin = fin - 3;

                    valor = datos.substring(0, fin);

                    //window.alert("diii" + valor);

                    separar(valor);

                });



                //window.alert("" + adc1.toString());

                //var adc = adc1.split(";");
                //document.getElementById("idProducto").value = adc[0];
                //document.getElementById("nombre").value = adc[1];
                //document.getElementById("precio").value = adc[2];
                //document.getElementById("cantidadX").value = adc[3];



            });

            $(document).ready(function () {
                $("#btnAgregar1").click(function () {

                    var cantidad1 = parseInt(document.getElementById("cantidadX").value);

                    if ((document.getElementById("cantidad").value).replace(" ", "") !== "" && document.getElementById("idProducto").value !== "")
                    {

                        var cantidad2 = parseInt(document.getElementById("cantidad").value);

                        //window.alert("c2 " + cantidad2 + "c1 " + cantidad1);

                        if (cantidad1 >= cantidad2) {

                            var t = $('#tablaProductos2').DataTable();
                            t.row.add([document.getElementById("idProducto").value, document.getElementById("nombre").value, document.getElementById("precio").value, document.getElementById("cantidad").value]).draw(false);
                            limpiarProducto();
                        } else
                        {
                            document.getElementById("sinStock").style = 'display:"";';
                            document.getElementById("sinDatos").style = "display:none;";
                        }

                    } else {
                        document.getElementById("sinDatos").style = 'display:"";';
                        document.getElementById("sinStock").style = "display:none;";
                    }
                });
            });

            $(document).ready(function () {
                $("#btnAgregar2").click(function () {

                    var table = $('#tablaProductos2').DataTable();
                    //console.log(table.row(this).data());
                    //
                    //window.alert("" + table.data().length);
                    //window.alert("" + table.row(0).data().toString());
                    //window.alert("" + table.data().count());
                    //Procesar(X = ("" + table.data().length), Y = ("" + table.row(0).data().toString()));
                    var valores = null;
                    var lista1 = "";
                    var total1 = 0;
                    var inicial = parseInt(table.data().length);
                    for (var i = 0; i < inicial; i++) {

                        valores = (table.row(i).data().toString()).split(",");

                        total1 = total1 + parseInt(valores[2]) * parseInt(valores[3]);

                        lista1 = lista1 + "id~~" + valores[0] + "¬¬Nombre~~" + valores[1] + "¬¬Cantidad~~" + valores[3] + "~¬~";
                    }
                    document.getElementById("total").value = total1;
                    document.getElementById("lista").value = lista1;

                    $("#boxInsertar").load("pg-venta/guardarVenta.jsp?" + (validarDatosVenta(nuevo = 1, filas = inicial)), function () {
                    });
                });
            });

            $(document).ready(function () {
                $("#btnSalir").click(function () {
                    $("#box").load("pg-venta/listarVenta.jsp?mens=0", function () {
                    });
                });
            });
        </script>
    </head>

    <body>

        <div class="card-header">
            <h1>Agregar Venta</h1>
        </div>

        <div class="card-body">
            <form id="frmRegistrar" name="frmRegistrar">

                <table class="table table-borderless">
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <th>                        
                                <div class="card-body" style="height: 540px; margin: 1px; border: 1px solid; background-color:white ">
                                    <input type="text" style="background-color:cornflowerblue"
                                           placeholder="" required
                                           class="form-control" readonly
                                           value = "SELECCIONA LOS PRODUCTOS DEL PROVEEDOR">
                                    <br>

                                    <div class="table-responsive">
                                        <table id="tablaProductos1" class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Nombre</th>
                                                    <th>Precio</th>
                                                    <th>Cantidad</th>
                                                    <th>Acciones</th>
                                                </tr>                            
                                            </thead>
                                            <tbody>
                                                <% for (Producto producto : fachada.buscarProductos()) {
                                                %>
                                                <tr>                               
                                                    <td><%= producto.getIdProducto()%></td>
                                                    <td><%= (producto.getNombre()).replace("_", " ")%></td>
                                                    <td><%= producto.getPrecio()%></td>
                                                    <td><%= producto.getCantidad()%></td>

                                                    <td>
                                                        <button type="button" class="btn btn-danger" value='<%= producto.getIdProducto()%>;<%= producto.getNombre()%>;<%= producto.getPrecio()%>' style="left : 1.2%; position:relative;">
                                                            </i> Agregar
                                                        </button>
                                                    </td>
                                                </tr>
                                                <%
                                                    }
                                                    //System.out.println(session.getAttribute("rol").toString());
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </th>

                            <th>
                                <div class="card-body" style="height: 540px; margin: 1px; border: 1px solid; background-color:white">

                                    <input type="text" style="background-color:cornflowerblue"
                                           placeholder="" required
                                           class="form-control" readonly
                                           value = "PRODUCTO">
                                    <br>

                                    <div class="form-group">
                                        <label for="idProducto" class="form-label">ID PRODUCTO:</label>
                                        <input type="text" name="idProducto" id="idProducto" 
                                               placeholder="" readonly
                                               class="form-control" >
                                    </div>

                                    <div class="form-group">
                                        <label for="nombre" class="form-label">NOMBRE:</label>
                                        <input type="text" name="nombre" id="nombre" 
                                               placeholder="" readonly
                                               class="form-control" >
                                    </div>

                                    <div class="form-group">
                                        <label for="precio" class="form-label">PRECIO:</label>
                                        <input type="text" name="precio" id="precio" 
                                               placeholder="" readonly
                                               class="form-control" >
                                    </div>

                                    <input id="cantidadX" name="cantidadX" value="" style="display: none;" >



                                    <div class="form-group">
                                        <label for="cantidad" class="form-label">CANTIDAD:</label>
                                        <input type="text" name="cantidad" id="cantidad" 
                                               placeholder="Ingrese la cantidad" required
                                               class="form-control" required>
                                    </div>

                                    <input type="button" id="btnAgregar1" value="Agregar Producto" class="btn" >

                                    <br>

                                    <div id="sinDatos" style="display: none;" class="alert alert-danger">Error: Hay campos vacios
                                    </div>

                                    <div id="sinStock" style="display: none;" class="alert alert-danger">Error: Cantidad sobrepasada
                                    </div>

                                </div>
                            </th>
                        </tr>

                        <tr>
                            <th>                        
                                <div class="card-body" style="height: 540px; margin: 1px; border: 1px solid; background-color:white ">
                                    <input type="text" style="background-color:cornflowerblue"
                                           placeholder="" required
                                           class="form-control" readonly
                                           value = "PRODUCTOS EN EL CARRITO">
                                    <br>

                                    <div class="table-responsive">
                                        <table id="tablaProductos2" class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Nombre</th>
                                                    <th>Precio</th>
                                                    <th>Cantidad</th>
                                                </tr>                            
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </th>

                            <th>

                                <div class="card-body" style="height: 540px; margin: 1px; border: 1px solid; background-color:white">
                                    <input type="text" style="background-color:cornflowerblue"
                                           placeholder="" required
                                           class="form-control" readonly
                                           value = "TERMINAR LA VENTA">
                                    <br>

                                    <div class="form-group">
                                        <label for="idFactura" class="form-label">NUMERO DE FACTURA:</label>
                                        <input type="text" name="idFactura" id="idFactura" 
                                               placeholder="" required
                                               class="form-control" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="idCliente">CLIENTE: </label>
                                        <select id="idCliente" name="idCliente" required class="form-control">
                                            <option value="" selected >  </option>
                                            <%
                                                for (Cliente cliente : fachada2.getCliente()) {
                                            %>
                                            <option value="<%= cliente.getCedula()%>"> <%= (cliente.getNombre()).replace("_", " ")%> - <%= cliente.getCedula()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>

                                    <input type="button" id="btnAgregar2" value="Agregar Pedido" class="btn" >

                                    <br>

                                    <div id="divInsertar" style="display: none;" class="alert alert-danger">
                                    </div>
                                </div>
                            </th>
                        </tr>

                        <tr>                               
                            <th>
                                <div id="boxInsertar">
                                </div>

                                <div class="form-group">
                                    <input type="button" id="btnSalir" value="Regresar" class="btn btn-success" >
                                </div>
                            </th>
                            <th>

                            </th>
                        </tr>
                    </tbody>
                </table>

                <input id="total" style="display: none;" value = "" >
                <input id="lista" style="display: none;" value = "" >
            </form>
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
                $('#tablaProductos1').DataTable({
                    pageLength: 5
                });
            });

            $(document).ready(function () {
                $('#tablaProductos2').DataTable({
                    pageLength: 5
                });
            });
        </script>


        <%  String idEmpleado4 = request.getParameter("uid");
            {
        %>

        <input id="uid" style="display: none;" value = <%= idEmpleado4%> >

        <%
            }
        %>

    </body>
</html>