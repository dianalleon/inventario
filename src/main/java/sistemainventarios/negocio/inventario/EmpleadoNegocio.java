/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.negocio.inventario;

import sistemainventarios.capadatos.dao.EmpleadoDao;
import sistemainventarios.capadatos.entidades.Empleado;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class EmpleadoNegocio {
    
    private EmpleadoDao empleadoDao;

    public EmpleadoNegocio() {
        empleadoDao = new EmpleadoDao();
    }
            
    public String insertarEmpleado(Empleado p, String nuevo){
        String rta="";
        try {
            Empleado pe = empleadoDao.buscarEmpleado(p.getCedula());
            if (pe==null || nuevo.equals("0")){
                boolean res = empleadoDao.insertarEmpleado(p, nuevo);
                if (res) rta = "Empleado guardado con exito";
                else rta = "Error: No se pudo guardar el empleado";
            } else rta = "Error: El empleado ya existe";
        } catch (Exception e) {
            rta="Error: No se pudo guardar el empleado";
            e.printStackTrace();
        }
        return rta;
    }
    
    public Empleado buscarEmpleado(String cedula){
        Empleado p = new Empleado();
        try {
            p = empleadoDao.buscarEmpleado(cedula);
        } catch (Exception e) {
            e.printStackTrace();
            p= null;
        }
        return p;
    }
    
    public List<Empleado> buscarEmpleados(){
        List<Empleado> empleados;
        try {
            empleados = empleadoDao.buscarEmpleados();
        } catch (Exception e) {
            e.printStackTrace();
            empleados= null;
        }
        return empleados;
    }
    
    public String eliminarEmpleado(String cedula){
        String rta="";
        try {
                boolean res = empleadoDao.eliminarEmpleado(cedula);
                if (res) rta = "Empleado eliminado con exito." ;
                else rta = "Error al eliminar el empleado";
        } catch (Exception e) {
            rta="Error al eliminar el empleado";
            e.printStackTrace();
        }
        return rta;
    }
    
    public String validarUsuario(String cedula, String password){
        String rta="Ok";
        
        Empleado p = new Empleado();
        try {
            p = empleadoDao.buscarEmpleado(cedula);
            if (!p.getPassword().equals(password)){
                rta="Usuario o contraseña incorrecto";
            }
        } catch (Exception e) {
            e.printStackTrace();
            p= null;
            rta="Usuario o contraseña incorrecto";
        }
        return rta;
    }
    
}
