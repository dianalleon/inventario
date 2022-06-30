<%-- 
    Document   : listarEmpleados
    Created on : 31 mar. 2022, 08:43:44
    Author     : Videoadicto
--%>

<%@page import="sistemainventarios.capadatos.entidades.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%-- 
<%
    String msg = request.getParameter("msg");
    if (msg.contains("0")) {
        msg = "";
    }
%>
--%>
<jsp:useBean id="fachada" class="sistemainventarios.negocio.facade.EmpleadoFacade"></jsp:useBean>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Gestión Empleados</title>
            <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/dataTable/jquery.dataTables.min.css" rel="stylesheet">
            <link href="css/dataTable/buttons.dataTables.min.css" rel="stylesheet">
            <script src="js/validaciones.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/jquery-3.2.1.min.js"></script>
            <script src="js/dataTable/jquery.dataTables.min.js"></script>

            <script>
                $("button").click(function () {

                    $("#box").load(verificarPagina($(this).val()), function () {
                    });
                });
            </script>
        </head>

        <div class="card-header">
            <h1>Administracion de Empleados</h1>
        </div>

        <br>

        <div>
        <%--            <button class="btn" onclick="location.href = 'empleadoForm.html'" style="top : 15%; left : 87%; position:relative"> --%>
        <button class="btn" id="nuevo" value="pg-empleado/insertarEmpleado.jsp" style="left : 1.2%; position:relative;">
            <i class="fa fa-toolbox" >
            </i> Agregar Empleado
        </button>
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table id="tablaEmpleados" class="table table-bordered">
                <thead>
                    <tr>
                        <th>Cedula</th>
                        <th>Nombre</th>
                        <th>Email</th>
                        <th>opciones</th>
                    </tr>                            
                </thead>
                <tbody>
                    <% for (Empleado empleado : fachada.buscarEmpleados()) {
                    %>
                    <tr>                               
                        <td><%= empleado.getCedula()%></td>
                        <td><%= (empleado.getNombre()).replace("_", " ")%></td>
                        <td><%= empleado.getEmail()%></td>
                        <td>
                            <button  class="item" style="border:none" value="pg-empleado/editarEmpleado.jsp?cedula=<%= empleado.getCedula()%>">
                                <img src="img/editar.png" width="16" height="16" >
                            </button>

                            <button  class="item" style="border:none" value="pg-empleado/mostrarEmpleado.jsp?cedula=<%= empleado.getCedula()%>">
                                <img src="img/info.png" alt="alt"/>
                            </button>

                            <% if (session.getAttribute("rol").equals("1")) {
                            %>

                            <button  class="item" style="border:none" value="pg-empleado/eliminarEmpleado.jsp?cedula=<%= empleado.getCedula()%>">
                                <img src="img/borrar.png" alt="alt"/>
                            </button>

                            <%
                                }
                            %>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>

            </table>
        </div>
    </div>

    <%
        {
            String mensa = (request.getParameter("mens")).replace(".", " ");
            if (mensa.equals("0")) {

                mensa = "";
            } else {
    %>
    <script>
        aparecerDiv("divListar");
    </script>

    <div id="divListar" style="display: none;" class="alert alert-success">
        <%= mensa%>
    </div>
    <%
            }
        }
    %>

    <div id="boxListar">
    </div>    

    <div class="card-footer">
    </div>

    <script src="js/dataTable/dataTables.buttons.min.js"></script>
    <script src="js/dataTable/buttons.flash.min.js"></script>
    <script src="js/dataTable/jszip.min.js"></script>
    <script src="js/dataTable/pdfmake.min.js"></script>
    <script src="js/dataTable/vfs_fonts.js"></script>
    <script src="js/dataTable/buttons.html5.min.js"></script>
    <script src="js/dataTable/buttons.print.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tablaEmpleados').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
    </script>
    
        <%  String idEmpleado4 = request.getParameter("emple");
        {
    %>

    <input id="emplea" style="display: none;" value = <%= idEmpleado4%> >

    <%
        }
    %>
</html>