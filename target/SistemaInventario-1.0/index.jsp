<!DOCTYPE html>
<html>
    <head>
        <title>Sistema de Inventarios</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/jquery-3.2.1.min.js"></script>
        <link rel="stylesheet" href="css/estilos3.css" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="js/validaciones.js"></script>

    </head>
    <body>
        <script>
            $(document).ready(function () {
                $("#btnAceptar").click(function () {
                    $("#boxIndex").load("validarUsuario.jsp?" + (preValidar()), function () {
                    });
                });
            });
        </script>

        <div class="card-body">
            <form id="frmRegistrar" name="frmRegistrar" action="menu.jsp" method="post" 
                  onsubmit="return validar()">

                <div class="table-responsive">
                    <table id="tablaEmpleados" class="table table-borderless">                

                        <thead>
                            <tr>
                                <th>                        
                                    <img src="img/inventario.png">
                                </th>

                                <th>  
                                    <div class="table-responsive">
                                        <table id="tablaEmpleados" class="table table-borderless">
                                            <div>
                                                <h1>Login</h1>
                                            </div>
                                            <thead>
                                                <tr>
                                                    <th>                        
                                                        <label for="cedula" class="form-label">Usuario</label>
                                                    </th>

                                                    <th>
                                                        <input type="text" name="cedula" id="cedula" 
                                                               placeholder="Digite su usuario" required >
                                                    </th>
                                                </tr>                            

                                                <tr>                               
                                                    <th>
                                                        <label for="password"  class="form-label">Password:</label>
                                                    </th>
                                                    <th>
                                                        <input type="password" name="password" id="password" 
                                                               placeholder="Digite su password" required >
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th>

                                                    </th>

                                                    <th>
                                                        <div class="form-group">

                                                            <input type="button" id="btnAceptar" value="Aceptar" class="btn btn-success" >
                                                        </div>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>

                                </th>
                            </tr>  
                        </thead>
                    </table>
                </div>

                <br>

                <div id="boxIndex">
                </div>

                <br>

                <script src="js/bootstrap.min.js"></script>
                <script src="js/jquery-3.2.1.min.js"></script>
            </form>
        </div>          
    </body>
</html>