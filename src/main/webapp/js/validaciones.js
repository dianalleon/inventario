/* 
 Document   : editarEmpleado.jsp
 Created on : 7 abr. 2022, 13:55:08
 Author     : Videoadicto
 */

function separar(X) {

    //window.alert("" + X);
    var adc = X.split(",");
  
   document.getElementById("idProducto").value = adc[0];
   document.getElementById("nombre").value = adc[1];
   document.getElementById("precio").value = adc[2];
   document.getElementById("cantidadX").value = adc[3];
   
   //window.alert("" +  adc[3]);
    
}



function separarCompra(X) {

    //window.alert("" + X);
    var adc = X.split(";");
  
   document.getElementById("idProducto").value = adc[0];
   document.getElementById("nombre").value = adc[1];
   document.getElementById("precio").value = adc[2];
   
   //window.alert("" +  adc[3]);
    
}

function Procesar(X,Y) {
    window.alert("" + X);
    window.alert("" + Y);
}



function limpiarProducto() {
   document.getElementById("idProducto").value = "";
   document.getElementById("nombre").value = "";
   document.getElementById("precio").value = "";
   document.getElementById("cantidad").value = "";
   document.getElementById("sinDatos").style = "display:none;";
   document.getElementById("sinStock").style = "display:none;";
}

function aparecerDiv(divElegido) {
    document.getElementById("" + divElegido).style = 'display:"";';
}

function corregirNombre(nombre) {
//window.alert("nombre= " + nombre );
    var dato = nombre.replace(/_/g, " ");
    return dato;
}

function modificarMenu() {
    var valor1 = document.getElementById("valor").value;

    if (valor1 === "0") {
        document.getElementById("prov").style = "display:none;";
        document.getElementById("emp").style = "display:none;";
    }

    //window.alert("" + valor1);
}


function preValidar() {
    var cedula1 = document.getElementById("cedula").value;
    var password1 = document.getElementById("password").value;

    //window.alert("prevalidar");

    datos = "cedula2=" + cedula1 + "&password2=" + password1;

    return datos;
}

function validarPagina() {

    var X = document.getElementById("valor2").value;
    
    if (X !== "1") {
        window.alert("primero: " + X);
        return false;
    }
    else
    {
    window.alert("segundo: " + X);
    return true;
    }

}

function limpiar(){
    frmRegistrar.getElementById("cedula").value = "";
    frmRegistrar.getElementById("password").value = "";
}

