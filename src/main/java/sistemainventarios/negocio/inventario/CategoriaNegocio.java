/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.negocio.inventario;

import sistemainventarios.capadatos.dao.CategoriaDao;
import sistemainventarios.capadatos.entidades.Categoria;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class CategoriaNegocio {
    
    private CategoriaDao categoriaDao;

    public CategoriaNegocio() {
        categoriaDao = new CategoriaDao();
    }
            
    public String insertarCategoria(Categoria p, String nuevo){
        String rta="";
        try {
            Categoria pe = categoriaDao.buscarCategoria(p.getIdCategoria());
            if (pe==null || nuevo.equals("0")){
                boolean res = categoriaDao.insertarCategoria(p, nuevo);
                if (res) rta = "Categoria guardada con exito";
                else rta = "Error: No se pudo guardar la categoria";
            } else rta = "Error: La categoria ya existe";
        } catch (Exception e) {
            rta="Error: No se pudo guardar la categoria";
            e.printStackTrace();
        }
        return rta;
    }
    
    public Categoria buscarCategoria(String idCategoria){
        Categoria p = new Categoria();
        try {
            p = categoriaDao.buscarCategoria(idCategoria);
        } catch (Exception e) {
            e.printStackTrace();
            p= null;
        }
        return p;
    }
    
    public List<Categoria> buscarCategorias(){
        List<Categoria> categorias;
        try {
            categorias = categoriaDao.buscarCategorias();
        } catch (Exception e) {
            e.printStackTrace();
            categorias= null;
        }
        return categorias;
    }
    
    public String eliminarCategoria(String idCategoria){
        String rta="";
        try {
                boolean res = categoriaDao.eliminarCategoria(idCategoria);
                if (res) rta = "Categoria eliminada con exito." ;
                else rta = "Error al eliminar la categoria";
        } catch (Exception e) {
            rta="Error al eliminar la categoria";
            e.printStackTrace();
        }
        return rta;
    }
}
