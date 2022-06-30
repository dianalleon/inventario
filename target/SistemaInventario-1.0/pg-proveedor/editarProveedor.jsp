<%-- 
    Document   : editarProveedor.jsp
    Created on : 7 abr. 2022, 13:55:08
    Author     : Videoadicto
--%>

<%@page import="sistemainventarios.capadatos.entidades.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.ProveedorFacade" scope="page"></jsp:useBean>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Proveedores</title>
            <script>
                $("button").click(function () {
                    $("#box").load($(this).val(), function () {
                    });
                });

                $(document).ready(function () {
                    $("#btnGuardar").click(function () {
                        $("#boxEditar").load("pg-proveedor/guardarProveedor.jsp?" + (validarDatosProveedor(nuevo = 0)), function () {
                        });
                    });
                });
            </script>
        </head>

    <%
        String idProveedor = request.getParameter("idProveedor");

        Proveedor proveedor = new Proveedor();
        proveedor.setIdProveedor(idProveedor);

        proveedor = fachada.buscarProveedor(idProveedor);
    %>

    <body>
        <div class="card-header">
            <h1>Editar Proveedor</h1>
        </div>

        <div class="card-body">
            <%
                if (proveedor != null) {
            %>
            <form id="frmRegistrar" name="frmRegistrar">
                <div class="form-group">
                    <label for="idProveedor" class="form-label">Id:</label>
                    <input type="text" name="idProveedor" id="idProveedor" 
                           placeholder="Ingrese el Id del proveedor" required
                           class="form-control" readonly
                           value = "<%= proveedor.getIdProveedor()%>">
                </div>

                <div class="form-group">
                    <label for="nombre" class="form-label">Nombre:</label>
                    <input type="text" name="nombre" id="nombre" 
                           placeholder="Ingrese el nombre" required
                           class="form-control" 
                           value = "<%= (proveedor.getNombre()).replace("_", " ")%>">
                </div>
                
                <div class="form-group">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" name="email" id="email" 
                           placeholder="Ingrese el email" required
                           class="form-control" 
                           value = "<%= proveedor.getEmail()%>">
                </div>
                
                <div class="form-group">
                    <label for="telefono" class="form-label">Telefono</label>
                    <input type="text" name="telefono" id="telefono" 
                           placeholder="Ingrese el telefono" required
                           class="form-control" 
                           value = "<%= proveedor.getTelefono()%>">
                </div>
                
                <div id="boxEditar">
                </div>

                <div id="divInsertar" style="display: none;" class="alert alert-danger">
                </div>   

                <div class="form-group">
                    <input type="button" id="btnGuardar" value="Guardar" class="btn btn-success" >
                    <button type="button" value="pg-proveedor/listarProveedor.jsp?mens=0" class="btn btn-success">Regresar</button>
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
    </body>
</html>