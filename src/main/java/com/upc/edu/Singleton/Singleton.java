/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upc.edu.Singleton;

import com.upc.edu.entity.Producto;
import java.util.ArrayList;
import java.util.List;

public class Singleton {

    private List<Producto> list;
    private static Singleton instance = null;
    int codigo = 0;

    public Singleton() {
        list = new ArrayList();
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

    public void agregarProducto(Producto producto) {
        list.add(producto);
        codigo++;
    }

    public Producto getProductoById(int id) {
        for (Producto p : list) {
            if (p.getCodigo() == id) {
                return p;
            }
        }
        return null;
    }

    public void updateProducto(Producto p) {
        Producto productoOriginal = list.get(p.getCodigo());
        productoOriginal.setNombre(p.getNombre());
        productoOriginal.setDescripcion(p.getDescripcion());
        productoOriginal.setCategoria(p.getCategoria());
        productoOriginal.setPrecio(p.getPrecio());
        productoOriginal.setProductoNacional(p.isProductoNacional());
        productoOriginal.setDescontinuado(p.isDescontinuado());
    }

    public void deleteProducto(int id) {
        list.remove(getProductoById(id));
    }

}
