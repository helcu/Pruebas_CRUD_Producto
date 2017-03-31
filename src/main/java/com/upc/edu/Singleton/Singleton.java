/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upc.edu.Singleton;

import com.upc.edu.entity.Producto;
import java.util.List;


public class Singleton {
    
    private List<Producto> list;
    private static Singleton instance = null;
    
    public Singleton(){
        
    Producto cafe = new Producto();
    cafe.setCodigo(1234);
    cafe.setCategoria(987);
    cafe.setDescontinuado(false);
    cafe.setDescripcion("cafe cargado puro");
    cafe.setNombre("cafe altomayo");
    cafe.setPrecio(5.50);
    cafe.setProductoNacional(true);
    
    list.add(cafe);
    
    
    }
    
    public static Singleton getSingleton(){
       if(instance == null){ 
           instance = new Singleton();
           
       }
       
       return instance;
        
    }
    
    

}
