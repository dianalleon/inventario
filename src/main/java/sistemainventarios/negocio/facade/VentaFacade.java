/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.negocio.facade;

import static java.lang.Integer.parseInt;
import sistemainventarios.capadatos.entidades.Venta;
import sistemainventarios.capadatos.entidades.Cliente;
import sistemainventarios.negocio.inventario.VentaNegocio;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class VentaFacade {
    private VentaNegocio ventaNegocio;

    public VentaFacade() {
        ventaNegocio = new VentaNegocio();
    }
    
    public String insertarVenta(Venta p, String nuevo){
        return ventaNegocio.insertarVenta(p, nuevo);
    }  
    
    public Venta buscarVenta(String idVenta){
        return ventaNegocio.buscarVenta(idVenta);
    }
    
    public List<Venta> buscarVentas(){
        return ventaNegocio.buscarVentas();
    }
        
    public String eliminarVenta(String idVenta){
        return ventaNegocio.eliminarVenta(idVenta);
    }  
    
   public int convertirNumero(String valor) {

    int numero = parseInt(valor);

    return numero;
}
   
       public List<Cliente> getCliente(){
        return ventaNegocio.getCliente();  
    }
    
}
