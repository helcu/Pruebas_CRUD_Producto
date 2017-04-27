/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upc.edu.dao;

import com.upc.edu.entity.Producto;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {

    private final List<Producto> productos;
    private static ProductoDAO instance;
    int codigo;

    public ProductoDAO() {
    	codigo = 1;
        productos = new ArrayList<>();
        add(new Producto(codigo, "cafe Altomayo", "cafe cargado puro", 1, 5.50, true, false));
        add(new Producto(codigo, "cafe Nescafé", "cafe cargado puro", 1, 4.50, false, true));
        add(new Producto(codigo, "USB Kingstone", "8 GB de almacenamiento", 4, 55.40, false, false));
        add(new Producto(codigo, "USB Kingsnote", "16 GB de almacenamiento", 4, 105.00, false, true));
    }

    public static ProductoDAO getInstance() {
        if (instance == null) {
            instance = new ProductoDAO();
        }
        return instance;
    }

    public List<Producto> getProductos() {
        return productos;
    }

    public void add(final Producto producto) {
    	producto.setCodigo(codigo);
        productos.add(producto);
        codigo++;
    }

    public Producto getByCodigo(final int id) {        
    	for (final Producto producto : productos) {
            if (producto.getCodigo() == id) {
                return producto;
            }
        }
        return null;
    }

    public void update(final Producto producto) {
        final Producto productoOriginal = getByCodigo(producto.getCodigo());
        productoOriginal.setNombre(producto.getNombre());
        productoOriginal.setDescripcion(producto.getDescripcion());
        productoOriginal.setCategoria(producto.getCategoria());
        productoOriginal.setPrecio(producto.getPrecio());
        productoOriginal.setProductoNacional(producto.isProductoNacional());
        productoOriginal.setDescontinuado(producto.isDescontinuado());
    }

    public void delete(final int id) {
        productos.remove(getByCodigo(id));
    }
    
    
    public List<Producto> getProductosByInfo(final String productoInfo) {
    	
    	final List<Producto> productosInfo = new ArrayList<>();
        
        for (final Producto producto : productos) {
            if (producto.getNombre().contains(productoInfo)
                    || producto.getDescripcion().contains(productoInfo)) {
                productosInfo.add(producto);
            }
        }
        
        return productosInfo;
    }

}
