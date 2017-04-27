/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upc.edu.servlet;

import com.upc.edu.entity.Producto;
import com.upc.edu.singleton.Singleton;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author NightmareTK
 */
@WebServlet(name = "ServletAdministrarProductos", urlPatterns = {"/ServletAdministrarProductos"})
public class ServletAdministrarProductos extends HttpServlet {

   
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        request.setAttribute("productos", Singleton.getSingleton().getList());
        request.getRequestDispatcher("/administrarProductos.jsp").forward(request, response);
    
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        final String productInfo = request.getParameter("productInfo");
       
        
        if(productInfo == null) {
            doGet(request, response);
        }
        
        final List<Producto> productos = Singleton.getSingleton().getList();
        final List<Producto> productosInfo = new ArrayList<>();
        
        for (final Producto producto : productos) {
            if (producto.getNombre().contains(productInfo)
                    || producto.getDescripcion().contains(productInfo)) {
                productosInfo.add(producto);
            }
        }
        
        request.setAttribute("productos", productosInfo);
        request.getRequestDispatcher("/administrarProductos.jsp").forward(request, response);        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
