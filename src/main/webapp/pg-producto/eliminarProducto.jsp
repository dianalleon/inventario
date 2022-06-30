<%-- 
    Document   : guardarProducto.jsp
    Created on : 13 may. 2021, 08:48:52
    Author     : Videoadicto
--%>
<%@page import="javax.swing.text.html.parser.Element"%>
<%@page import="sistemainventarios.capadatos.entidades.Producto"%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.ProductoFacade" scope="page"></jsp:useBean>
        </head>
        <body>
        <%
            String sino = request.getParameter("sn");

            if (sino.contains("true")) {

                String idProducto = request.getParameter("idProducto");
                Producto p = fachada.buscarProducto(idProducto);

                if (p != null) {
                    String msg = fachada.eliminarProducto(idProducto);
                    String msg4 = msg.replace(" ", ".");
        %>
        <input id="esto1" style="display: none;" value = <%= msg4%> >
        <script>
            $("#box").load("pg-producto/listarProducto.jsp?mens=" + ($(esto1).val()), function () {
            });
        </script>
        <%
            }
        } else {
        %>
        <script>
            $("#box").load("pg-producto/listarProducto.jsp?mens=Se.ha.cancelado.la.operacion", function () {
            });
        </script>
        <%    }
        %>
    </body>
</html>