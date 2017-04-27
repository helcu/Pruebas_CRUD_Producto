/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upc.edu.servlet;

import com.upc.edu.entity.Producto;
import com.upc.edu.singleton.Singleton;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author NightmareTK
 */
@WebServlet(name = "ServletAddEditProducto", urlPatterns = {"/ServletAddEditProducto"})
public class ServletAddEditProducto extends HttpServlet {

	
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
        final int productId = Integer.parseInt(request.getParameter("productId"));

        if (productId != -1) {
            //Edit product
            request.setAttribute("producto", Singleton.getSingleton().getProductoById(productId));
        }
        request.getRequestDispatcher("/addEditProducto.jsp").forward(request, response);
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


        String nombre;
        String descripcion;
        int categoria;
        double precio;
        boolean productoNacional;
        boolean descontinuado;

        
        nombre = request.getParameter("nombre");
        descripcion = request.getParameter("desc");
        categoria = Integer.parseInt(request.getParameter("categoria"));
        precio = Double.parseDouble(request.getParameter("precio"));
        productoNacional = Boolean.parseBoolean(request.getParameter("isNacional"));
        descontinuado = Boolean.parseBoolean(request.getParameter("isDescontinuado"));

        if (request.getParameter("codigo").isEmpty()) {
        	
        	//Add product                        
            Singleton.getSingleton()
                    .agregarProducto(
                    		new Producto(Singleton.getSingleton().getCodigo(),
                    				nombre,
                    				descripcion,
                    				categoria,
                    				precio,
                    				productoNacional,
                    				descontinuado));
        } else {
            
        	// Edit product            
            Singleton.getSingleton()
                    .updateProducto(
                    		new Producto(Integer.parseInt(request.getParameter("codigo")),
                    				nombre,
                    				descripcion,
                    				categoria,
                    				precio, 
                    				productoNacional,
                    				descontinuado));
        }

       
        request.getRequestDispatcher(
                "ServletAdministrarProductos").forward(request, response);

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
