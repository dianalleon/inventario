<%-- 
    Document   : guardarCliente.jsp
    Created on : 13 may. 2021, 08:48:52
    Author     : Videoadicto
--%>

<%@page import="sistemainventarios.capadatos.entidades.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.ClienteFacade" scope="page"></jsp:useBean>
    <%
        if (true) {

            String cedula3 = request.getParameter("cedula2");
            String nombre3 = request.getParameter("nombre2");
            String email3 = request.getParameter("email2");
            String telefono3 = request.getParameter("telefono2");
            String nuevo3 = request.getParameter("nuevo2");
            String validar3 = request.getParameter("validar2");
            //System.out.print("ojo1: cedula:" + cedula3 + " nombre:" + nombre3 + " password: " + password3 + " nuevo :" + nuevo3 + " validar: " + validar3);


            String pagina = "";
            String msg3 = "";
            if (validar3.equals("1")) {
                Cliente p = new Cliente(cedula3, nombre3, email3, telefono3);
                msg3 = fachada.insertarCliente(p, nuevo3);

                if (msg3.contains("Error")) {
    %> 
    <div id="divGuardar" class="alert alert-danger">
        <%= msg3%>
    </div>
    <% } else {
        pagina = "listarCliente.jsp";
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
        $("#box").load("pg-cliente/" + ($(esto).val()) + "?mens=" + ($(esto1).val()), function () {
        });
    </script>
    <%
                }
            }
        }
    %>
</html>