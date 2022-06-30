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
public class Proveedor implements Serializable{
    private String idProveedor;
    private String nombre;
    private String email;
    private String telefono;
    
    public Proveedor(){
        super();
    }
    
    public Proveedor(String idProveedor, String nombre, String email, String telefono) {
        this.idProveedor = idProveedor;
        this.nombre = nombre;
        this.email = email;
        this.telefono = telefono;
    }

    public String getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(String idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
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
        final Proveedor other = (Proveedor) obj;
        if (!Objects.equals(this.idProveedor, other.idProveedor)) {
            return false;
        }
        return Objects.equals(this.nombre, other.nombre);
    }


    
    
}
