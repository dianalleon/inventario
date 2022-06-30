/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.capadatos.dao;

import sistemainventarios.capadatos.Conexion;
import sistemainventarios.capadatos.entidades.Empleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class EmpleadoDao {
    
    public boolean insertarEmpleado(Empleado empleado , String nuevo)throws Exception{
        boolean rta=false;
        
        Conexion con= new Conexion();
        Connection conexion = con.conectar("EmpleadoDao.insertarEmpleado()");
        
        String sql="";
        
        if (nuevo.equals("0")){
        sql = "REPLACE INTO empleado VALUES (?,?,?,?,?)";}
        else{
        sql = "INSERT INTO empleado VALUES (?,?,?,?,?)";}
        
        //String sql = "INSERT INTO empleado VALUES (?,?,?,?)";
        PreparedStatement ps = conexion.prepareStatement(sql);
        
        ps.setString(1, empleado.getCedula());
        ps.setString(2, empleado.getNombre());
        ps.setString(3, empleado.getEmail());
        ps.setString(4, empleado.getPassword());
        ps.setString(5, "0");
        
        ps.execute();
        rta=true;
        
        ps.close();
        conexion.close();
        
        ps=null;
        conexion=null;
        return rta;
    }
    
    public Empleado buscarEmpleado(String cedula)throws Exception{
        Empleado p = new Empleado();
        
        Conexion con= new Conexion();
        
        Connection conexion = con.conectar("EmpleadoDao.buscarEmpleado()");
                
       
        String sql = "SELECT * FROM empleado WHERE cedula = ?";
        PreparedStatement ps = conexion.prepareStatement(sql);
        
        ps.setString(1, cedula);                
        ResultSet rst = ps.executeQuery();
        if (rst.next()){
            p.setCedula(rst.getString(1));
            p.setNombre(rst.getString(2));
            p.setEmail(rst.getString(3));
            p.setPassword(rst.getString(4));
            p.setTipo(rst.getString(5));
        } else p=null;
        
        rst.close();        
        ps.close();
        conexion.close();
        
        rst=null;
        ps=null;
        conexion=null;
        return p;
    }
    
    public List<Empleado> buscarEmpleados()throws Exception{
        List<Empleado> empleados = new ArrayList<>();
                
        Conexion con= new Conexion();
        Connection conexion = con.conectar("EmpleadoDao.buscarEmpleados()");
        String sql = "SELECT * FROM empleado ";
        PreparedStatement ps = conexion.prepareStatement(sql);
                
        ResultSet rst = ps.executeQuery();
        while (rst.next()){
            Empleado p = new Empleado();
            p.setCedula(rst.getString(1));
            p.setNombre(rst.getString(2));
            p.setEmail(rst.getString(3));
            p.setPassword(rst.getString(4));
            p.setTipo(rst.getString(5));
            
            empleados.add(p);
        }
        
        rst.close();        
        ps.close();
        conexion.close();
        
        rst=null;
        ps=null;
        conexion=null;
        return empleados;
    }
    
    public boolean eliminarEmpleado(String cedula)throws Exception{
        boolean rta=false;
        
        Conexion con= new Conexion();
        Connection conexion = con.conectar("EmpleadoDao.eliminarEmpleado()");
        
        String sql= "DELETE FROM empleado WHERE cedula = ?";
        
        PreparedStatement ps = conexion.prepareStatement(sql);
        
        ps.setString(1, cedula);
        
        
        ps.executeUpdate();
        rta=true;
        
        ps.close();
        conexion.close();
        
        ps=null;
        conexion=null;
        return rta;
    }
}