//sobrante
    function validarX() {

        frmRegistrar.cedula.value = null;
        frmRegistrar.password.value = null;
        window.alert("yes");

    }

    function validar() {
        var mens = document.getElementById("mensaje").value;

        if (mens !== "Ok") {
            return false;
        }

    }
    
    
    
    function eluid() {
        var mens = document.getElementById("emple").value;
        return mens;
    }


    function verificarPagina(texto)
    {
        //window.alert("validarEdicion :" + texto);
        var datos = "";

        if (texto.includes("eliminar")) {
            datos = texto + "&sn=" + (window.confirm("Esta seguro que desea borrar el registro?"));
        } else
        {
            datos = texto;
            //window.alert("" + datos);
        }
        return datos;
    }
    
    function verificarPagina2(texto)
    {
        //window.alert("validarEdicion :" + texto);
        var datos = "";

        if (texto.includes("eliminar")) {
            datos = texto + "&sn=" + (window.confirm("Esta seguro que desea borrar el registro?"));
        } else
        {
            
            if (texto.includes("?")){
            datos = texto;    
            }
            else{
            datos = texto + "?uid="+ document.getElementById("emplea").value;
            //window.alert("" + datos);
        }
        }
        return datos;
    }
    
    

    function validarDatos(nuevo) {
        var datos = "";
        document.getElementById("divInsertar").innerHTML = "";
        document.getElementById("divInsertar").style = 'display:"";';

        try {
            document.getElementById("divGuardar").innerHTML = "";
            document.getElementById("divGuardar").style = "display:none;";

        } catch (error) {
            console.error(error);
        }

        var cedula1 = (((frmRegistrar.cedula.value).trim()).replace(/ /g, ""));
        var nombre1 = ((frmRegistrar.nombre.value).trim()).replace(/ /g, "_");
        var email1 = ((frmRegistrar.email.value).trim()).replace(/ /g, "");
        var password11 = ((frmRegistrar.password.value).trim()).replace(/ /g, "");
        var password22 = ((frmRegistrar.repetir_password.value).trim()).replace(/ /g, "");

        //window.alert("cedula2=" + cedula1 + "&nombre2=" + nombre1 + "&email2=" + email1 + "&password2=" + password11 + "&nuevo2=" + nuevo + "&validar2=1");

        if (cedula1 === "" || nombre1 === "" || email1 === "" || password11 === "" || password22 === "")
        {
            document.getElementById("divInsertar").innerHTML = "Error: Hay campos vacios";
            datos = "validar2=0";
        } else {
            if (password11 != password22) {
                document.getElementById("divInsertar").innerHTML = "Error: La contraseña no coincide";
                //frmRegistrar.repetir_password.focus();
                datos = "validar2=0";
            } else {
                datos = "cedula2=" + cedula1 + "&nombre2=" + nombre1 + "&email2=" + email1 + "&password2=" + password11 + "&nuevo2=" + nuevo + "&validar2=1";
                document.getElementById("divInsertar").style = "display: none;";
            }
        }
        return datos;
    }

    function validarDatosEdicion(nuevo) {

        var datos = "";
        document.getElementById("divEditar").innerHTML = "";
        document.getElementById("divEditar").style = 'display:"";';

        try {
            document.getElementById("divGuardar").innerHTML = "";
            document.getElementById("divGuardar").style = "display:none;";

        } catch (error) {
            console.error(error);
        }

        var cedula1 = (frmRegistrar.cedula.value).trim();
        var nombre1 = ((frmRegistrar.nombre.value).trim()).replace(/ /g, "_");
        var email1 = ((frmRegistrar.email.value).trim()).replace(/ /g, "");
        var password1 = (frmRegistrar.password.value).trim();

        if (nombre1 === "" || email1 === "")
        {
            document.getElementById("divEditar").innerHTML = "Error: Hay campos vacios";
            datos = "validar2=0";
        } else {
            datos = "cedula2=" + cedula1 + "&nombre2=" + nombre1 + "&email2=" + email1 + "&password2=" + password1 + "&nuevo2=" + nuevo + "&validar2=1";
            document.getElementById("divEditar").style = "display: none;";
        }
        return datos;
    }


    function validarDatosProducto(nuevo) {

        var datos = "";
        document.getElementById("divInsertar").innerHTML = "";
        document.getElementById("divInsertar").style = 'display:"";';

        try {
            document.getElementById("divGuardar").innerHTML = "";
            document.getElementById("divGuardar").style = "display:none;";

        } catch (error) {
            console.error(error);
        }

        var idProducto1 = (((frmRegistrar.idProducto.value).trim()).replace(/ /g, ""));
        var nombre1 = ((frmRegistrar.nombre.value).trim()).replace(/ /g, "_");
        var precio1 = ((frmRegistrar.precio.value).trim()).replace(/ /g, "");
        var cantidad1 = ((frmRegistrar.cantidad.value).trim()).replace(/ /g, "");
        var iva1 = Number(((frmRegistrar.iva.value).trim()).replace(/ /g, ""));
        var retencion1 = ((frmRegistrar.retencion.value).trim()).replace(/ /g, "");
        var cantidadMinima1 = ((frmRegistrar.cantidadMinima.value).trim()).replace(/ /g, "");
        var idCategoria1 = ((frmRegistrar.idCategoria.value).trim()).replace(/ /g, "");

        //window.alert("idProducto2=" + idProducto1 + "&nombre2=" + nombre1 + "&precio2=" + precio1 + "&cantidad2=" + cantidad1 + "&iva2=" + iva1 + "&retencion2=" + retencion1 + "&cantidadMinima2=" + cantidadMinima1 + "&idCategoria2=" + idCategoria1 + "& nuevo2=" + nuevo + "&validar2=1");

        if (idProducto1 === "" || nombre1 === "" || precio1 === "" || cantidad1 === "" || iva1 === "" || retencion1 === "" || cantidadMinima1 === "" || idCategoria1 === "")
        {
            document.getElementById("divInsertar").innerHTML = "Error: Hay campos vacios";
            datos = "validar2=0";
        } else {
            datos = "idProducto2=" + idProducto1 + "&nombre2=" + nombre1 + "&precio2=" + precio1 + "&cantidad2=" + cantidad1 + "&iva2=" + iva1 + "&retencion2=" + retencion1 + "&cantidadMinima2=" + cantidadMinima1 + "&idCategoria2=" + idCategoria1 + "&nuevo2=" + nuevo + "&validar2=1";
            document.getElementById("divInsertar").style = "display: none;";
        }
        return datos;
    }
    
    
    function validarDatosVenta(nuevo, filas) {

        //window.alert("si0");

        var datos = "";
        document.getElementById("divInsertar").innerHTML = "";
        document.getElementById("divInsertar").style = 'display:"";';

        try {
            document.getElementById("divGuardar").innerHTML = "";
            document.getElementById("divGuardar").style = "display:none;";

        } catch (error) {
            console.error(error);
        }
        
        
        //window.alert("si1");

        var idVenta1 = (((frmRegistrar.idFactura.value).trim()).replace(/ /g, ""));
        var idCliente1 = frmRegistrar.idCliente.value;
        var total1 = frmRegistrar.total.value;
        var lista1 = frmRegistrar.lista.value;
        var uid1 = document.getElementById("uid").value;

        //window.alert("idVenta: " + idVenta1 + "idcliente: " + idCliente1 + " total: " + total1 + " lista: " + lista1);

        //window.alert("idProducto2=" + idProducto1 + "&nombre2=" + nombre1 + "&precio2=" + precio1 + "&cantidad2=" + cantidad1 + "&iva2=" + iva1 + "&retencion2=" + retencion1 + "&cantidadMinima2=" + cantidadMinima1 + "&idCategoria2=" + idCategoria1 + "& nuevo2=" + nuevo + "&validar2=1");

        if (idVenta1 === "" )
        {
            document.getElementById("divInsertar").innerHTML = "Error: Hay campos vacios";
            datos = "validar2=0";
        } else {
            datos = "idVenta2=" + idVenta1 + "&idCliente2=" + idCliente1 + "&total2=" + total1 + "&lista2=" + lista1 + "&uid=" + uid1 + "&filas2=" + filas + "&nuevo2=" + nuevo + "&validar2=1";
            document.getElementById("divInsertar").style = "display: none;";
            
            //window.alert("" + datos);
            
        }
        return datos;
    }
    
    
    function validarDatosCompra(nuevo, filas) {

        //window.alert("si0");

        var datos = "";
        document.getElementById("divInsertar").innerHTML = "";
        document.getElementById("divInsertar").style = 'display:"";';

        try {
            document.getElementById("divGuardar").innerHTML = "";
            document.getElementById("divGuardar").style = "display:none;";

        } catch (error) {
            console.error(error);
        }
        
        
        //window.alert("si1");

        var idCompra1 = (((frmRegistrar.idFactura.value).trim()).replace(/ /g, ""));
        var idProveedor1 = frmRegistrar.idProveedor.value;
        var total1 = frmRegistrar.total.value;
        var lista1 = frmRegistrar.lista.value;
        var uid1 = document.getElementById("uid").value;

        //window.alert("idVenta: " + idVenta1 + "idcliente: " + idCliente1 + " total: " + total1 + " lista: " + lista1);

        //window.alert("idProducto2=" + idProducto1 + "&nombre2=" + nombre1 + "&precio2=" + precio1 + "&cantidad2=" + cantidad1 + "&iva2=" + iva1 + "&retencion2=" + retencion1 + "&cantidadMinima2=" + cantidadMinima1 + "&idCategoria2=" + idCategoria1 + "& nuevo2=" + nuevo + "&validar2=1");

        if (idCompra1 === "" )
        {
            document.getElementById("divInsertar").innerHTML = "Error: Hay campos vacios";
            datos = "validar2=0";
        } else {
            datos = "idCompra2=" + idCompra1 + "&idProveedor2=" + idProveedor1 + "&total2=" + total1 + "&lista2=" + lista1 + "&uid=" + uid1 + "&filas2=" + filas + "&nuevo2=" + nuevo + "&validar2=1";
            document.getElementById("divInsertar").style = "display: none;";
            
            //window.alert("" + datos);
            
        }
        return datos;
    }
    


    function validarDatosCategoria(nuevo) {

        var datos = "";
        document.getElementById("divInsertar").innerHTML = "";
        document.getElementById("divInsertar").style = 'display:"";';

        try {
            document.getElementById("divGuardar").innerHTML = "";
            document.getElementById("divGuardar").style = "display:none;";

        } catch (error) {
            console.error(error);
        }

        var idCategoria1 = (((frmRegistrar.idCategoria.value).trim()).replace(/ /g, ""));
        var nombre1 = ((frmRegistrar.nombre.value).trim()).replace(/ /g, "_");

        //window.alert("idProducto2=" + idProducto1 + "&nombre2=" + nombre1 + "&precio2=" + precio1 + "&cantidad2=" + cantidad1 + "&iva2=" + iva1 + "&retencion2=" + retencion1 + "&cantidadMinima2=" + cantidadMinima1 + "&idCategoria2=" + idCategoria1 + "& nuevo2=" + nuevo + "&validar2=1");

        if (idCategoria1 === "" || nombre1 === "")
        {
            document.getElementById("divInsertar").innerHTML = "Error: Hay campos vacios";
            datos = "validar2=0";
        } else {
            datos = "idCategoria2=" + idCategoria1 + "&nombre2=" + nombre1 + "&nuevo2=" + nuevo + "&validar2=1";
            document.getElementById("divInsertar").style = "display: none;";
        }
        return datos;
    }


    function validarDatosCliente(nuevo) {

        var datos = "";
        document.getElementById("divInsertar").innerHTML = "";
        document.getElementById("divInsertar").style = 'display:"";';

        try {
            document.getElementById("divGuardar").innerHTML = "";
            document.getElementById("divGuardar").style = "display:none;";

        } catch (error) {
            console.error(error);
        }

        var cedula1 = ((frmRegistrar.cedula.value).trim()).replace(/ /g, "");
        var nombre1 = ((frmRegistrar.nombre.value).trim()).replace(/ /g, "_");
        var email1 = ((frmRegistrar.email.value).trim()).replace(/ /g, "");
        var telefono1 = ((frmRegistrar.telefono.value).trim()).replace(/ /g, "");

        if (cedula1 === "" || nombre1 === "" || email1 === "" || telefono1 === "")
        {
            document.getElementById("divInsertar").innerHTML = "Error: Hay campos vacios";
            datos = "validar2=0";
        } else {
            datos = "cedula2=" + cedula1 + "&nombre2=" + nombre1 + "&email2=" + email1 + "&telefono2=" + telefono1 + "&nuevo2=" + nuevo + "&validar2=1";
            document.getElementById("divInsertar").style = "display: none;";
        }
        return datos;
    }


    function validarDatosProveedor(nuevo) {

        var datos = "";
        document.getElementById("divInsertar").innerHTML = "";
        document.getElementById("divInsertar").style = 'display:"";';

        try {
            document.getElementById("divGuardar").innerHTML = "";
            document.getElementById("divGuardar").style = "display:none;";

        } catch (error) {
            console.error(error);
        }

        var idProveedor1 = ((frmRegistrar.idProveedor.value).trim()).replace(/ /g, "");
        var nombre1 = ((frmRegistrar.nombre.value).trim()).replace(/ /g, "_");
        var email1 = ((frmRegistrar.email.value).trim()).replace(/ /g, "");
        var telefono1 = ((frmRegistrar.telefono.value).trim()).replace(/ /g, "");

        if (idProveedor1 === "" || nombre1 === "" || email1 === "" || telefono1 === "")
        {
            document.getElementById("divInsertar").innerHTML = "Error: Hay campos vacios";
            datos = "validar2=0";
        } else {
            datos = "idProveedor2=" + idProveedor1 + "&nombre2=" + nombre1 + "&email2=" + email1 + "&telefono2=" + telefono1 + "&nuevo2=" + nuevo + "&validar2=1";
            document.getElementById("divInsertar").style = "display: none;";
        }
        return datos;
    }

    function nuevoAjax()
    {
        var xmlhttp = false;
        try {
            // Creacion del objeto AJAX para navegadores no IE Ejemplo:Mozilla, Safari 
            xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                // Creacion del objet AJAX para IE
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (E) {
                if (!xmlhttp && typeof XMLHttpRequest != 'undefined')
                    xmlhttp = new XMLHttpRequest();
            }
        }
        return xmlhttp;
    }


    function prueba() {
        aleatorio = Math.random();
        ajax = nuevoAjax();

        parametros = "cedula=" + cedula + "&nombre=" + nombre + "&email=" + email + "&password=" + password + "&nuevo=" + nuevo + "&aleatorio=" + aleatorio;
        url = "pg-empleado/guardarEmpleado.jsp";
        ajax.open("POST", url, true);
        ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        ajax.send(parametros);

        ajax.onreadystatechange = function ()
        {
            if (ajax.readyState == 4)
            {
                if (ajax.status == 200)
                {
                    document.getElementById("boxInsertar").innerHTML = ajax.responseText;
                } else
                {
                    document.getElementById("boxInsertar").innerHTML = ajax.responseText;
                }
            } else
            {
                document.getElementById("boxInsertar").innerHTML = "<img src='img/cargando.gif' width='100' height='100' />";
            }
        };
    }

    function preValidarX() {

        var cedula = document.getElementById("cedula").value;
        var password = document.getElementById("password").value;

        //window.alert("cedula=" + cedula2);



        ale = Math.random();
        parametros = "cedula2=" + cedula + "&password2=" + password + "&ale=" + ale;

        ajax = nuevoAjax();
        url = "validarUsuario.jsp";
        ajax.open("POST", url, true);
        ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        ajax.send(parametros);

        ajax.onreadystatechange = function ()
        {
            if (ajax.readyState == 4)
            {
                if (ajax.status == 200)
                {
                    document.getElementById("boxIndex").innerHTML = ajax.responseText;
                } else
                {
                    document.getElementById("boxIndex").innerHTML = ajax.responseText;
                }
            }
        };
}