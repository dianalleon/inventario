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
        String password3 = request.getParameter("password2");

        String msg = "";

        msg = fachada.validarUsuario(cedula3, password3);

        if (msg.contains("Usuario")) {
    %> 
    <div id="divGuardar" class="alert alert-danger">
        <%= msg%>
    </div>

    <%
    } else {
    %>

    <input id="mensaje" style="display: none;" value = <%= msg%> >

    <input type="submit" id="eso" style="display: none;" class="btn btn-success">


    <%
        session.setAttribute("uid", cedula3);
    %>

    <script>
        document.getElementById('eso').click();
    </script>

    <%
        }
    %>

</form>
</div>          

</html>