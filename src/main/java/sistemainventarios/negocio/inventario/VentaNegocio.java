/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.negocio.inventario;

import java.util.ArrayList;
import sistemainventarios.capadatos.dao.VentaDao;
import sistemainventarios.capadatos.entidades.Venta;
import java.util.List;
import sistemainventarios.capadatos.entidades.Cliente;

/**
 *
 * @author Usuario
 */
public class VentaNegocio {
    
    private VentaDao ventaDao;

    public VentaNegocio() {
        ventaDao = new VentaDao();
    }
            
    public String insertarVenta(Venta p, String nuevo){
        String rta="";
        try {
            Venta pe = ventaDao.buscarVenta(p.getIdVenta());
            if (pe==null || nuevo.equals("0")){
                boolean res = ventaDao.insertarVenta(p, nuevo);
                if (res) rta = "Venta guardada con exito";
                else rta = "Error: No se pudo guardar la venta";
            } else rta = "Error: La venta ya existe";
        } catch (Exception e) {
            rta="Error: No se pudo guardar la venta";
            e.printStackTrace();
        }
        return rta;
    }
    
    public Venta buscarVenta(String idVenta){
        Venta p = new Venta();
        try {
            p = ventaDao.buscarVenta(idVenta);
        } catch (Exception e) {
            e.printStackTrace();
            p= null;
        }
        return p;
    }
    
    public List<Venta> buscarVentas(){
        List<Venta> ventas;
        try {
            ventas = ventaDao.buscarVentas();
        } catch (Exception e) {
            e.printStackTrace();
            ventas= null;
        }
        return ventas;
    }
    
    public String eliminarVenta(String idVenta){
        String rta="";
        try {
                boolean res = ventaDao.eliminarVenta(idVenta);
                if (res) rta = "Venta eliminada con exito." ;
                else rta = "Error al eliminar la venta";
        } catch (Exception e) {
            rta="Error al eliminar la venta";
            e.printStackTrace();
        }
        return rta;
    }
    
          public List<Cliente> getCliente(){
        List<Cliente> clientes = new ArrayList<Cliente>();
        try {
            clientes = ventaDao.getCliente();
        } catch (Exception e) {
            clientes=null;
            e.printStackTrace();
        }
        return clientes;
    }
    
          
          
    
}
