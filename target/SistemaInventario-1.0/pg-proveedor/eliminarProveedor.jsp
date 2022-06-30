<%-- 
    Document   : guardarProveedor.jsp
    Created on : 13 may. 2021, 08:48:52
    Author     : Videoadicto
--%>
<%@page import="javax.swing.text.html.parser.Element"%>
<%@page import="sistemainventarios.capadatos.entidades.Proveedor"%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.ProveedorFacade" scope="page"></jsp:useBean>
        </head>
        <body>
        <%
            String sino = request.getParameter("sn");

            if (sino.contains("true")) {

                String idProveedor = request.getParameter("idProveedor");
                Proveedor p = fachada.buscarProveedor(idProveedor);

                if (p != null) {
                    String msg = fachada.eliminarProveedor(idProveedor);
                    String msg4 = msg.replace(" ", ".");
        %>
        <input id="esto1" style="display: none;" value = <%= msg4%> >
        <script>
            $("#box").load("pg-proveedor/listarProveedor.jsp?mens=" + ($(esto1).val()), function () {
            });
        </script>
        <%
            }
        } else {
        %>
        <script>
            $("#box").load("pg-proveedor/listarProveedor.jsp?mens=Se.ha.cancelado.la.operacion", function () {
            });
        </script>
        <%    }
        %>
    </body>
</html>