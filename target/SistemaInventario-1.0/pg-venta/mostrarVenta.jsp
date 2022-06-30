<%-- 
    Document   : editarVenta.jsp
    Created on : 7 abr. 2022, 13:55:08
    Author     : Videoadicto
--%>
<%@page import="sistemainventarios.capadatos.entidades.Venta"%>
<jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.VentaFacade" scope="page"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <script>

                $(document).ready(function () {

                    $("#btnCancelar").click(function () {
                        $("#box").load("pg-venta/listarVenta.jsp?mens=0", function () {
                        });
                    });
                });
            </script>
        </head>

    <%
        String idVenta = request.getParameter("idVenta");

        Venta venta = fachada.buscarVenta(idVenta);
        
        String ventafull = venta.getLista().replace("¬¬", " ");
        ventafull = ventafull.replace("~~", ": ");
        ventafull = ventafull.replace("~¬~", "\n");

        if (venta != null) {
    %>

    <body>
        <div class="card-header">
            <h1>Informacion del Venta</h1>
        </div>

        <div class="card-body">
            <%
                if (venta != null) {
            %>
            <form id="frmRegistrar" name="frmRegistrar">
                <table class="table table-borderless">
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <th>                        
                                <div class="form-group">
                                    <label for="idVenta" class="form-label">Id Venta</label>
                                    <input type="text" name="idVenta" id="idVenta" 
                                           placeholder="" required
                                           class="form-control" readonly
                                           value = "<%= venta.getIdVenta()%>">
                                </div>
                            </th>

                            <th>
                                <div class="form-group">
                                    <label for="nombre" class="form-label">Id Cliente</label>
                                    <input type="text" name="nombre" id="nombre" 
                                           placeholder="" required
                                           class="form-control" readonly
                                           value="<%=venta.getIdCliente()%>">
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
                                           value="<%= venta.getIdEmpleado()%>">
                                </div>
                            </th>
                            <th>
                                <div class="form-group">
                                    <label for="cantidad" class="form-label">Total:</label>
                                    <input type="text" name="cantidad" id="cantidad" 
                                           placeholder="" required
                                           class="form-control" readonly
                                           value="<%= venta.getTotal()%>">
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
                                           value="<%= venta.getFecha()%>">
                                </div>
                            </th>

                            <th>
                                <div class="form-group">
                                    <label for="retencion" class="form-label">Productos:</label>
                                <div class="row-lg">
                                    <textarea readonly name="descripcion" rows="4" cols="148" placeholder="Digite su Descripcion"
                                              class="form-control"> <%= ventafull %></textarea>
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
                Error: Venta no encontrado.
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