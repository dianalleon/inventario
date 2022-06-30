<%-- 
    Document   : guardarVenta.jsp
    Created on : 13 may. 2021, 08:48:52
    Author     : Videoadicto
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="sistemainventarios.capadatos.entidades.Venta"%>
<%@page import="sistemainventarios.capadatos.entidades.Categoria"%>
<%@page import="sistemainventarios.capadatos.entidades.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.VentaFacade" scope="page"></jsp:useBean>
    <jsp:useBean id="fachadap" class="sistemainventarios.negocio.facade.ProductoFacade" scope="page"></jsp:useBean>
    <%
        if (true) {

            String idVenta3 = request.getParameter("idVenta2");

            String idCliente3 = request.getParameter("idCliente2");

            String idEmpleado3 = request.getParameter("uid");

            int total3 = fachada.convertirNumero(request.getParameter("total2"));
            //long miliseconds = System.currentTimeMillis();
            //Date date = new Date(miliseconds);
            //Date fecha = date;
            //String fecha3 = fecha.toString();
            
            String fecha3 = LocalDate.now().toString();
            
            String lista3 = request.getParameter("lista2");

            int filas3 = fachada.convertirNumero(request.getParameter("filas2"));

            String validar3 = request.getParameter("validar2");
            String nuevo3 = request.getParameter("nuevo2");
            //System.out.print("ojo1-idVenta2=" + idVenta3 + "&nombre2=" + nombre3 + "&precio2=" + precio3 + "&cantidad2=" + cantidad3 + "&iva2=" + iva3 + "&retencion2=" + retencion3 + "&cantidadMinima2=" + cantidadMinima3 + "&idCategoria2=" + idCategoria3 + "& nuevo2=" + nuevo3 + "&validar3=" + validar3);

            //System.out.print("filas " + filas3);
            String pagina = "";
            String msg3 = "";
            if (validar3.equals("1")) {
                Venta p = new Venta(idVenta3, idCliente3, idEmpleado3, total3, fecha3, lista3);
                msg3 = fachada.insertarVenta(p, nuevo3);

                if (msg3.contains("Error")) {
    %> 
    <div id="divGuardar" class="alert alert-danger">
        <%= msg3%>
    </div>
    <% } else {
        pagina = "listarVenta.jsp";
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
    <input id="uid1" style="display: none;" value = <%= idEmpleado3%> >


    <script>
        $("#box").load("pg-venta/" + ($(esto).val()) + "?mens=" + ($(esto1).val()) + "&emple=" + ($(uid1).val()), function () {
        });
    </script>
    <%
                }
            }

            String lista4 = lista3.replace("~¬~", "¬¬");

            int inicio = 1;
            int fin = 0;
            String idProductoX = "";
            String nombreX="";
            int cantidadX;
            int filas4 = filas3;

            for (int i = 0; i < filas4; i++) {
                inicio = lista4.indexOf("~~", inicio) + 2;
                fin = lista4.indexOf("¬¬", inicio);
                idProductoX = lista4.substring(inicio, fin);
                inicio = fin;

                inicio = lista4.indexOf("~~", inicio) + 2;
                fin = lista4.indexOf("¬¬", inicio);
                nombreX = lista4.substring(inicio, fin);
                inicio = fin;

                inicio = lista4.indexOf("~~", inicio) + 2;
                fin = lista4.indexOf("¬¬", inicio);
                cantidadX = fachada.convertirNumero(lista4.substring(inicio, fin));
                inicio = fin;

                //System.out.println("ojo: " + valor );
                //System.out.println("id: " + idProductoX + " cant: " + cantidadX);

                Producto producto = new Producto();
                producto.setIdProducto(idProductoX);

                producto = fachadap.buscarProducto(idProductoX);

                int precioX = producto.getPrecio();
                cantidadX = producto.getCantidad() - cantidadX;
                int ivaX = producto.getIva();
                int retencionX = producto.getRetencion();
                int cantidadMinimaX = producto.getCantidadMinima();
                Categoria categoriaX = producto.getIdCat();

                Producto p = new Producto(idProductoX, nombreX, precioX, cantidadX, ivaX, retencionX, cantidadMinimaX, categoriaX);
                msg3 = fachadap.insertarProducto(p, "0");

            }

        }


    %>
</html>