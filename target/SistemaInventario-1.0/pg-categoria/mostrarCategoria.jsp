<%-- 
    Document   : editarCategoria.jsp
    Created on : 7 abr. 2022, 13:55:08
    Author     : Videoadicto
--%>
<%@page import="sistemainventarios.capadatos.entidades.Categoria"%>
<jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.CategoriaFacade" scope="page"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <script>

                $(document).ready(function () {

                    $("#btnCancelar").click(function () {
                        $("#box").load("pg-categoria/listarCategoria.jsp?mens=0", function () {
                        });
                    });
                });
            </script>
        </head>

    <%
        String idCategoria = request.getParameter("idCategoria");

        Categoria categoria = fachada.buscarCategoria(idCategoria);

        if (categoria != null) {
    %>

    <body>
        <div class="card-header">
            <h1>Informacion del Categoria</h1>
        </div>

        <div class="card-body">
            <%
                if (categoria != null) {
            %>
            <form id="frmRegistrar" name="frmRegistrar">
                <div class="form-group">
                    <label for="idCategoria" class="form-label">Id:</label>
                    <input type="text" name="idCategoria" id="idCategoria" 
                           placeholder="" required
                           class="form-control" readonly
                           value = "<%= categoria.getIdCategoria()%>">
                </div>

                <div class="form-group">
                    <label for="nombre" class="form-label">Nombre:</label>
                    <input type="text" name="nombre" id="nombre" 
                           placeholder="" required
                           class="form-control" readonly
                           value="<%= (categoria.getNombre()).replace("_", " ")%>">
                </div>

                <div class="form-group">
                    <input type="button" id="btnCancelar" value="Regresar" class="btn btn-success">
                </div>

            </form>
            <%
            } else {
            %>

            <div id="divMensaje" class="alert alert-danger">
                Error: Categoria no encontrado.
            </div>
            <%
                }%>
        </div>
        <%
            }
        %>
    </body>
</html>