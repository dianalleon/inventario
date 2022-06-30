/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistemainventarios.capadatos.entidades;

import java.io.Serializable;
import java.util.Objects;

/**
 *
 * @author Usuario
 */
public class Producto implements Serializable {

    private String idProducto;
    private String nombre;
    private int precio;
    private int cantidad;
    private int iva;
    private int retencion;
    private int cantidadMinima;
    private Categoria idCat;

    public Producto() {
        //super();
    this.idProducto="";
    this.nombre="";
    this.precio=0;
    this.cantidad=0;
    this.iva=0;
    this.retencion=0;
    this.cantidadMinima=0;
    this.idCat = new Categoria();
}

public Producto(String idProducto, String nombre, int precio, int cantidad, int iva, int retencion, int cantidadMinima, Categoria idCat ) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.precio = precio;
        this.cantidad = cantidad;
        this.iva = iva;
        this.retencion = retencion;
        this.cantidadMinima = cantidadMinima;
        this.idCat = idCat;
    }

    public String getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(String idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getIva() {
        return iva;
    }

    public void setIva(int iva) {
        this.iva = iva;
    }

    public int getRetencion() {
        return retencion;
    }

    public void setRetencion(int retencion) {
        this.retencion = retencion;
    }

    public int getCantidadMinima() {
        return cantidadMinima;
    }

    public void setCantidadMinima(int cantidadMinima) {
        this.cantidadMinima = cantidadMinima;
    }

    public Categoria getIdCat() {
        return idCat;
    }

    public void setIdCat(Categoria idCat) {
        this.idCat = idCat;
    }

    @Override
public int hashCode() {
        int hash = 7;
        hash = 97 * hash + Objects.hashCode(this.idProducto);
        hash = 97 * hash + Objects.hashCode(this.nombre);
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
        final Producto other = (Producto) obj;
        if (!Objects.equals(this.idProducto, other.idProducto)) {
            return false;
        }
        return Objects.equals(this.nombre, other.nombre);
    }

    @Override
    public String toString() {
        return "Producto{" + "idProducto=" + idProducto + ", nombre=" + nombre + ", precio=" + precio + ", cantidad=" + cantidad + ", iva=" + iva + ", retencion=" + retencion + ", cantidadMinima=" + cantidadMinima + ", idCat=" + idCat + '}';
    }


}
