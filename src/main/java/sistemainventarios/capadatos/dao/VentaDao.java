/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.capadatos.dao;

import sistemainventarios.capadatos.dao.ClienteDao;
import sistemainventarios.capadatos.Conexion;
import sistemainventarios.capadatos.entidades.Venta;
import sistemainventarios.capadatos.entidades.Cliente;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class VentaDao {

    public boolean insertarVenta(Venta venta, String nuevo) throws Exception {
        boolean rta = false;

        Conexion con = new Conexion();
        Connection conexion = con.conectar("VentaDao.insertarVenta()");

        String sql = "";

        if (nuevo.equals("0")) {
            sql = "REPLACE INTO venta VALUES (?,?,?,?,?,?,?)";
        } else {
            sql = "INSERT INTO venta VALUES (?,?,?,?,?,?,?)";
        }

        //String sql = "INSERT INTO venta VALUES (?,?,?,?)";
        PreparedStatement ps = conexion.prepareStatement(sql);

        ps.setString(1, venta.getIdVenta());
        ps.setString(2, venta.getIdCliente());
        ps.setString(3, venta.getIdEmpleado());
        ps.setInt(4, venta.getTotal());
        ps.setInt(5, venta.getImpuesto());
        ps.setString(6, venta.getFecha());
        ps.setString(7, venta.getLista());

        ps.execute();
        rta = true;

        ps.close();
        conexion.close();

        ps = null;
        conexion = null;
        return rta;
    }

    public Venta buscarVenta(String idVenta) throws Exception {
        Venta p = new Venta();

        Conexion con = new Conexion();

        Connection conexion = con.conectar("VentaDao.buscarVenta()");

        String sql = "SELECT * FROM venta WHERE idVenta = ?";
        PreparedStatement ps = conexion.prepareStatement(sql);

        CategoriaDao cd = new CategoriaDao();

        ps.setString(1, idVenta);
        ResultSet rst = ps.executeQuery();
        if (rst.next()) {
            p.setIdVenta(rst.getString(1));
            p.setIdCliente(rst.getString(2));
            p.setIdEmpleado(rst.getString(3));
            p.setTotal(rst.getInt(4));
            p.setImpuesto(rst.getInt(5));
            p.setFecha(rst.getString(6));
            p.setLista(rst.getString(7));
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

    public List<Venta> buscarVentas() throws Exception {
        List<Venta> ventas = new ArrayList<>();

        Conexion con = new Conexion();
        Connection conexion = con.conectar("VentaDao.buscarVentas()");
        String sql = "SELECT * FROM venta ";
        PreparedStatement ps = conexion.prepareStatement(sql);

        CategoriaDao cd = new CategoriaDao();

        ResultSet rst = ps.executeQuery();
        while (rst.next()) {
            Venta p = new Venta();
            p.setIdVenta(rst.getString(1));
            p.setIdCliente(rst.getString(2));
            p.setIdEmpleado(rst.getString(3));
            p.setTotal(rst.getInt(4));
            p.setImpuesto(rst.getInt(5));
            p.setFecha(rst.getString(6));
            p.setLista(rst.getString(7));

            ventas.add(p);
        }

        rst.close();
        ps.close();
        conexion.close();

        rst = null;
        ps = null;
        conexion = null;
        return ventas;
    }

    public boolean eliminarVenta(String idVenta) throws Exception {
        boolean rta = false;

        Conexion con = new Conexion();
        Connection conexion = con.conectar("VentaDao.eliminarVenta()");

        String sql = "DELETE FROM venta WHERE idVenta = ?";

        PreparedStatement ps = conexion.prepareStatement(sql);

        ps.setString(1, idVenta);

        ps.executeUpdate();
        rta = true;

        ps.close();
        conexion.close();

        ps = null;
        conexion = null;
        return rta;
    }

    public List<Cliente> getCliente() throws Exception {
        List<Cliente> clientes = new ArrayList<Cliente>();

        Conexion conexion = new Conexion();
        Connection con = conexion.conectar("VentaDao.getCliente");
        String sql = "SELECT * FROM cliente "
                + "ORDER BY nombre";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rst = ps.executeQuery();

        while (rst.next()) {
            Cliente cliente = new Cliente();
            cliente.setCedula(rst.getString(1));
            cliente.setNombre((rst.getString(2)));

            clientes.add(cliente);
        }
        rst.close();
        rst = null;

        ps.close();
        ps = null;

        con.close();
        con = null;

        return clientes;
    }

}
