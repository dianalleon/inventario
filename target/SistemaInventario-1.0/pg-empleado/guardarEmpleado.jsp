<%-- 
    Document   : guardarEmpleado.jsp
    Created on : 13 may. 2021, 08:48:52
    Author     : Videoadicto
--%>

<%@page import="sistemainventarios.capadatos.entidades.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.EmpleadoFacade" scope="page"></jsp:useBean>
    <%
            String cedula3 = request.getParameter("cedula2");
            String nombre3 = request.getParameter("nombre2");
            String email3 = request.getParameter("email2");
            String password3 = request.getParameter("password2");
            String nuevo3 = request.getParameter("nuevo2");
            String validar3 = request.getParameter("validar2");
            //System.out.print("ojo1: cedula:" + cedula3 + " nombre:" + nombre3 + " password: " + password3 + " nuevo :" + nuevo3 + " validar: " + validar3);

            /*
        if (numero==null) numero="0";
        if (numero.equals("")) numero="0";        
        int precio = Integer.parseInt(numero);
        
        numero = request.getParameter("existencias");
        if (numero==null) numero="0";
        if (numero.equals("")) numero="0";        
        int existencias = Integer.parseInt(numero);
        
        numero = request.getParameter("costo");
        if (numero==null) numero="0";
        if (numero.equals("")) numero="0";        
        int costo = Integer.parseInt(numero);
             */
            String pagina = "";
            String msg3 = "";
            if (validar3.equals("1")) {
                Empleado p = new Empleado(cedula3, nombre3, email3, password3);
                msg3 = fachada.insertarEmpleado(p, nuevo3);

                if (msg3.contains("Error")) {
    %> 
    <div id="divGuardar" class="alert alert-danger">
        <%= msg3%>
    </div>
    <% } else {
        pagina = "listarEmpleado.jsp";
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
        $("#box").load("pg-empleado/" + ($(esto).val()) + "?mens=" + ($(esto1).val()), function () {
        });
    </script>
    <%
                }
            }
    %>
</html>