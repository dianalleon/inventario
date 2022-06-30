/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.capadatos.dao;

import sistemainventarios.capadatos.dao.ProveedorDao;
import sistemainventarios.capadatos.Conexion;
import sistemainventarios.capadatos.entidades.Compra;
import sistemainventarios.capadatos.entidades.Proveedor;
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
public class CompraDao {

    public boolean insertarCompra(Compra compra, String nuevo) throws Exception {
        boolean rta = false;

        Conexion con = new Conexion();
        Connection conexion = con.conectar("CompraDao.insertarCompra()");

        String sql = "";

        if (nuevo.equals("0")) {
            sql = "REPLACE INTO compra VALUES (?,?,?,?,?,?)";
        } else {
            sql = "INSERT INTO compra VALUES (?,?,?,?,?,?)";
        }

        //String sql = "INSERT INTO compra VALUES (?,?,?,?)";
        PreparedStatement ps = conexion.prepareStatement(sql);

        ps.setString(1, compra.getIdCompra());
        ps.setString(2, compra.getIdProveedor());
        ps.setString(3, compra.getIdEmpleado());
        ps.setInt(4, compra.getTotal());
        ps.setString(5, compra.getFecha());
        ps.setString(6, compra.getLista());

        ps.execute();
        rta = true;

        ps.close();
        conexion.close();

        ps = null;
        conexion = null;
        return rta;
    }

    public Compra buscarCompra(String idCompra) throws Exception {
        Compra p = new Compra();

        Conexion con = new Conexion();

        Connection conexion = con.conectar("CompraDao.buscarCompra()");

        String sql = "SELECT * FROM compra WHERE idCompra = ?";
        PreparedStatement ps = conexion.prepareStatement(sql);

        CategoriaDao cd = new CategoriaDao();

        ps.setString(1, idCompra);
        ResultSet rst = ps.executeQuery();
        if (rst.next()) {
            p.setIdCompra(rst.getString(1));
            p.setIdProveedor(rst.getString(2));
            p.setIdEmpleado(rst.getString(3));
            p.setTotal(rst.getInt(4));
            p.setFecha(rst.getString(5));
            p.setLista(rst.getString(6));
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

    public List<Compra> buscarCompras() throws Exception {
        List<Compra> compras = new ArrayList<>();

        Conexion con = new Conexion();
        Connection conexion = con.conectar("CompraDao.buscarCompras()");
        String sql = "SELECT * FROM compra ";
        PreparedStatement ps = conexion.prepareStatement(sql);

        CategoriaDao cd = new CategoriaDao();

        ResultSet rst = ps.executeQuery();
        while (rst.next()) {
            Compra p = new Compra();
            p.setIdCompra(rst.getString(1));
            p.setIdProveedor(rst.getString(2));
            p.setIdEmpleado(rst.getString(3));
            p.setTotal(rst.getInt(4));
            p.setFecha(rst.getString(5));
            p.setLista(rst.getString(6));

            compras.add(p);
        }

        rst.close();
        ps.close();
        conexion.close();

        rst = null;
        ps = null;
        conexion = null;
        return compras;
    }

    public boolean eliminarCompra(String idCompra) throws Exception {
        boolean rta = false;

        Conexion con = new Conexion();
        Connection conexion = con.conectar("CompraDao.eliminarCompra()");

        String sql = "DELETE FROM compra WHERE idCompra = ?";

        PreparedStatement ps = conexion.prepareStatement(sql);

        ps.setString(1, idCompra);

        ps.executeUpdate();
        rta = true;

        ps.close();
        conexion.close();

        ps = null;
        conexion = null;
        return rta;
    }

    public List<Proveedor> getProveedor() throws Exception {
        List<Proveedor> proveedores = new ArrayList<Proveedor>();

        Conexion conexion = new Conexion();
        Connection con = conexion.conectar("CompraDao.getProveedor");
        String sql = "SELECT * FROM proveedor "
                + "ORDER BY nombre";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rst = ps.executeQuery();

        while (rst.next()) {
            Proveedor proveedor = new Proveedor();
            proveedor.setIdProveedor(rst.getString(1));
            proveedor.setNombre((rst.getString(2)));

            proveedores.add(proveedor);
        }
        rst.close();
        rst = null;

        ps.close();
        ps = null;

        con.close();
        con = null;

        return proveedores;
    }

}
