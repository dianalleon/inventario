/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.capadatos.entidades;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 *
 * @author Usuario
 */
public class Compra implements Serializable {

    private String idCompra;
    private String idProveedor;
    private String idEmpleado;
    private int total;
    private String fecha;
    private String lista;

    public Compra() {
        //super();
    this.idCompra = "";
    this.idProveedor = "";
    this.idEmpleado = "";
    this.total = 0;
    this.fecha = "";
    this.lista = "";
}

public Compra(String idCompra, String idProveedor, String idEmpleado, int total, String fecha, String lista) {
     this.idCompra = idCompra;
    this.idProveedor = idProveedor;
    this.idEmpleado = idEmpleado;
    this.total = total;
    this.fecha = fecha;
    this.lista = lista;
    }

    public String getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(String idCompra) {
        this.idCompra = idCompra;
    }

    public String getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(String idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(String idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getLista() {
        return lista;
    }

    public void setLista(String lista) {
        this.lista = lista;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Compra other = (Compra) obj;
        if (!Objects.equals(this.idCompra, other.idCompra)) {
            return false;
        }
        return Objects.equals(this.idProveedor, other.idProveedor);
    }

    
    
    @Override
    public String toString() {
        return "Compra{" + "idCompra=" + idCompra + ", idProveedor=" + idProveedor + ", idEmpleado=" + idEmpleado + ", total=" + total + ", fecha=" + fecha + ", lista=" + lista + '}';
    }

   
}
