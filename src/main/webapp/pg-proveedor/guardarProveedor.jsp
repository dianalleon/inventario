<%-- 
    Document   : guardarProveedor.jsp
    Created on : 13 may. 2021, 08:48:52
    Author     : Videoadicto
--%>

<%@page import="sistemainventarios.capadatos.entidades.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.ProveedorFacade" scope="page"></jsp:useBean>
    <%
        if (true) {

            String idProveedor3 = request.getParameter("idProveedor2");
            String nombre3 = request.getParameter("nombre2");
            String email3 = request.getParameter("email2");
            String telefono3 = request.getParameter("telefono2");
            String validar3 = request.getParameter("validar2");
            String nuevo3 = request.getParameter("nuevo2");
            //System.out.print("ojo1-idProveedor2=" + idProveedor3 + "&nombre2=" + nombre3 + "&precio2=" + precio3 + "&cantidad2=" + cantidad3 + "&iva2=" + iva3 + "&retencion2=" + retencion3 + "&cantidadMinima2=" + cantidadMinima3 + "&idProveedor2=" + idProveedor3 + "& nuevo2=" + nuevo3 + "&validar3=" + validar3);


            String pagina = "";
            String msg3 = "";
            if (validar3.equals("1")) {
                Proveedor p = new Proveedor(idProveedor3, nombre3, email3, telefono3);
                msg3 = fachada.insertarProveedor(p, nuevo3);

                if (msg3.contains("Error")) {
    %> 
    <div id="divGuardar" class="alert alert-danger">
        <%= msg3%>
    </div>
    <% } else {
        pagina = "listarProveedor.jsp";
    %> 
    <div id="divGuardar" style="display: none;" class="alert alert-success">
        <%= msg3%>
    </div>
    <%
        }
        String msg4 = msg3.replace(" ", ".");
        {
    %>
    <input id="esto" style="display: none;" value =<%= pagina%> >
    <input id="esto1" style="display: none;" value = <%= msg4%> >

    <script>
        $("#box").load("pg-proveedor/" + ($(esto).val()) + "?mens=" + ($(esto1).val()), function () {
        });
    </script>
    <%
                }
            }
        }
    %>
</html>