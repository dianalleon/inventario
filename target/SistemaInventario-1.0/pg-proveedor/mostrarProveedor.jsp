<%-- 
    Document   : editarProveedor.jsp
    Created on : 7 abr. 2022, 13:55:08
    Author     : Videoadicto
--%>
<%@page import="sistemainventarios.capadatos.entidades.Proveedor"%>
<jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.ProveedorFacade" scope="page"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <script>

                $(document).ready(function () {

                    $("#btnCancelar").click(function () {
                        $("#box").load("pg-proveedor/listarProveedor.jsp?mens=0", function () {
                        });
                    });
                });
            </script>
        </head>

    <%
        String idProveedor = request.getParameter("idProveedor");

        Proveedor proveedor = fachada.buscarProveedor(idProveedor);

        if (proveedor != null) {
    %>

    <body>
        <div class="card-header">
            <h1>Informacion del Proveedor</h1>
        </div>

        <div class="card-body">
            <%
                if (proveedor != null) {
            %>
            <form id="frmRegistrar" name="frmRegistrar">
                <div class="form-group">
                    <label for="idProveedor" class="form-label">Id:</label>
                    <input type="text" name="idProveedor" id="idProveedor" 
                           placeholder="" required
                           class="form-control" readonly
                           value = "<%= proveedor.getIdProveedor()%>">
                </div>

                <div class="form-group">
                    <label for="nombre" class="form-label">Nombre:</label>
                    <input type="text" name="nombre" id="nombre" 
                           placeholder="" required
                           class="form-control" readonly
                           value="<%= (proveedor.getNombre()).replace("_", " ")%>">
                </div>


                <div class="form-group">
                    <label for="email" class="form-label">Id:</label>
                    <input type="email" name="email" id="email" 
                           placeholder="" required
                           class="form-control" readonly
                           value = "<%= proveedor.getEmail()%>">
                </div>

                <div class="form-group">
                    <label for="telefono" class="form-label">Id:</label>
                    <input type="text" name="telefono" id="telefono" 
                           placeholder="" required
                           class="form-control" readonly
                           value = "<%= proveedor.getTelefono()%>">
                </div>


                <div class="form-group">
                    <input type="button" id="btnCancelar" value="Regresar" class="btn btn-success">
                </div>

            </form>
            <%
            } else {
            %>

            <div id="divMensaje" class="alert alert-danger">
                Error: Proveedor no encontrado.
            </div>
            <%
                }%>
        </div>
        <%
            }
        %>
    </body>
</html>