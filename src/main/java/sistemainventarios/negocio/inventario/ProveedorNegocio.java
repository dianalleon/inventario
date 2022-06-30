/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.negocio.inventario;

import sistemainventarios.capadatos.dao.ProveedorDao;
import sistemainventarios.capadatos.entidades.Proveedor;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class ProveedorNegocio {
    
    private ProveedorDao proveedorDao;

    public ProveedorNegocio() {
        proveedorDao = new ProveedorDao();
    }
            
    public String insertarProveedor(Proveedor p, String nuevo){
        String rta="";
        try {
            Proveedor pe = proveedorDao.buscarProveedor(p.getIdProveedor());
            if (pe==null || nuevo.equals("0")){
                boolean res = proveedorDao.insertarProveedor(p, nuevo);
                if (res) rta = "Proveedor guardado con exito";
                else rta = "Error: No se pudo guardar el proveedor";
            } else rta = "Error: El proveedor ya existe";
        } catch (Exception e) {
            rta="Error: No se pudo guardar el proveedor";
            e.printStackTrace();
        }
        return rta;
    }
    
    public Proveedor buscarProveedor(String idProveedor){
        Proveedor p = new Proveedor();
        try {
            p = proveedorDao.buscarProveedor(idProveedor);
        } catch (Exception e) {
            e.printStackTrace();
            p= null;
        }
        return p;
    }
    
    public List<Proveedor> buscarProveedores(){
        List<Proveedor> proveedores;
        try {
            proveedores = proveedorDao.buscarProveedores();
        } catch (Exception e) {
            e.printStackTrace();
            proveedores= null;
        }
        return proveedores;
    }
    
    public String eliminarProveedor(String idProveedor){
        String rta="";
        try {
                boolean res = proveedorDao.eliminarProveedor(idProveedor);
                if (res) rta = "Proveedor eliminado con exito." ;
                else rta = "Error al eliminar el proveedor";
        } catch (Exception e) {
            rta="Error al eliminar el proveedor";
            e.printStackTrace();
        }
        return rta;
    }
}
