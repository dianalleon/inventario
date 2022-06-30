<%-- 
    Document   : editarCompra.jsp
    Created on : 7 abr. 2022, 13:55:08
    Author     : Videoadicto
--%>
<%@page import="sistemainventarios.capadatos.entidades.Compra"%>
<jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.CompraFacade" scope="page"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <script>

                $(document).ready(function () {

                    $("#btnCancelar").click(function () {
                        $("#box").load("pg-compra/listarCompra.jsp?mens=0", function () {
                        });
                    });
                });
            </script>
        </head>

    <%
        String idCompra = request.getParameter("idCompra");

        Compra compra = fachada.buscarCompra(idCompra);
        
        String comprafull = compra.getLista().replace("¬¬", " ");
        comprafull = comprafull.replace("~~", ": ");
        comprafull = comprafull.replace("~¬~", "\n");

        if (compra != null) {
    %>

    <body>
        <div class="card-header">
            <h1>Informacion del Compra</h1>
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
                                    <label for="idCompra" class="form-label">Id Compra</label>
                                    <input type="text" name="idCompra" id="idCompra" 
                                           placeholder="" required
                                           class="form-control" readonly
                                           value = "<%= compra.getIdCompra()%>">
                                </div>
                            </th>

                            <th>
                                <div class="form-group">
                                    <label for="nombre" class="form-label">Id Proveedor</label>
                                    <input type="text" name="nombre" id="nombre" 
                                           placeholder="" required
                                           class="form-control" readonly
                                           value="<%=compra.getIdProveedor()%>">
                                </div>
                            </th>
                        </tr>                            

                        <tr>                               
                            <th>
                                <div class="form-group">
                                    <label for="precio" class="form-label">Id Empleado:</label>
                                    <input type="text" name="precio" id="precio" 
                                           placeholder="" required
                                           class="form-control" readonly
                                           value="<%= compra.getIdEmpleado()%>">
                                </div>
                            </th>
                            <th>
                                <div class="form-group">
                                    <label for="cantidad" class="form-label">Total:</label>
                                    <input type="text" name="cantidad" id="cantidad" 
                                           placeholder="" required
                                           class="form-control" readonly
                                           value="<%= compra.getTotal()%>">
                                </div>
                            </th>
                        </tr>

                        <tr>                               
                            <th>
                                <div class="form-group">
                                    <label for="iva" class="form-label">Fecha:</label>
                                    <input type="text" name="iva" id="iva" 
                                           placeholder="" required
                                           class="form-control" readonly
                                           value="<%= compra.getFecha()%>">
                                </div>
                            </th>

                            <th>
                                <div class="form-group">
                                    <label for="retencion" class="form-label">Productos:</label>
                                <div class="row-lg">
                                    <textarea readonly name="descripcion" rows="4" cols="148" placeholder="Digite su Descripcion"
                                              class="form-control"> <%= comprafull %></textarea>
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
                Error: Compra no encontrado.
            </div>
            <%
                }%>
        </div>
        <%
            }
        %>

        <%
            System.out.println("");
        %>

    </body>
</html>