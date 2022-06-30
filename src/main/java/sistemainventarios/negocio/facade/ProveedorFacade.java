/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.negocio.facade;

import static java.lang.Integer.parseInt;
import sistemainventarios.capadatos.entidades.Proveedor;
import sistemainventarios.negocio.inventario.ProveedorNegocio;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class ProveedorFacade {
    private ProveedorNegocio proveedorNegocio;

    public ProveedorFacade() {
        proveedorNegocio = new ProveedorNegocio();
    }
    
    public String insertarProveedor(Proveedor p, String nuevo){
        return proveedorNegocio.insertarProveedor(p, nuevo);
    }  
    
    public Proveedor buscarProveedor(String idProveedor){
        return proveedorNegocio.buscarProveedor(idProveedor);
    }
    
    public List<Proveedor> buscarProveedores(){
        return proveedorNegocio.buscarProveedores();
    }
        
    public String eliminarProveedor(String idProveedor){
        return proveedorNegocio.eliminarProveedor(idProveedor);
    }  
    
   public int convertirNumero(String valor) {

    int numero = parseInt(valor);

    return numero;
}
    
    
}
