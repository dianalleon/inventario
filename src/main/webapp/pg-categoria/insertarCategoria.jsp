<%-- 
    Document   : insertarCategoria.jsp
    Created on : 11 may. 2021, 09:57:25
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
                    $("#boxInsertar").load("pg-categoria/guardarCategoria.jsp?" + (validarDatosCategoria(nuevo = 1)), function () {
                    });
                });
            });
        </script>
    </head>

    <body>
        <div class="card-header">
            <h1>Agregar Categoria</h1>
        </div>

        <div class="card-body">
            <form id="frmRegistrar" name="frmRegistrar">
                <div class="form-group">
                    <label for="idCategoria" class="form-label">Id:</label>
                    <input type="text" name="idCategoria" id="idCategoria" 
                           placeholder="Ingrese el Id del categoria" required
                           class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="nombre" class="form-label">Nombre:</label>
                    <input type="text" name="nombre" id="nombre" 
                           placeholder="Ingrese el nombre" required
                           class="form-control" required>
                </div>

                <br>

                <div id="divInsertar" style="display: none;" class="alert alert-danger">
                </div>

                <div id="boxInsertar">
                </div>

                <br>

                <div class="form-group">
                    <input type="button" id="btnGuardar" value="Guardar" class="btn btn-success" >
                    <button type="button" value="pg-categoria/listarCategoria.jsp?mens=0" class="btn btn-success">Regresar</button>
                </div>
            </form>
        </div>          
    </body>
</html>