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
public class Venta implements Serializable {

    private String idVenta;
    private String idCliente;
    private String idEmpleado;
    private int total;
    private int impuesto;
    private String fecha;
    private String lista;

    public Venta() {
        //super();
    this.idVenta = "";
    this.idCliente = "";
    this.idEmpleado = "";
    this.total = 0;
    this.impuesto = 0;
    this.fecha = "";
    this.lista = "";
}

public Venta(String idVenta, String idCliente, String idEmpleado, int total, String fecha, String lista) {
     this.idVenta = idVenta;
    this.idCliente = idCliente;
    this.idEmpleado = idEmpleado;
    this.total = total;
    this.impuesto = 0;
    this.fecha = fecha;
    this.lista = lista;
    }

    public String getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(String idVenta) {
        this.idVenta = idVenta;
    }

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
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

    public int getImpuesto() {
        return impuesto;
    }

    public void setImpuesto(int impuesto) {
        this.impuesto = impuesto;
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
        final Venta other = (Venta) obj;
        if (!Objects.equals(this.idVenta, other.idVenta)) {
            return false;
        }
        return Objects.equals(this.idCliente, other.idCliente);
    }

    
    
    @Override
    public String toString() {
        return "Venta{" + "idVenta=" + idVenta + ", idCliente=" + idCliente + ", idEmpleado=" + idEmpleado + ", total=" + total + ", impuesto=" + impuesto + ", fecha=" + fecha + ", lista=" + lista + '}';
    }

   
}
