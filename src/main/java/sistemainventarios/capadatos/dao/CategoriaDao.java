/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.capadatos.dao;

import sistemainventarios.capadatos.Conexion;
import sistemainventarios.capadatos.entidades.Categoria;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class CategoriaDao {
    
    public boolean insertarCategoria(Categoria categoria , String nuevo)throws Exception{
        boolean rta=false;
        
        Conexion con= new Conexion();
        Connection conexion = con.conectar("CategoriaDao.insertarCategoria()");
        
        String sql="";
        
        if (nuevo.equals("0")){
        sql = "REPLACE INTO categoria VALUES (?,?)";}
        else{
        sql = "INSERT INTO categoria VALUES (?,?)";}
        
        //String sql = "INSERT INTO categoria VALUES (?,?,?,?)";
        PreparedStatement ps = conexion.prepareStatement(sql);
        
        ps.setString(1, categoria.getIdCategoria());
        ps.setString(2, categoria.getNombre());
        
        ps.execute();
        rta=true;
        
        ps.close();
        conexion.close();
        
        ps=null;
        conexion=null;
        return rta;
    }
    
    public Categoria buscarCategoria(String idCategoria)throws Exception{
        Categoria p = new Categoria();
        
        Conexion con= new Conexion();
        
        Connection conexion = con.conectar("CategoriaDao.buscarCategoria()");
                
       
        String sql = "SELECT * FROM categoria WHERE idCategoria = ?";
        PreparedStatement ps = conexion.prepareStatement(sql);
        
        ps.setString(1, idCategoria);                
        ResultSet rst = ps.executeQuery();
        if (rst.next()){
            p.setIdCategoria(rst.getString(1));
            p.setNombre(rst.getString(2));
        } else p=null;
        
        rst.close();        
        ps.close();
        conexion.close();
        
        rst=null;
        ps=null;
        conexion=null;
        return p;
    }
    
    public List<Categoria> buscarCategorias()throws Exception{
        List<Categoria> categorias = new ArrayList<>();
                
        Conexion con= new Conexion();
        Connection conexion = con.conectar("CategoriaDao.buscarCategorias()");
        String sql = "SELECT * FROM categoria ";
        PreparedStatement ps = conexion.prepareStatement(sql);
                
        ResultSet rst = ps.executeQuery();
        while (rst.next()){
            Categoria p = new Categoria();
            p.setIdCategoria(rst.getString(1));
            p.setNombre(rst.getString(2));

            categorias.add(p);
        }
        
        rst.close();        
        ps.close();
        conexion.close();
        
        rst=null;
        ps=null;
        conexion=null;
        return categorias;
    }
    
    public boolean eliminarCategoria(String idCategoria)throws Exception{
        boolean rta=false;
        
        Conexion con= new Conexion();
        Connection conexion = con.conectar("CategoriaDao.eliminarCategoria()");
        
        String sql= "DELETE FROM categoria WHERE idCategoria = ?";
        
        PreparedStatement ps = conexion.prepareStatement(sql);
        
        ps.setString(1, idCategoria);
        
        
        ps.executeUpdate();
        rta=true;
        
        ps.close();
        conexion.close();
        
        ps=null;
        conexion=null;
        return rta;
    }
}
