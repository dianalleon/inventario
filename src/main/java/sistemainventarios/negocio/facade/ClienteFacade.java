/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.negocio.facade;

import static java.lang.Integer.parseInt;
import sistemainventarios.capadatos.entidades.Cliente;
import sistemainventarios.negocio.inventario.ClienteNegocio;
import java.util.List;
import sistemainventarios.capadatos.entidades.Categoria;

/**
 *
 * @author Usuario
 */
public class ClienteFacade {
    private ClienteNegocio clienteNegocio;

    public ClienteFacade() {
        clienteNegocio = new ClienteNegocio();
    }
    
    public String insertarCliente(Cliente p, String nuevo){
        return clienteNegocio.insertarCliente(p, nuevo);
    }  
    
    public Cliente buscarCliente(String cedula){
        return clienteNegocio.buscarCliente(cedula);
    }
    
    public List<Cliente> buscarClientes(){
        return clienteNegocio.buscarClientes();
    }
        
    public String eliminarCliente(String cedula){
        return clienteNegocio.eliminarCliente(cedula);
    }  
    
   public int convertirNumero(String valor) {

    int numero = parseInt(valor);

    return numero;
}  

    
}
