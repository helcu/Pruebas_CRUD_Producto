/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upc.edu.entity;

/**
 *
 * @author Usuario
 */
public class Producto {
    
    private int codigo;
    private String nombre;
    private String descripcion;
    private int categoria;
    private double precio;
    private boolean productoNacional;
    private boolean descontinuado;


    public Producto(final int codigo, final String nombre,
    		final String descripcion, final int categoria,
    		final double precio, final boolean productoNacional, 
    		final boolean descontinuado) {
    	
        this.codigo = codigo;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.categoria = categoria;
        this.precio = precio;
        this.productoNacional = productoNacional;
        this.descontinuado = descontinuado;
    }
    
    
    public final int getCodigo() {
        return codigo;
    }

    public final void setCodigo(final int codigo) {
        this.codigo = codigo;
    }

    public final String getNombre() {
        return nombre;
    }

    public final void setNombre(final String nombre) {
        this.nombre = nombre;
    }

    public final String getDescripcion() {
        return descripcion;
    }

    public final void setDescripcion(final String descripcion) {
        this.descripcion = descripcion;
    }

    public final int getCategoria() {
        return categoria;
    }

    public final void setCategoria(final int categoria) {
        this.categoria = categoria;
    }

    public final double getPrecio() {
        return precio;
    }

    public final void setPrecio(final double precio) {
        this.precio = precio;
    }

    public final boolean isProductoNacional() {
        return productoNacional;
    }

    public final void setProductoNacional(final boolean productoNacional) {
        this.productoNacional = productoNacional;
    }

    public final boolean isDescontinuado() {
        return descontinuado;
    }

    public final void setDescontinuado(final boolean descontinuado) {
        this.descontinuado = descontinuado;
    }
    
    
    
}
