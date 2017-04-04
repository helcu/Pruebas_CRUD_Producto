<%-- 
    Document   : addEditProducto
    Created on : 03-abr-2017, 19:02:37
    Author     : NightmareTK
--%>

<%@page import="com.upc.edu.entity.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <% Producto product = (Producto) request.getAttribute("producto");%>

        <form action="#" id="form" class="form-horizontal">
            <input type="hidden" value="" name="id"/> 
            <div class="form-body">
                <div class="form-group">
                    <label class="control-label col-md-3">ID</label>
                    <div class="col-md-9">
                        <input value="<%=product == null ? "" : product.getCodigo()%>"
                               readonly id="codigo" name="codigo" 
                               class="form-control col-md-7 col-xs-12" type="text" 
                               maxlength="15" minlength="3" placeholder="ID">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Nombre</label>
                    <div class="col-md-9">
                        <input value="<%=product == null ? "" : product.getNombre()%>" 
                               id="nombre" name="nombre" class="form-control col-md-7 col-xs-12" type="text" 
                               required = "required" maxlength="100" minlength="10">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Descripción</label>
                    <div class="col-md-9">
                        <input value="<%=product == null ? "" : product.getDescripcion()%>" 
                               id="desc" name="desc" class="form-control col-md-7 col-xs-12" type="text" 
                               required = "required" maxlength="100" minlength="10">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Categoría</label>
                    <div class="col-md-9">
                        <select name="categoria" class="form-control">
                            <option value="1">café</option>
                            <option value="2">batería</option>
                            <option value="3">lapicero</option>
                            <option value="4">USB</option>
                            <option value="5">celular</option>
                        </select>
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Precio</label>
                    <div class="col-md-9">
                        <input value="<%=product == null ? "" : product.getPrecio()%>" 
                               id="precio" name="precio" class="form-control col-md-7 col-xs-12" type="number" 
                               required = "required" maxlength="10" minlength="2">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Es nacional</label>
                    <div class="col-md-9">

                        <% if (product != null) {%>

                        <input checked="<%=product.isProductoNacional() ? "true" : "false"%>"
                               type="radio" name="isNacional" value="nacional"> Nacional<br>
                        <input checked="<%=!product.isProductoNacional() ? "true" : "false"%>"
                               type="radio" name="isNacional" value="noNacional"> No nacional<br>
                        <%} else {%>
                        <input type="radio" name="isNacional" value="nacional"> Nacional<br>
                        <input type="radio" name="isNacional" value="noNacional"> No nacional<br>

                        <%}%>
                        <span class="help-block"></span>   
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Descontinuado</label>
                    <div class="col-md-9">
                        <% if (product != null) {%>
                        <input checked="<%=product.isDescontinuado() ? "true" : "false"%>"
                               type="checkbox" name="isDescontinuado" value="descontinuado"> Descontinuado<br>
                        <%} else {%>
                        <input type="checkbox" name="isDescontinuado" value="descontinuado"> Descontinuado<br>
                        <%}%>
                        <span class="help-block"></span>   
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-6 col-md-offset-3">
                        <button id="aceptar" name="aceptar" type="submit" class="btn btn-success">
                            <i class="fa fa-save"/> Procesar
                        </button>
                        <a class="btn btn-default" href="ServletListProduct"><i class="fa fa-close"></i> Cancelar</a>
                    </div>
                </div>	

            </div>
        </form>



    </body>
</html>
