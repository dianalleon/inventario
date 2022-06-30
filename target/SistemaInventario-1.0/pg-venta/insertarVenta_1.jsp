<%-- 
    Document   : insertarVenta.jsp
    Created on : 11 may. 2021, 09:57:25
    Author     : Videoadicto
--%>

<%-- <%@page import="sistemainventarios.capadatos.entidades.Venta"%> --%>
<%@page import="sistemainventarios.capadatos.entidades.Categoria"%>
<%@page import="sistemainventarios.capadatos.entidades.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="fachada2" class="sistemainventarios.negocio.facade.VentaFacade" scope="page"></jsp:useBean>
        <jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.ProductoFacade"></jsp:useBean>
        <%--     <jsp:useBean id="fachada2" class="sistemainventarios.negocio.facade.CategoriaFacade"></jsp:useBean> --%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventas</title>
        <script>
            $("button").click(function () {
                $("#box").load($(this).val(), function () {
                });
            });


            $(document).ready(function () {
                $("#btnGuardar").click(function () {
                    $("#boxInsertar").load("pg-venta/guardarVenta.jsp?" + (validarDatosVenta(nuevo = 1)), function () {
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
                                <div class="form-group">
                                    <label for="idVenta" class="form-label">Id:</label>
                                    <input type="text" name="idVenta" id="idVenta" 
                                           placeholder="Ingrese el Id del venta" required
                                           class="form-control" required>
                                </div>
                            </th>

                            <th>
                                <div class="form-group">
                                    <label for="nombre" class="form-label">Nombre:</label>
                                    <input type="text" name="nombre" id="nombre" 
                                           placeholder="Ingrese el nombre" required
                                           class="form-control" required>
                                </div>
                            </th>
                        </tr>                            

                        <tr>                               
                            <th>
                                <div class="form-group">
                                    <label for="precio" class="form-label">Precio:</label>
                                    <input type="text" name="precio" id="precio" 
                                           placeholder="Ingrese el precio" required
                                           class="form-control" required>
                                </div>
                            </th>
                            <th>
                                <div class="form-group">
                                    <label for="cantidad" class="form-label">Cantidad:</label>
                                    <input type="text" name="cantidad" id="cantidad" 
                                           placeholder="Ingrese la cantidad" required
                                           class="form-control" required>
                                </div>
                            </th>
                        </tr>

                        <tr>                               
                            <th>
                                <div class="form-group">
                                    <label for="iva" class="form-label">Iva:</label>
                                    <input type="text" name="iva" id="iva" 
                                           placeholder="Ingrese el iva" required
                                           class="form-control" required>
                                </div>
                            </th>
                            <th>
                                <div class="form-group">
                                    <label for="retencion" class="form-label">Retencion:</label>
                                    <input type="text" name="retencion" id="retencion" 
                                           placeholder="Ingrese la retencion" required
                                           class="form-control" required>
                                </div>
                            </th>
                        </tr>                                       

                        <tr>                               
                            <th>
                                <div class="form-group">
                                    <label for="cantidadMinima" class="form-label">Cantidad Minima:</label>
                                    <input type="text" name="cantidadMinima" id="cantidadMinima" 
                                           placeholder="Ingrese la cantidad minima" required
                                           class="form-control" required>
                                </div>
                            </th>
                            <th>
                                <div class="form-group">
                                    <label for="idCategoria">Categoria Nueva: </label>
                                    <select id="idCategoria" name="idCategoria" required class="form-control">
                                        <%
                                            for (Categoria categoria : fachada.getCategoria()) {
                                        %>
                                        <option value="<%= categoria.getIdCategoria()%>"> <%= (categoria.getNombre()).replace("_", " ")%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </th>
                        </tr>             

                        <tr>                               
                            <th>
                                <div id="divInsertar" style="display: none;" class="alert alert-danger">
                                </div>

                                <div id="boxInsertar">
                                </div>

                                <div class="form-group">
                                    <input type="button" id="btnGuardar" value="Guardar" class="btn btn-success" >
                                    <button type="button" value="pg-venta/listarVenta.jsp?mens=0" class="btn btn-success">Regresar</button>
                                </div>
                            </th>
                            <th>

                            </th>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>                    
    </body>
</html>