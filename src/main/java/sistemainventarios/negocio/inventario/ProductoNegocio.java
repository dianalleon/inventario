/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.negocio.inventario;

import java.util.ArrayList;
import sistemainventarios.capadatos.dao.ProductoDao;
import sistemainventarios.capadatos.entidades.Producto;
import java.util.List;
import sistemainventarios.capadatos.entidades.Categoria;

/**
 *
 * @author Usuario
 */
public class ProductoNegocio {
    
    private ProductoDao productoDao;

    public ProductoNegocio() {
        productoDao = new ProductoDao();
    }
            
    public String insertarProducto(Producto p, String nuevo){
        String rta="";
        try {
            Producto pe = productoDao.buscarProducto(p.getIdProducto());
            if (pe==null || nuevo.equals("0")){
                boolean res = productoDao.insertarProducto(p, nuevo);
                if (res) rta = "Producto guardado con exito";
                else rta = "Error: No se pudo guardar el producto";
            } else rta = "Error: El producto ya existe";
        } catch (Exception e) {
            rta="Error: No se pudo guardar el producto";
            e.printStackTrace();
        }
        return rta;
    }
    
    public Producto buscarProducto(String idProducto){
        Producto p = new Producto();
        try {
            p = productoDao.buscarProducto(idProducto);
        } catch (Exception e) {
            e.printStackTrace();
            p= null;
        }
        return p;
    }
    
    public List<Producto> buscarProductos(){
        List<Producto> productos;
        try {
            productos = productoDao.buscarProductos();
        } catch (Exception e) {
            e.printStackTrace();
            productos= null;
        }
        return productos;
    }
    
    public String eliminarProducto(String idProducto){
        String rta="";
        try {
                boolean res = productoDao.eliminarProducto(idProducto);
                if (res) rta = "Producto eliminado con exito." ;
                else rta = "Error al eliminar el producto";
        } catch (Exception e) {
            rta="Error al eliminar el producto";
            e.printStackTrace();
        }
        return rta;
    }
    
          public List<Categoria> getCategoria(){
        List<Categoria> categorias = new ArrayList<Categoria>();
        try {
            categorias = productoDao.getCategoria();
        } catch (Exception e) {
            categorias=null;
            e.printStackTrace();
        }
        return categorias;
    }
    
    
}
