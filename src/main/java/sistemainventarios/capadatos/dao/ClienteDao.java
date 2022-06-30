/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.capadatos.dao;

import sistemainventarios.capadatos.Conexion;
import sistemainventarios.capadatos.entidades.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class ClienteDao {

    public boolean insertarCliente(Cliente cliente, String nuevo) throws Exception {
        boolean rta = false;

        Conexion con = new Conexion();
        Connection conexion = con.conectar("ClienteDao.insertarCliente()");

        String sql = "";

        if (nuevo.equals("0")) {
            sql = "REPLACE INTO cliente VALUES (?,?,?,?)";
        } else {
            sql = "INSERT INTO cliente VALUES (?,?,?,?)";
        }

        //String sql = "INSERT INTO cliente VALUES (?,?,?,?)";
        PreparedStatement ps = conexion.prepareStatement(sql);

        ps.setString(1, cliente.getCedula());
        ps.setString(2, cliente.getNombre());
        ps.setString(3, cliente.getEmail());
        ps.setString(4, cliente.getTelefono());

        ps.execute();
        rta = true;

        ps.close();
        conexion.close();

        ps = null;
        conexion = null;
        return rta;
    }

    public Cliente buscarCliente(String cedula) throws Exception {
        Cliente p = new Cliente();

        Conexion con = new Conexion();

        Connection conexion = con.conectar("ClienteDao.buscarCliente()");

        String sql = "SELECT * FROM cliente WHERE cedula = ?";
        PreparedStatement ps = conexion.prepareStatement(sql);

        ps.setString(1, cedula);
        ResultSet rst = ps.executeQuery();
        if (rst.next()) {
            p.setCedula(rst.getString(1));
            p.setNombre(rst.getString(2));
            p.setEmail(rst.getString(3));
            p.setTelefono(rst.getString(4));
        } else {
            p = null;
        }

        rst.close();
        ps.close();
        conexion.close();

        rst = null;
        ps = null;
        conexion = null;
        return p;
    }

    public List<Cliente> buscarClientes() throws Exception {
        List<Cliente> clientes = new ArrayList<>();

        Conexion con = new Conexion();
        Connection conexion = con.conectar("ClienteDao.buscarClientes()");
        String sql = "SELECT * FROM cliente ";
        PreparedStatement ps = conexion.prepareStatement(sql);

        ResultSet rst = ps.executeQuery();
        while (rst.next()) {
            Cliente p = new Cliente();
            p.setCedula(rst.getString(1));
            p.setNombre(rst.getString(2));
            p.setEmail(rst.getString(3));
            p.setTelefono(rst.getString(4));

            clientes.add(p);
        }

        rst.close();
        ps.close();
        conexion.close();

        rst = null;
        ps = null;
        conexion = null;
        return clientes;
    }

    public boolean eliminarCliente(String cedula) throws Exception {
        boolean rta = false;

        Conexion con = new Conexion();
        Connection conexion = con.conectar("ClienteDao.eliminarCliente()");

        String sql = "DELETE FROM cliente WHERE cedula = ?";

        PreparedStatement ps = conexion.prepareStatement(sql);

        ps.setString(1, cedula);

        ps.executeUpdate();
        rta = true;

        ps.close();
        conexion.close();

        ps = null;
        conexion = null;
        return rta;
    }
}
