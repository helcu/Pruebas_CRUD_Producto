<%-- 
    Document   : productList
    Created on : 31-mar-2017, 17:47:49
    Author     : NightmareTK
--%>

<%@page import="com.upc.edu.entity.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar Productos</title>
    </head>
    <body>
        <h1>Administar Productos</h1>
        
        <table>
            <tr>
                <%
                    ArrayList<Producto> productos = (ArrayList<Producto>) request.getAttribute("productos"); 
                        for (Producto item: productos) {
                %>
                    <tr>
                        <td><%=item.getCodigo()%></td>
                        <td><%=item.getNombre()%></td>
                        <td><%=item.getDescripcion()%></td>
                        <td><%=item.getCategoria()%></td>
                        <td><%=item.getPrecio()%></td>
                        <td><%=item.isProductoNacional()%></td>
                        <td><%=item.isDescontinuado()%></td>
                    </tr>
                <%}%>
            </tr>
        </table>
            
            
            
            
    </body>
</html>
