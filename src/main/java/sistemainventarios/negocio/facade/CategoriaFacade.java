/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.negocio.facade;

import static java.lang.Integer.parseInt;
import sistemainventarios.capadatos.entidades.Categoria;
import sistemainventarios.negocio.inventario.CategoriaNegocio;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class CategoriaFacade {
    private CategoriaNegocio categoriaNegocio;

    public CategoriaFacade() {
        categoriaNegocio = new CategoriaNegocio();
    }
    
    public String insertarCategoria(Categoria p, String nuevo){
        return categoriaNegocio.insertarCategoria(p, nuevo);
    }  
    
    public Categoria buscarCategoria(String idCategoria){
        return categoriaNegocio.buscarCategoria(idCategoria);
    }
    
    public List<Categoria> buscarCategorias(){
        return categoriaNegocio.buscarCategorias();
    }
        
    public String eliminarCategoria(String idCategoria){
        return categoriaNegocio.eliminarCategoria(idCategoria);
    }  
    
   public int convertirNumero(String valor) {

    int numero = parseInt(valor);

    return numero;
}
    
    
}
