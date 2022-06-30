<%-- 
    Document   : editarCliente.jsp
    Created on : 7 abr. 2022, 13:55:08
    Author     : Videoadicto
--%>

<%@page import="sistemainventarios.capadatos.entidades.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.ClienteFacade" scope="page"></jsp:useBean>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Clientes</title>
            <script>
                $("button").click(function () {
                    $("#box").load($(this).val(), function () {
                    });
                });


                $(document).ready(function () {
                    $("#btnGuardar").click(function () {
                        $("#boxEditar").load("pg-cliente/guardarCliente.jsp?" + (validarDatosCliente(nuevo = 0)), function () {
                        });
                    });
                });
            </script>
        </head>

    <%
        String cedula = request.getParameter("cedula");

        Cliente cliente = new Cliente();
        cliente.setCedula(cedula);

        cliente = fachada.buscarCliente(cedula);
    %>

    <body>
        <div class="card-header">
            <h1>Editar Cliente</h1>
        </div>

        <div class="card-body">
            <%
                if (cliente != null) {
            %>
            <form id="frmRegistrar" name="frmRegistrar">
                <div class="form-group">
                    <label for="cedula" class="form-label">Número de documento: *</label>
                    <input type="text" name="cedula" id="cedula" 
                           placeholder="Digite su número de cedula" required
                           class="form-control" readonly
                           value = "<%= cliente.getCedula()%>">
                </div>

                <div class="form-group">
                    <label for="nombre" class="form-label">Nombre: *</label>
                    <input type="text" name="nombre" id="nombre" 
                           placeholder="Digite su nombre" required
                           class="form-control"
                           value="<%= (cliente.getNombre()).replace("_", " ")%>">
                </div>

                <div class="form-group">
                    <label for="email" class="form-label">Email: *</label>
                    <input type="email" name="email" id="email" 
                           placeholder="Digite su correo" required
                           class="form-control"
                           value="<%= cliente.getEmail()%>">
                </div>
                
                <div class="form-group">
                    <label for="telefono" class="form-label">Telefono: *</label>
                    <input type="text" name="telefono" id="telefono" 
                           placeholder="Digite su telefono" required
                           class="form-control"
                           value="<%= cliente.getTelefono()%>">
                </div>

                <div id="boxEditar">
                </div>

                <div id="divInsertar" style="display: none;" class="alert alert-danger">
                </div>   

                <div class="form-group">
                    <input type="button" id="btnGuardar" value="Guardar" class="btn btn-success" >
                    <button type="button" value="pg-cliente/listarCliente.jsp?mens=0" class="btn btn-success">Regresar</button>
                </div>

            </form>
            <%
            } else {
            %>

            <div id="divMensaje" class="alert alert-danger">
                Error: Cliente no encontrado.
            </div>
            <%
                }%>
        </div>
    </body>
</html>