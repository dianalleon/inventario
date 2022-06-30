/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.negocio.facade;

import sistemainventarios.capadatos.entidades.Empleado;
import sistemainventarios.negocio.inventario.EmpleadoNegocio;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class EmpleadoFacade {
    private EmpleadoNegocio empleadoNegocio;

    public EmpleadoFacade() {
        empleadoNegocio = new EmpleadoNegocio();
    }
    
    public String insertarEmpleado(Empleado p, String nuevo){
        return empleadoNegocio.insertarEmpleado(p, nuevo);
    }  
    
    public Empleado buscarEmpleado(String id){
        return empleadoNegocio.buscarEmpleado(id);
    }
    
    public List<Empleado> buscarEmpleados(){
        return empleadoNegocio.buscarEmpleados();
    }
    
    public String eliminarEmpleado(String cedula){
        return empleadoNegocio.eliminarEmpleado(cedula);
    }  
    
      public String validarUsuario(String cedula, String password){
        return empleadoNegocio.validarUsuario(cedula, password);  
      }
}
