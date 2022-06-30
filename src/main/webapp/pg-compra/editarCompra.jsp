<%-- 
    Document   : editarCompra.jsp
    Created on : 7 abr. 2022, 13:55:08
    Author     : Videoadicto
--%>

<%@page import="sistemainventarios.capadatos.entidades.Compra"%>
<%@page import="sistemainventarios.capadatos.entidades.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.CompraFacade" scope="page"></jsp:useBean>
        <jsp:useBean id="fachada2" class="sistemainventarios.negocio.facade.CategoriaFacade"></jsp:useBean>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Compras</title>
            <script>
                $("button").click(function () {
                    $("#box").load($(this).val(), function () {
                    });
                });


                $(document).ready(function () {
                    $("#btnGuardar").click(function () {
                        $("#boxEditar").load("pg-compra/guardarCompra.jsp?" + (validarDatosCompra(nuevo = 0)), function () {
                        });
                    });
                });
            </script>
        </head>

    <%
        String idCompra = request.getParameter("idCompra");

        Compra compra = new Compra();
        compra.setIdCompra(idCompra);

        compra = fachada.buscarCompra(idCompra);
    %>

    <body>
        <div class="card-header">
            <h1>Editar Compra</h1>
        </div>

        <div class="card-body">
            <%
                if (compra != null) {
            %>
            <form id="frmRegistrar" name="frmRegistrar">
                <table class="table table-borderless">
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <th>                        
                                <div class="form-group">
                                    <label for="idCompra" class="form-label">Id:</label>
                                    <input type="text" name="idCompra" id="idCompra" 
                                           placeholder="Ingrese el Id del compra" required
                                           class="form-control" readonly
                                           value = "<%= compra.getIdCompra()%>">
                                </div>
                            </th>

                            <th>
                                <div class="form-group">
                                    <label for="nombre" class="form-label">Nombre:</label>
                                    <input type="text" name="nombre" id="nombre" 
                                           placeholder="Ingrese el nombre" required
                                           class="form-control" 
                                           value = "<%= (compra.getNombre()).replace("_", " ")%>">
                                </div>
                            </th>
                        </tr>                            

                        <tr>                               
                            <th>
                                <div class="form-group">
                                    <label for="precio" class="form-label">Precio:</label>
                                    <input type="text" name="precio" id="precio" 
                                           placeholder="Ingrese el precio" required
                                           class="form-control" 
                                           value = "<%= compra.getPrecio()%>">
                                </div>
                            </th>
                            <th>
                                <div class="form-group">
                                    <label for="cantidad" class="form-label">Cantidad:</label>
                                    <input type="text" name="cantidad" id="cantidad" 
                                           placeholder="Ingrese la cantidad" required
                                           class="form-control" 
                                           value = "<%= compra.getCantidad()%>">
                                </div>
                            </th>
                        </tr>

                        <tr>                               
                            <th>
                                <div class="form-group">
                                    <label for="iva" class="form-label">Iva:</label>
                                    <input type="text" name="iva" id="iva" 
                                           placeholder="Ingrese el iva" required
                                           class="form-control" 
                                           value = "<%= compra.getIva()%>">
                                </div>
                            </th>
                            <th>
                                <div class="form-group">
                                    <label for="retencion" class="form-label">Retencion:</label>
                                    <input type="text" name="retencion" id="retencion" 
                                           placeholder="Ingrese la retencion" required
                                           class="form-control" 
                                           value = "<%= compra.getRetencion()%>">
                                </div>
                            </th>
                        </tr>                                          

                        <tr>                               
                            <th>
                                <div class="form-group">
                                    <label for="cantidadMinima" class="form-label">Cantidad Minima:</label>
                                    <input type="text" name="cantidadMinima" id="cantidadMinima" 
                                           placeholder="Ingrese la cantidad minima" required
                                           class="form-control" 
                                           value = "<%= compra.getCantidadMinima()%>">
                                </div>
                            </th>
                            <th>
                                <div class="form-group">
                                    <label for="idCategoria" class="form-label">Categoria:</label>
                                    <select id="idCategoria" name="idCategoria" class="form-control" selected="Telefonos">
                                        <% for (Categoria categoria : fachada2.buscarCategorias()) {
                                        %>

                                        <option value="<%= categoria.getIdCategoria()%>"> <%= (categoria.getNombre()).replace("_", " ")%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </th>
                        </tr>

                        <tr>                               
                            <th>
                                <div id="boxEditar">
                                </div>

                                <div id="divInsertar" style="display: none;" class="alert alert-danger">
                                </div>   

                                <div class="form-group">
                                    <input type="button" id="btnGuardar" value="Guardar" class="btn btn-success" >
                                    <button type="button" value="pg-compra/listarCompra.jsp?mens=0" class="btn btn-success">Regresar</button>
                                </div>
                            </th>
                            <th>

                            </th>
                        </tr> 
                    </tbody>
                </table>
            </form>

            <%
            } else {
            %>

            <div id="divMensaje" class="alert alert-danger">
                Error: Compra no encontrado.
            </div>
            <%
                }%>
        </div>
    </body>
</html>