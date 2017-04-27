/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upc.edu.singleton;

import com.upc.edu.entity.Producto;
import java.util.ArrayList;
import java.util.List;

public class Singleton {

    private final List<Producto> list;
    private static Singleton instance;
    int codigo;

    public Singleton() {
    	codigo = 0;
        list = new ArrayList<>();
        agregarProducto(new Producto(codigo, "cafe Altomayo", "cafe cargado puro", 1, 5.50, true, false));
        agregarProducto(new Producto(codigo, "cafe Nescafé", "cafe cargado puro", 1, 4.50, false, true));
        agregarProducto(new Producto(codigo, "USB Kingstone", "8 GB de almacenamiento", 4, 55.40, false, false));
        agregarProducto(new Producto(codigo, "USB Kingsnote", "16 GB de almacenamiento", 4, 105.00, false, true));        
    }

    public static Singleton getSingleton() {
        if (instance == null) {
            instance = new Singleton();
        }
        return instance;
    }

    public List<Producto> getList() {
        return list;
    }

    public int getCodigo() {
        return codigo;
    }

    public void agregarProducto(final Producto producto) {
        list.add(producto);
        codigo++;
    }

    public Producto getProductoById(final int id) {        
    	for (final Producto producto : list) {
            if (producto.getCodigo() == id) {
                return producto;
            }
        }
        return null;
    }

    public void updateProducto(final Producto producto) {
        final Producto productoOriginal = list.get(producto.getCodigo());
        productoOriginal.setNombre(producto.getNombre());
        productoOriginal.setDescripcion(producto.getDescripcion());
        productoOriginal.setCategoria(producto.getCategoria());
        productoOriginal.setPrecio(producto.getPrecio());
        productoOriginal.setProductoNacional(producto.isProductoNacional());
        productoOriginal.setDescontinuado(producto.isDescontinuado());
    }

    public void deleteProducto(int id) {
        list.remove(getProductoById(id));
    }

}
