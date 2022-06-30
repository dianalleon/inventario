/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.negocio.inventario;

import sistemainventarios.capadatos.dao.ClienteDao;
import sistemainventarios.capadatos.entidades.Cliente;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class ClienteNegocio {
    
    private ClienteDao clienteDao;

    public ClienteNegocio() {
        clienteDao = new ClienteDao();
    }
            
    public String insertarCliente(Cliente p, String nuevo){
        String rta="";
        try {
            Cliente pe = clienteDao.buscarCliente(p.getCedula());
            if (pe==null || nuevo.equals("0")){
                boolean res = clienteDao.insertarCliente(p, nuevo);
                if (res) rta = "Cliente guardado con exito";
                else rta = "Error: No se pudo guardar el cliente";
            } else rta = "Error: El cliente ya existe";
        } catch (Exception e) {
            rta="Error: No se pudo guardar el cliente";
            e.printStackTrace();
        }
        return rta;
    }
    
    public Cliente buscarCliente(String cedula){
        Cliente p = new Cliente();
        try {
            p = clienteDao.buscarCliente(cedula);
        } catch (Exception e) {
            e.printStackTrace();
            p= null;
        }
        return p;
    }
    
    public List<Cliente> buscarClientes(){
        List<Cliente> clientes;
        try {
            clientes = clienteDao.buscarClientes();
        } catch (Exception e) {
            e.printStackTrace();
            clientes= null;
        }
        return clientes;
    }
    
    public String eliminarCliente(String cedula){
        String rta="";
        try {
                boolean res = clienteDao.eliminarCliente(cedula);
                if (res) rta = "Cliente eliminado con exito." ;
                else rta = "Error al eliminar el cliente";
        } catch (Exception e) {
            rta="Error al eliminar el cliente";
            e.printStackTrace();
        }
        return rta;
    }
}
