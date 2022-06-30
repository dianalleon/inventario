<%-- 
    Document   : editarProducto.jsp
    Created on : 7 abr. 2022, 13:55:08
    Author     : Videoadicto
--%>
<%@page import="sistemainventarios.capadatos.entidades.Producto"%>
<jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.ProductoFacade" scope="page"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <script>

                $(document).ready(function () {

                    $("#btnCancelar").click(function () {
                        $("#box").load("pg-producto/listarProducto.jsp?mens=0", function () {
                        });
                    });
                });
            </script>
        </head>

    <%
        String idProducto = request.getParameter("idProducto");

        Producto producto = fachada.buscarProducto(idProducto);

        if (producto != null) {
    %>

    <body>
        <div class="card-header">
            <h1>Informacion del Producto</h1>
        </div>

        <div class="card-body">
            <%
                if (producto != null) {
            %>
            <form id="frmRegistrar" name="frmRegistrar">
                <table class="table table-borderless">
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <th>                        
                                <div class="form-group">
                                    <label for="idProducto" class="form-label">Id:</label>
                                    <input type="text" name="idProducto" id="idProducto" 
                                           placeholder="" required
                                           class="form-control" readonly
                                           value = "<%= producto.getIdProducto()%>">
                                </div>
                            </th>

                            <th>
                                <div class="form-group">
                                    <label for="nombre" class="form-label">Nombre:</label>
                                    <input type="text" name="nombre" id="nombre" 
                                           placeholder="" required
                                           class="form-control" readonly
                                           value="<%= (producto.getNombre()).replace("_", " ")%>">
                                </div>
                            </th>
                        </tr>                            

                        <tr>                               
                            <th>
                                <div class="form-group">
                                    <label for="precio" class="form-label">Precio:</label>
                                    <input type="text" name="precio" id="precio" 
                                           placeholder="" required
                                           class="form-control" readonly
                                           value="<%= producto.getPrecio()%>">
                                </div>
                            </th>
                            <th>
                                <div class="form-group">
                                    <label for="cantidad" class="form-label">Cantidad:</label>
                                    <input type="text" name="cantidad" id="cantidad" 
                                           placeholder="" required
                                           class="form-control" readonly
                                           value="<%= producto.getCantidad()%>">
                                </div>
                            </th>
                        </tr>

                        <tr>                               
                            <th>
                                <div class="form-group">
                                    <label for="iva" class="form-label">Iva:</label>
                                    <input type="text" name="iva" id="iva" 
                                           placeholder="" required
                                           class="form-control" readonly
                                           value="<%= producto.getIva()%>">
                                </div>
                            </th>

                            <th>
                                <div class="form-group">
                                    <label for="retencion" class="form-label">Retencion:</label>
                                    <input type="text" name="retencion" id="retencion" 
                                           placeholder="" required
                                           class="form-control" readonly
                                           value="<%= producto.getRetencion()%>">
                                </div>
                            </th>
                        </tr>                                        

                        <tr>                               
                            <th>
                                <div class="form-group">
                                    <label for="cantidadMinima" class="form-label">Cantidad Minima:</label>
                                    <input type="text" name="cantidadMinima" id="cantidadMinima" 
                                           placeholder="" required
                                           class="form-control" readonly
                                           value="<%= producto.getCantidadMinima()%>">
                                </div>
                            </th>

                            <th>
                                <div class="form-group">
                                    <label for="idCategoria" class="form-label">Categoria:</label>
                                    <input type="text" name="idCategoria" id="idCategoria" 
                                           placeholder="" required
                                           class="form-control" readonly
                                           value="<%= producto.getIdCat().getNombre()%>">
                                </div>
                            </th>
                        </tr>

                        <tr>                               
                            <th>
                                <div class="form-group">
                                    <input type="button" id="btnCancelar" value="Regresar" class="btn btn-success">
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
                Error: Producto no encontrado.
            </div>
            <%
            }%>
        </div>
        <%
            }
        %>
    </body>
</html>