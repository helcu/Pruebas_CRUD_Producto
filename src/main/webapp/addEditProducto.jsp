<%-- 
    Document   : addEditProducto
    Created on : 03-abr-2017, 19:02:37
    Author     : NightmareTK
--%>

<%@page import="com.upc.edu.helpers.MessageHelper"%>
<%@page import="com.upc.edu.entity.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/addEditProducto.css">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    </head>
    <body>
        <% Producto product = (Producto) request.getAttribute("producto");%>
        <div class="container">  
            <form id="contact" action="ServletAddEditProducto" method="POST">
                <input type="hidden" value="" name="id"/> 
                <h3><%= product != null ? "Editar" : "Agregar"%> producto</h3>
                <fieldset>
                    <input  value="<%=product == null ? "" : product.getCodigo()%>"
                            readonly id="codigo" name="codigo" 
                            type="text" placeholder="-ID autogenerado-">
                </fieldset>
                <fieldset>
                    <input placeholder="Nombre"value="<%=product == null ? "" : product.getNombre()%>" 
                           id="nombre" name="nombre" type="text" 
                           required = "required" 
                           oninvalid="this.setCustomValidity('<%= MessageHelper.messageCampoObligatorio %>')"
                           oninput="this.setCustomValidity('')">
                </fieldset>
                <fieldset>
                    <textarea id="desc" name="desc" placeholder="Descripcion" 
                              required = "required" oninvalid="this.setCustomValidity('<%= MessageHelper.messageCampoObligatorio %>')"
                              oninput="this.setCustomValidity('')"><%=product == null ? "" : product.getDescripcion()%></textarea>
                </fieldset>
                <fieldset>
                    <label>Categoria: </label>
                    <select id="catego" name="catego" class="form-control">
                        <option value="1" <%=product==null ? "" : product.getCategoria()==1 ? "selected" : ""%>>café</option>
                        <option value="2" <%=product==null ? "" : product.getCategoria()==2 ? "selected" : ""%>>batería</option>
                        <option value="3" <%=product==null ? "" : product.getCategoria()==3 ? "selected" : ""%>>gaseosa</option>
                        <option value="4" <%=product==null ? "" : product.getCategoria()==4 ? "selected" : ""%>>USB</option>
                        <option value="5" <%=product==null ? "" : product.getCategoria()==5 ? "selected" : ""%>>celular</option>
                    </select>
                </fieldset>
                <fieldset>
                    <label>Precio: </label>
                    <input value="<%=product == null ? "" : product.getPrecio()%>" class="form-control"
                           id="precio" name="precio" placeholder="Precio"
                           type="text"class="form-control" value="1,3"
                           required = "required" oninvalid="this.setCustomValidity('<%= MessageHelper.messageCampoObligatorio %>')"
                           oninput="this.setCustomValidity('')">
                </fieldset>
                <fieldset>
                    <% if (product != null) {%>
                    <input <%=product.isProductoNacional()?"checked":""%>
                           type="radio" name="nacional" required="required" id="nacional" name="nacional"
                           oninvalid="this.setCustomValidity('<%= MessageHelper.messageCampoObligatorio %>')"
                           oninput="this.setCustomValidity('')" value="True"> Nacional<br>
                    <input <%=!product.isProductoNacional()?"checked":""%>
                           type="radio" name="nacional" id="nacional" value="False"> No nacional<br>
                    <%} else {%>
                    <input type="radio" id="nacional" name="nacional" required="required"
                    		checked="checked" value="True"> Nacional<br>
                    <input type="radio" id="nacional" name="nacional"
                    		value="False"> No nacional<br>
                    <%}%>
                </fieldset>
                <fieldset>
                    <% if (product != null) {%>
                    <input <%=product.isDescontinuado()?"checked":""%> 
                    		id="descontinuado" type="checkbox" name="descontinuado"
                    		 value="True"> Descontinuado<br>
                    <%} else {%>
                    <input id="descontinuado" type="checkbox" name="descontinuado" 
                    		value="True"> Descontinuado<br>
                    <%}%>
                </fieldset>

                <fieldset>
                    <button id="aceptar" name="aceptar" type="button" class="btn btn-success btn-block" 
                    	data-toggle="modal" data-target="#ModalGuardar"> Guardar </button>
                    <a class="btn btn-danger btn-block listId" data-toggle="modal" data-target="#ModalCancelar"
                       type="button">Cancelar</a>
                    
                    <div class="modal fade" id="ModalGuardar" role="dialog">
                        <div class="modal-dialog">
                            
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Confimación</h4>
                                </div>
                                <div class="modal-body">
                                    <p> <%= product != null ? MessageHelper.messageConfEditProducto :
                                    	MessageHelper.messageConfAddProducto %></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary btn-block" id="btnYes">Sí</button>
                                    <button type="button" class="btn btn-default btn-block" data-dismiss="modal">No</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </fieldset>
                <p class="copyright">Designed by <a target="_blank" title="Colorlib">Luminous</a></p>
            </form>
        </div>
        
        
        <div class="modal fade" id="ModalCancelar" role="dialog">
	        <div class="modal-dialog">	
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal">&times;</button>
	                    <h4 style="color:black;" class="modal-title">Confimación</h4>
	                </div>
	                <div class="modal-body">
	                    <p style="color:black;"><%= MessageHelper.messageConfCancelarOperacion %></p>
	                </div>
	                <div class="modal-footer">
	                    <a id="DeleteYesButton" href="ServletManageProductos" class="btn btn-primary btn-block">Sí</a>
	                    <button type="button" class="btn btn-default btn-block" data-dismiss="modal">No</button>
	                </div>
	            </div>
	        </div>
	    </div>
        

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>