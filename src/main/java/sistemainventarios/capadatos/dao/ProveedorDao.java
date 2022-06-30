/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.capadatos.dao;

import sistemainventarios.capadatos.Conexion;
import sistemainventarios.capadatos.entidades.Proveedor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class ProveedorDao {
    
    public boolean insertarProveedor(Proveedor proveedor , String nuevo)throws Exception{
        boolean rta=false;
        
        Conexion con= new Conexion();
        Connection conexion = con.conectar("ProveedorDao.insertarProveedor()");
        
        String sql="";
        
        if (nuevo.equals("0")){
        sql = "REPLACE INTO proveedor VALUES (?,?,?,?)";}
        else{
        sql = "INSERT INTO proveedor VALUES (?,?,?,?)";}
        
        //String sql = "INSERT INTO proveedor VALUES (?,?,?,?)";
        PreparedStatement ps = conexion.prepareStatement(sql);
        
        ps.setString(1, proveedor.getIdProveedor());
        ps.setString(2, proveedor.getNombre());
        ps.setString(3, proveedor.getEmail());
        ps.setString(4, proveedor.getTelefono());
        
        ps.execute();
        rta=true;
        
        ps.close();
        conexion.close();
        
        ps=null;
        conexion=null;
        return rta;
    }
    
    public Proveedor buscarProveedor(String idProveedor)throws Exception{
        Proveedor p = new Proveedor();
        
        Conexion con= new Conexion();
        
        Connection conexion = con.conectar("ProveedorDao.buscarProveedor()");
                
       
        String sql = "SELECT * FROM proveedor WHERE idProveedor = ?";
        PreparedStatement ps = conexion.prepareStatement(sql);
        
        ps.setString(1, idProveedor);                
        ResultSet rst = ps.executeQuery();
        if (rst.next()){
            p.setIdProveedor(rst.getString(1));
            p.setNombre(rst.getString(2));
            p.setEmail(rst.getString(3));
            p.setTelefono(rst.getString(4));
            
        } else p=null;
        
        rst.close();        
        ps.close();
        conexion.close();
        
        rst=null;
        ps=null;
        conexion=null;
        return p;
    }
    
    public List<Proveedor> buscarProveedores()throws Exception{
        List<Proveedor> proveedores = new ArrayList<>();
                
        Conexion con= new Conexion();
        Connection conexion = con.conectar("ProveedorDao.buscarProveedores()");
        String sql = "SELECT * FROM proveedor ";
        PreparedStatement ps = conexion.prepareStatement(sql);
                
        ResultSet rst = ps.executeQuery();
        while (rst.next()){
            Proveedor p = new Proveedor();
            p.setIdProveedor(rst.getString(1));
            p.setNombre(rst.getString(2));
            p.setEmail(rst.getString(3));
            p.setTelefono(rst.getString(4));

            proveedores.add(p);
        }
        
        rst.close();        
        ps.close();
        conexion.close();
        
        rst=null;
        ps=null;
        conexion=null;
        return proveedores;
    }
    
    public boolean eliminarProveedor(String idProveedor)throws Exception{
        boolean rta=false;
        
        Conexion con= new Conexion();
        Connection conexion = con.conectar("ProveedorDao.eliminarProveedor()");
        
        String sql= "DELETE FROM proveedor WHERE idProveedor = ?";
        
        PreparedStatement ps = conexion.prepareStatement(sql);
        
        ps.setString(1, idProveedor);
        
        ps.executeUpdate();
        rta=true;
        
        ps.close();
        conexion.close();
        
        ps=null;
        conexion=null;
        return rta;
    }
}
