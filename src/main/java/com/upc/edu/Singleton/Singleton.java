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

    public Singleton() {
        list = new ArrayList();
        agregarProducto(new Producto(list.size(), "cafe Altomayo", "cafe cargado puro", 1, 5.50, true, false));
        agregarProducto(new Producto(list.size(), "cafe Nescafé", "cafe cargado puro", 1, 4.50, false, true));

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

    public void agregarProducto(Producto producto) {
        list.add(producto);
    }
    
    public Producto getProductoById(int id) {
        return list.get(id);
    }    

}
