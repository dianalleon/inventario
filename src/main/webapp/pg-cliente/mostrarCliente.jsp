<%-- 
    Document   : editarCliente.jsp
    Created on : 7 abr. 2022, 13:55:08
    Author     : Videoadicto
--%>
<%@page import="sistemainventarios.capadatos.entidades.Cliente"%>
<jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.ClienteFacade" scope="page"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <script>

                $(document).ready(function () {

                    $("#btnCancelar").click(function () {
                        $("#box").load("pg-cliente/listarCliente.jsp?mens=0", function () {
                        });
                    });
                });
            </script>
        </head>

    <%
        String cedula = request.getParameter("cedula");

        Cliente cliente = fachada.buscarCliente(cedula);

        if (cliente != null) {
    %>

    <body>
        <div class="card-header">
            <h1>Informacion del Cliente</h1>
        </div>

        <div class="card-body">
            <%
                if (cliente != null) {
            %>
            <form id="frmRegistrar" name="frmRegistrar">
                <div class="form-group">
                    <label for="cedula" class="form-label">Número de documento:</label>
                    <input type="text" name="cedula" id="cedula" 
                           placeholder="Digite su número de cedula" required
                           class="form-control" readonly
                           value = "<%= cliente.getCedula()%>">
                </div>

                <div class="form-group">
                    <label for="nombre" class="form-label">Nombre:</label>
                    <input type="text" name="nombre" id="nombre" 
                           placeholder="Digite su nombre" required
                           class="form-control" readonly
                           value="<%= (cliente.getNombre()).replace("_", " ")%>">
                </div>

                <div class="form-group">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" name="email" id="email" 
                           placeholder="Digite su correo" required
                           class="form-control" readonly
                           value="<%= cliente.getEmail()%>">
                </div>

                <div class="form-group">
                    <label for="telefono" class="form-label">Telefono</label>
                    <input type="text" name="telefono" id="telefono" 
                           placeholder="Digite su telefono" required
                           class="form-control" readonly
                           value="<%= cliente.getTelefono()%>">
                </div>



                <div class="form-group">
                    <input type="button" id="btnCancelar" value="Regresar" class="btn btn-success">
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
        <%
            }
        %>
    </body>
</html>