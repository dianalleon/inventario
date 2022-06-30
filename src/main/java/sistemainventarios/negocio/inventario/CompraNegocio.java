/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.negocio.inventario;

import java.util.ArrayList;
import sistemainventarios.capadatos.dao.CompraDao;
import sistemainventarios.capadatos.entidades.Compra;
import java.util.List;
import sistemainventarios.capadatos.entidades.Proveedor;

/**
 *
 * @author Usuario
 */
public class CompraNegocio {
    
    private CompraDao compraDao;

    public CompraNegocio() {
        compraDao = new CompraDao();
    }
            
    public String insertarCompra(Compra p, String nuevo){
        String rta="";
        try {
            Compra pe = compraDao.buscarCompra(p.getIdCompra());
            if (pe==null || nuevo.equals("0")){
                boolean res = compraDao.insertarCompra(p, nuevo);
                if (res) rta = "Compra guardada con exito";
                else rta = "Error: No se pudo guardar la compra";
            } else rta = "Error: La compra ya existe";
        } catch (Exception e) {
            rta="Error: No se pudo guardar la compra";
            e.printStackTrace();
        }
        return rta;
    }
    
    public Compra buscarCompra(String idCompra){
        Compra p = new Compra();
        try {
            p = compraDao.buscarCompra(idCompra);
        } catch (Exception e) {
            e.printStackTrace();
            p= null;
        }
        return p;
    }
    
    public List<Compra> buscarCompras(){
        List<Compra> compras;
        try {
            compras = compraDao.buscarCompras();
        } catch (Exception e) {
            e.printStackTrace();
            compras= null;
        }
        return compras;
    }
    
    public String eliminarCompra(String idCompra){
        String rta="";
        try {
                boolean res = compraDao.eliminarCompra(idCompra);
                if (res) rta = "Compra eliminada con exito." ;
                else rta = "Error al eliminar la compra";
        } catch (Exception e) {
            rta="Error al eliminar la compra";
            e.printStackTrace();
        }
        return rta;
    }
    
          public List<Proveedor> getProveedor(){
        List<Proveedor> proveedores = new ArrayList<Proveedor>();
        try {
            proveedores = compraDao.getProveedor();
        } catch (Exception e) {
            proveedores=null;
            e.printStackTrace();
        }
        return proveedores;
    }
    
          
          
    
}
