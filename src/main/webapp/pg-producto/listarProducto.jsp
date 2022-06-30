<%-- 
    Document   : listarProductos
    Created on : 31 mar. 2022, 08:43:44
    Author     : Videoadicto
--%>

<%@page import="sistemainventarios.capadatos.entidades.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%-- 
<%
    String msg = request.getParameter("msg");
    if (msg.contains("0")) {
        msg = "";
    }
%>
--%>
<jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.ProductoFacade"></jsp:useBean>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Gestión Productos</title>
            <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/dataTable/jquery.dataTables.min.css" rel="stylesheet">
            <link href="css/dataTable/buttons.dataTables.min.css" rel="stylesheet">
            <script src="js/validaciones.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/jquery-3.2.1.min.js"></script>
            <script src="js/dataTable/jquery.dataTables.min.js"></script>

            <script>
                $("button").click(function () {

                    $("#box").load(verificarPagina($(this).val()), function () {
                    });
                });
            </script>
        </head>

        <div class="card-header">
            <h1>Administracion de Productos</h1>
        </div>

        <br>

        <div>
        <%--            <button class="btn" onclick="location.href = 'productoForm.html'" style="top : 15%; left : 87%; position:relative"> --%>
        <button class="btn" id="nuevo" value="pg-producto/insertarProducto.jsp" style="left : 1.2%; position:relative;">
            <i class="fa fa-toolbox" >
            </i> Agregar Producto
        </button>
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table id="tablaProductos" class="table table-bordered">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                        <th>Iva</th>
                        <th>Retencion</th>
                        <th>Cantidad Minima</th>
                        <th>Categoria</th>
                        <th>opciones</th>
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
                        <td><%= producto.getIva()%></td>
                        <td><%= producto.getRetencion()%></td>
                        <td><%= producto.getCantidadMinima() %></td>
                        <td><%= (producto.getIdCat().getNombre()).replace("_", " ")%></td>

                        <td>
                            <button  class="item" style="border:none" value="pg-producto/editarProducto.jsp?idProducto=<%= producto.getIdProducto() %>">
                                <img src="img/editar.png" width="16" height="16" >
                            </button>

                            <button  class="item" style="border:none" value="pg-producto/mostrarProducto.jsp?idProducto=<%= producto.getIdProducto() %>">
                                <img src="img/info.png" alt="alt"/>
                            </button>

                            <% if (session.getAttribute("rol").equals("1")) {
                            %>

                            <button  class="item" style="border:none" value="pg-producto/eliminarProducto.jsp?idProducto=<%= producto.getIdProducto()%>">
                                <img src="img/borrar.png" alt="alt"/>
                            </button>
                            <%
                                }
                            %>


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

    <%
        {
            String mensa = (request.getParameter("mens")).replace(".", " ");
            if (mensa.equals("0")) {

                mensa = "";
            } else {
    %>
    <script>
        aparecerDiv("divListar");
    </script>

    <div id="divListar" style="display: none;" class="alert alert-success">
        <%= mensa%>
    </div>
    <%
            }
        }
    %>

    <div id="boxListar">
    </div>    

    <div class="card-footer">
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
            $('#tablaProductos').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
    </script>
</html>