<%-- 
    Document   : insertarProducto.jsp
    Created on : 11 may. 2021, 09:57:25
    Author     : Videoadicto
--%>
<%@page import="sistemainventarios.capadatos.entidades.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.EmpleadoFacade" scope="page"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <script>
            $("button").click(function () {
                $("#box").load($(this).val(), function () {
                });
            });


            $(document).ready(function () {
                $("#btnGuardar").click(function () {
                    $("#boxInsertar").load("pg-empleado/guardarEmpleado.jsp?" + (validarDatos(nuevo=1)), function () {
                    });
                });
            });
        </script>
    </head>

    <body>
        <div class="card-header">
            <h1>Agregar Empleado</h1>
        </div>

        <div class="card-body">
            <form id="frmRegistrar" name="frmRegistrar">
                <div class="form-group">
                    <label for="cedula" class="form-label">Cedula: *</label>
                    <input type="text" name="cedula" id="cedula" 
                           placeholder="Digite su número de documento" required
                           class="form-control">
                </div>

                <div class="form-group">
                    <label for="nombre" class="form-label">Nombre: *</label>
                    <input type="text" name="nombre" id="nombre" 
                           placeholder="Digite su nombre" required
                           class="form-control">
                </div>

                <div class="form-group">
                    <label for="email" class="form-label">Correo: *</label>
                    <input type="email" name="email" id="email" 
                           placeholder="Digite su email" required
                           class="form-control">
                </div>

                <div class="form-group">
                    <label for="password"  class="form-label">Password: *</label>
                    <input type="password" name="password" id="password" 
                           placeholder="Digite su password" required
                           class="form-control">
                </div>

                <div class="form-group">
                    <label for="repetir_password" class="form-label">Repetir password: *</label>
                    <input type="password" name="repetir_password" id="repetir_password" 
                           placeholder="Digite su password" required
                           class="form-control">
                </div>
                
                <br>

                <div id="divInsertar" style="display: none;" class="alert alert-danger">
                </div>

                <div id="boxInsertar">
                </div>

                <br>

                <div class="form-group">
                    <input type="button" id="btnGuardar" value="Guardar" class="btn btn-success" >
                    <button type="button" value="pg-empleado/listarEmpleado.jsp?mens=0" class="btn btn-success">Regresar</button>
                </div>
            </form>
        </div>          
    </body>
</html>