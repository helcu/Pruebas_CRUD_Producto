/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upc.edu.servlet;

import com.upc.edu.business.ProductoBusiness;
import com.upc.edu.dao.ProductoDAO;
import com.upc.edu.entity.Producto;

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
    	    	
    	if(request.getParameter("productId") == null) {
    		request.getRequestDispatcher("/addEditProducto.jsp").forward(request, response);
    	}    	
    	
        final int productId = Integer.parseInt(request.getParameter("productId"));
                
        if (productId != -1) {
            //Edit product
        	ProductoBusiness productoBusiness = new ProductoBusiness();
        	request.setAttribute("producto", productoBusiness.getByCodigo(productId));
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
        
        if(request.getParameter("categoria") == null) {
    		request.getRequestDispatcher("ServletManageProductos").forward(request, response);
    	}    	
        categoria = Integer.parseInt(request.getParameter("categoria"));
        
        if(request.getParameter("precio") == null) {
    		request.getRequestDispatcher("ServletManageProductos").forward(request, response);
    	}    	
        precio = Double.parseDouble(request.getParameter("precio"));
        
        if(request.getParameter("isNacional") == null) {
    		request.getRequestDispatcher("ServletManageProductos").forward(request, response);
    	}    	
        productoNacional = Boolean.parseBoolean(request.getParameter("isNacional"));
                
        descontinuado = Boolean.parseBoolean(request.getParameter("isDescontinuado"));
        
        
        ProductoBusiness productoBusiness = new ProductoBusiness();
        
        if (request.getParameter("codigo").isEmpty()) {
        	
        	//Add product                        
            productoBusiness.add(
            		new Producto(
            				-1,
		    				nombre,
		    				descripcion,
		    				categoria,
		    				precio,
		    				productoNacional,
		    				descontinuado));
        } else {
            
        	// Edit product        
        	productoBusiness.update(
        			new Producto(
        					Integer.parseInt(request.getParameter("codigo")),
            				nombre,
            				descripcion,
            				categoria,
            				precio, 
            				productoNacional,
            				descontinuado));
        }
        
        request.getRequestDispatcher("ServletManageProductos").forward(request, response);
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
