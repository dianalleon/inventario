<%-- 
    Document   : guardarProducto.jsp
    Created on : 13 may. 2021, 08:48:52
    Author     : Videoadicto
--%>

<%@page import="sistemainventarios.capadatos.entidades.Producto"%>
<%@page import="sistemainventarios.capadatos.entidades.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.ProductoFacade" scope="page"></jsp:useBean>
    <%
        if (true) {

            String idProducto3 = request.getParameter("idProducto2");
            String nombre3 = request.getParameter("nombre2");
            int precio3 = fachada.convertirNumero(request.getParameter("precio2"));
            int cantidad3 = fachada.convertirNumero(request.getParameter("cantidad2"));
            int iva3 = fachada.convertirNumero(request.getParameter("iva2"));
            int retencion3 = fachada.convertirNumero(request.getParameter("retencion2"));
            int cantidadMinima3 = fachada.convertirNumero(request.getParameter("cantidadMinima2"));
            String idCategoria3 = request.getParameter("idCategoria2");
            String validar3 = request.getParameter("validar2");
            String nuevo3 = request.getParameter("nuevo2");
            //System.out.print("ojo1-idProducto2=" + idProducto3 + "&nombre2=" + nombre3 + "&precio2=" + precio3 + "&cantidad2=" + cantidad3 + "&iva2=" + iva3 + "&retencion2=" + retencion3 + "&cantidadMinima2=" + cantidadMinima3 + "&idCategoria2=" + idCategoria3 + "& nuevo2=" + nuevo3 + "&validar3=" + validar3);


            String pagina = "";
            String msg3 = "";
            if (validar3.equals("1")) {
                Categoria c = new Categoria(idCategoria3, "");
                Producto p = new Producto(idProducto3, nombre3, precio3, cantidad3, iva3, retencion3, cantidadMinima3, c);
                msg3 = fachada.insertarProducto(p, nuevo3);

                if (msg3.contains("Error")) {
    %> 
    <div id="divGuardar" class="alert alert-danger">
        <%= msg3%>
    </div>
    <% } else {
        pagina = "listarProducto.jsp";
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
        $("#box").load("pg-producto/" + ($(esto).val()) + "?mens=" + ($(esto1).val()), function () {
        });
    </script>
    <%
                }
            }
        }
    %>
</html>