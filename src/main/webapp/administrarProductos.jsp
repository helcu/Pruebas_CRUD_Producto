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
        <style>
            h1{
                font-size: 30px;
                color: #fff;
                text-transform: uppercase;
                font-weight: 300;
                text-align: center;
                margin-bottom: 15px;
            }
            table{
                width:100%;
                table-layout: fixed;
            }
            .tbl-header{
                background-color: rgba(255,255,255,0.3);
            }
            .tbl-content{
                height:300px;
                overflow-x:auto;
                margin-top: 0px;
                border: 1px solid rgba(255,255,255,0.3);
            }
            th{
                padding: 20px 15px;
                text-align: left;
                font-weight: 500;
                font-size: 12px;
                color: #fff;
                text-transform: uppercase;
            }
            td{
                padding: 15px;
                text-align: left;
                vertical-align:middle;
                font-weight: 300;
                font-size: 12px;
                color: #fff;
                border-bottom: solid 1px rgba(255,255,255,0.1);
            }


            /* demo styles */


            body{
                background: -webkit-linear-gradient(left, #25c481, #25b7c4);
                background: linear-gradient(to right, #25c481, #25b7c4);
                font-family: 'Roboto', sans-serif;
            }
            section{
                margin: 50px;
            }


            /* follow me template */
            .made-with-love {
                margin-top: 40px;
                padding: 10px;
                clear: left;
                text-align: center;
                font-size: 10px;
                font-family: arial;
                color: #fff;
            }
            .made-with-love i {
                font-style: normal;
                color: #F50057;
                font-size: 14px;
                position: relative;
                top: 2px;
            }
            .made-with-love a {
                color: #fff;
                text-decoration: none;
            }
            .made-with-love a:hover {
                text-decoration: underline;
            }


            /* for custom scrollbar for webkit browser*/

            ::-webkit-scrollbar {
                width: 6px;
            } 
            ::-webkit-scrollbar-track {
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
            } 
            ::-webkit-scrollbar-thumb {
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
            }
        </style>
    </head>
    <body>


        <section>
            <!--for demo wrap-->
            <h1>Administar Productos - <%= request.getSession().getAttribute("currentUser")%></h1>

            <a class="btn btn-success btn-link btn-xs" href="ServletAddEditProducto?productId=-1">
                <i class="fa fa-info-circle"></i> Nuevo producto
            </a> 


            <div class="tbl-header">
                <table cellpadding="0" cellspacing="0" border="0">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Categoría</th>
                            <th>Precio</th>
                            <th>productoNacional</th>
                            <th>descontinuado</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                </table>
            </div>
            <div class="tbl-content">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tbody>
                        <%
                            ArrayList<Producto> productos = (ArrayList<Producto>) request.getAttribute("productos");
                            for (Producto item : productos) {
                        %>
                        <tr>
                            <td><%=item.getCodigo()%></td>
                            <td><%=item.getNombre()%></td>
                            <td><%=item.getDescripcion()%></td>
                            <td><%=item.getCategoria()%></td>
                            <td><%=item.getPrecio()%></td>
                            <td><%=item.isProductoNacional()%></td>
                            <td><%=item.isDescontinuado()%></td>
                            <td>
                                <a class="btn btn-link btn-xs" href="ServletAddEditProducto?productId=<%=item.getCodigo()%>">
                                    <i class="fa fa-info-circle"></i> Editar
                                </a> 
                                <a class="btn btn-link btn-xs" href="ServletDeleteProduct?productId=<%=item.getCodigo()%>"> 
                                    <i class="fa fa-remove"></i> Eliminar
                                </a>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </section>

                    
                    
                    
    </body>
</html>
