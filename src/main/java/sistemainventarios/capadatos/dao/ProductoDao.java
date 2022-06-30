/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.capadatos.dao;

import sistemainventarios.capadatos.dao.CategoriaDao;
import sistemainventarios.capadatos.Conexion;
import sistemainventarios.capadatos.entidades.Producto;
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
public class ProductoDao {
    
    public boolean insertarProducto(Producto producto , String nuevo)throws Exception{
        boolean rta=false;
        
        Conexion con= new Conexion();
        Connection conexion = con.conectar("ProductoDao.insertarProducto()");
        
        String sql="";
        
        if (nuevo.equals("0")){
        sql = "REPLACE INTO producto VALUES (?,?,?,?,?,?,?,?)";}
        else{
        sql = "INSERT INTO producto VALUES (?,?,?,?,?,?,?,?)";}
        
        //String sql = "INSERT INTO producto VALUES (?,?,?,?)";
        PreparedStatement ps = conexion.prepareStatement(sql);
        
        ps.setString(1, producto.getIdProducto());
        ps.setString(2, producto.getNombre());
        ps.setInt(3, producto.getPrecio());
        ps.setInt(4, producto.getCantidad());
        ps.setInt(5, producto.getIva());
        ps.setInt(6, producto.getRetencion());
        ps.setInt(7, producto.getCantidadMinima());
        ps.setString(8, producto.getIdCat().getIdCategoria());
        
        ps.execute();
        rta=true;
        
        ps.close();
        conexion.close();
        
        ps=null;
        conexion=null;
        return rta;
    }
    
    public Producto buscarProducto(String idProducto)throws Exception{
        Producto p = new Producto();
        
        Conexion con= new Conexion();
        
        Connection conexion = con.conectar("ProductoDao.buscarProducto()");
                
       
        String sql = "SELECT * FROM producto WHERE idProducto = ?";
        PreparedStatement ps = conexion.prepareStatement(sql);
        
        CategoriaDao cd = new CategoriaDao();
        
        ps.setString(1, idProducto);                
        ResultSet rst = ps.executeQuery();
        if (rst.next()){
            p.setIdProducto(rst.getString(1));
            p.setNombre(rst.getString(2));
            p.setPrecio(rst.getInt(3));
            p.setCantidad(rst.getInt(4));
            p.setIva(rst.getInt(5));
            p.setRetencion(rst.getInt(6));
            p.setCantidadMinima(rst.getInt(7));
            p.getIdCat().setIdCategoria(rst.getString(8));
            p.getIdCat().setNombre(cd.buscarCategoria(rst.getString(8)).getNombre());
        } else p=null;
        
        rst.close();        
        ps.close();
        conexion.close();
        
        rst=null;
        ps=null;
        conexion=null;
        return p;
    }
    
    public List<Producto> buscarProductos()throws Exception{
        List<Producto> productos = new ArrayList<>();
                
        Conexion con= new Conexion();
        Connection conexion = con.conectar("ProductoDao.buscarProductos()");
        String sql = "SELECT * FROM producto ";
        PreparedStatement ps = conexion.prepareStatement(sql);
        
        CategoriaDao cd = new CategoriaDao();
                
        ResultSet rst = ps.executeQuery();
        while (rst.next()){
            Producto p = new Producto();
            p.setIdProducto(rst.getString(1));
            p.setNombre(rst.getString(2));
            p.setPrecio(rst.getInt(3));
            p.setCantidad(rst.getInt(4));
            p.setIva(rst.getInt(5));
            p.setRetencion(rst.getInt(6));
            p.setCantidadMinima(rst.getInt(7));
            p.getIdCat().setIdCategoria(rst.getString(8));
            p.getIdCat().setNombre(cd.buscarCategoria(rst.getString(8)).getNombre());
            
            productos.add(p);
        }
        
        rst.close();        
        ps.close();
        conexion.close();
        
        rst=null;
        ps=null;
        conexion=null;
        return productos;
    }
    
    public boolean eliminarProducto(String idProducto)throws Exception{
        boolean rta=false;
        
        Conexion con= new Conexion();
        Connection conexion = con.conectar("ProductoDao.eliminarProducto()");
        
        String sql= "DELETE FROM producto WHERE idProducto = ?";
        
        PreparedStatement ps = conexion.prepareStatement(sql);
        
        ps.setString(1, idProducto);
        
        
        ps.executeUpdate();
        rta=true;
        
        ps.close();
        conexion.close();
        
        ps=null;
        conexion=null;
        return rta;
    }
    
    
        public List<Categoria> getCategoria() throws Exception{
        List<Categoria> categorias = new ArrayList<Categoria>();
        
        Conexion conexion = new Conexion();
        Connection con = conexion.conectar("ProductoDao.getCategoria");
        String sql = "SELECT * FROM categoria "
                + "ORDER BY nombre";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rst = ps.executeQuery();
        
        while (rst.next()){
            Categoria categoria = new Categoria();
            categoria.setIdCategoria(rst.getString(1));
            categoria.setNombre((rst.getString(2)));
            
            categorias.add(categoria);
        }
        rst.close();
        rst=null;
        
        ps.close();
        ps=null;
        
        con.close();
        con=null;
        
        return categorias;
    }
    
    
    
}
