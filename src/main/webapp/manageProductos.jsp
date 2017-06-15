<%@page import="com.upc.edu.helpers.MessageHelper"%>
<%@page import="com.upc.edu.entity.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FastShop - Administrar Productos</title>
        
        
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manageProductos.css">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    </head>
    <body>


        <section>

            <a class="btn btn-danger" href="ServletLogout">
                <i class="fa fa-info-circle"></i> Cerrar Sesión
            </a> 
            <!--for demo wrap-->
            <h1>Administrar Productos</h1>

            <div class="row" style="margin-bottom: 2%">
                <div class="col-lg-6">
                    <form action="ServletManageProductos" method="post">
                        <div class="input-group">
                            <input name="productInfo" type="text" class="form-control" placeholder="Buscar...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="submit">Filtrar</button>
                            </span>
                        </div><!-- /input-group -->
                    </form>
                </div><!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="input-group">
                        <span class="input-group-btn">
                            <a class="btn btn-success btn-xs" href="ServletAddEditProducto?productId=-1" id="btnNuevo">
                                <i class="fa fa-info-circle"></i> Nuevo
                            </a> 
                        </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
            </div><!-- /.row -->
            
            <% String message = (String) request.getAttribute("message"); %>
            
            <h3 id="message"> <%= message == null ? "" : message%></h3>

            <div class="tbl-header">
                <table cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Categoría</th>
                            <th>Precio</th>
                            <th>Producto Nacional</th>
                            <th>Descontinuado</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                </table>
            </div>
            <div class="tbl-content">
                <table cellpadding="0" cellspacing="0" >
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
                                <a id="btnEditar<%=item.getCodigo()%>"
                                	class="btn btn-link btn-xs" href="ServletAddEditProducto?productId=<%=item.getCodigo()%>">
                                    <i class="fa fa-info-circle"></i> Editar
                                </a> 
                                <a class="btn btn-link btn-xs listId" 
                                   data-toggle="modal" data-target="#ModalEliminar"
                                   data-id="<%=item.getCodigo()%>"
                                   type="button"> 
                                    <i class="fa fa-remove"></i> Eliminar
                                </a>                                
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </section>
        
        <div class="modal fade" id="ModalEliminar" role="dialog">
	        <div class="modal-dialog">
	
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal">&times;</button>
	                    <h4 style="color:black;" class="modal-title">Confimación</h4>
	                </div>
	                <div class="modal-body">
	                    <p style="color:black;"><%= MessageHelper.messageConfDeleteProducto %></p>
	                </div>
	                <div class="modal-footer">
	                    <a id="DeleteYesButton" href="#" class="btn btn-primary btn-block">Sí</a>
	                    <button type="button" class="btn btn-default btn-block" data-dismiss="modal">No</button>
	                </div>
	            </div>
	        </div>
	    </div>

		<script>
			$('.listId').click(function()
		    {
		        var id=$(this).attr('data-id');
		        var deleteYesButton = document.getElementById("DeleteYesButton");
		        deleteYesButton.href = "ServletDeleteProducto?productoId="+id;
		    });
		</script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>