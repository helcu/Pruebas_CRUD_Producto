/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upc.edu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.upc.edu.dao.ProductoDAO;
import com.upc.edu.helpers.MessageHelper;

/**
 *
 * @author NightmareTK
 */
@WebServlet(name = "ServletDeleteProducto", urlPatterns = {"/ServletDeleteProducto"})
public class ServletDeleteProducto extends HttpServlet {

  
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
    	
    	response.setHeader("X-Frame-Options", "DENY");
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Content-Type-Options", "nosniff");
        
    	if(request.getParameter("productoId") != null) {
    		ProductoDAO.getInstance()
    			.delete(Integer.parseInt(request.getParameter("productoId")));
    		
    		request.setAttribute("message", MessageHelper.messageDeleteProducto);    		
    	}    	

    	request.getRequestDispatcher(
                "ServletManageProductos").forward(request, response);
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
    	
        response.setHeader("X-Frame-Options", "DENY");
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Content-Type-Options", "nosniff");
        
    	if(request.getParameter("productoId") != null) {
    		ProductoDAO.getInstance()
    			.delete(Integer.parseInt(request.getParameter("productoId")));
    		
    		request.setAttribute("message", MessageHelper.messageDeleteProducto);  
    	}    	

    	request.getRequestDispatcher(
                "ServletManageProductos").forward(request, response);
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
