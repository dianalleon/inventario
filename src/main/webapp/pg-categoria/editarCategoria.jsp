<%-- 
    Document   : editarCategoria.jsp
    Created on : 7 abr. 2022, 13:55:08
    Author     : Videoadicto
--%>

<%@page import="sistemainventarios.capadatos.entidades.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.CategoriaFacade" scope="page"></jsp:useBean>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Categorias</title>
            <script>
                $("button").click(function () {
                    $("#box").load($(this).val(), function () {
                    });
                });

                $(document).ready(function () {
                    $("#btnGuardar").click(function () {
                        $("#boxEditar").load("pg-categoria/guardarCategoria.jsp?" + (validarDatosCategoria(nuevo = 0)), function () {
                        });
                    });
                });
            </script>
        </head>

    <%
        String idCategoria = request.getParameter("idCategoria");

        Categoria categoria = new Categoria();
        categoria.setIdCategoria(idCategoria);

        categoria = fachada.buscarCategoria(idCategoria);
    %>

    <body>
        <div class="card-header">
            <h1>Editar Categoria</h1>
        </div>

        <div class="card-body">
            <%
                if (categoria != null) {
            %>
            <form id="frmRegistrar" name="frmRegistrar">
                <div class="form-group">
                    <label for="idCategoria" class="form-label">Id:</label>
                    <input type="text" name="idCategoria" id="idCategoria" 
                           placeholder="Ingrese el Id del categoria" required
                           class="form-control" readonly
                           value = "<%= categoria.getIdCategoria()%>">
                </div>

                <div class="form-group">
                    <label for="nombre" class="form-label">Nombre:</label>
                    <input type="text" name="nombre" id="nombre" 
                           placeholder="Ingrese el nombre" required
                           class="form-control" 
                           value = "<%= (categoria.getNombre()).replace("_", " ")%>">
                </div>

                <div id="boxEditar">
                </div>

                <div id="divInsertar" style="display: none;" class="alert alert-danger">
                </div>   

                <div class="form-group">
                    <input type="button" id="btnGuardar" value="Guardar" class="btn btn-success" >
                    <button type="button" value="pg-categoria/listarCategoria.jsp?mens=0" class="btn btn-success">Regresar</button>
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
    </body>
</html>