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
        <style>
            @import url(https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic);
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                -webkit-font-smoothing: antialiased;
                -moz-font-smoothing: antialiased;
                -o-font-smoothing: antialiased;
                font-smoothing: antialiased;
                text-rendering: optimizeLegibility;
            }

            body {
                font-family: "Roboto", Helvetica, Arial, sans-serif;
                font-weight: 100;
                font-size: 12px;
                line-height: 30px;
                color: #777;
                background: #4CAF50;
            }

            .container {
                max-width: 400px;
                width: 100%;
                margin: 0 auto;
                position: relative;
            }

            #contact input[type="text"],
            #contact input[type="email"],
            #contact input[type="tel"],
            #contact input[type="url"],
            #contact textarea,
            #contact button[type="submit"] {
                font: 400 12px/16px "Roboto", Helvetica, Arial, sans-serif;
            }

            #contact {
                background: #F9F9F9;
                padding: 25px;
                margin: 150px 0;
                box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            }

            #contact h3 {
                display: block;
                font-size: 30px;
                font-weight: 300;
                margin-bottom: 10px;
            }

            #contact h4 {
                margin: 5px 0 15px;
                display: block;
                font-size: 13px;
                font-weight: 400;
            }

            fieldset {
                border: medium none !important;
                margin: 0 0 10px;
                min-width: 100%;
                padding: 0;
                width: 100%;
            }

            #contact input[type="text"],
            #contact input[type="email"],
            #contact input[type="tel"],
            #contact input[type="url"],
            #contact textarea {
                width: 100%;
                border: 1px solid #ccc;
                background: #FFF;
                margin: 0 0 5px;
                padding: 10px;
            }

            #contact input[type="text"]:hover,
            #contact input[type="email"]:hover,
            #contact input[type="tel"]:hover,
            #contact input[type="url"]:hover,
            #contact textarea:hover {
                -webkit-transition: border-color 0.3s ease-in-out;
                -moz-transition: border-color 0.3s ease-in-out;
                transition: border-color 0.3s ease-in-out;
                border: 1px solid #aaa;
            }

            #contact textarea {
                height: 100px;
                max-width: 100%;
                resize: none;
            }

            #contact button[type="submit"] {
                cursor: pointer;
                width: 100%;
                border: none;
                background: #4CAF50;
                color: #FFF;
                margin: 0 0 5px;
                padding: 10px;
                font-size: 15px;
            }

            #contact button[type="submit"]:hover {
                background: #43A047;
                -webkit-transition: background 0.3s ease-in-out;
                -moz-transition: background 0.3s ease-in-out;
                transition: background-color 0.3s ease-in-out;
            }

            #contact button[type="submit"]:active {
                box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.5);
            }

            .copyright {
                text-align: center;
            }

            #contact input:focus,
            #contact textarea:focus {
                outline: 0;
                border: 1px solid #aaa;
            }

            ::-webkit-input-placeholder {
                color: #888;
            }

            :-moz-placeholder {
                color: #888;
            }

            ::-moz-placeholder {
                color: #888;
            }

            :-ms-input-placeholder {
                color: #888;
            }

            textarea {vertical-align:auto}​
        </style>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    </head>
    <body>
        <% Producto product = (Producto) request.getAttribute("producto");%>
        <div class="container">  
            <form id="contact" action="" method="post">
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
                           oninvalid="this.setCustomValidity('Este campo es obligatorio')"
                           oninput="this.setCustomValidity('')">
                </fieldset>
                <fieldset>
                    <textarea id="desc" name="desc" placeholder="Descripcion" type="text" 
                              required = "required" oninvalid="this.setCustomValidity('Este campo es obligatorio')"
                              oninput="this.setCustomValidity('')"><%=product == null ? "" : product.getDescripcion()%></textarea>
                </fieldset>
                <fieldset>
                    <label>Categoria: </label>
                    <select name="categoria" class="form-control">
                        <option value="1">café</option>
                        <option value="2">batería</option>
                        <option value="3">gaseosa</option>
                        <option value="4">USB</option>
                        <option value="5">celular</option>
                    </select>
                </fieldset>
                <fieldset>
                    <label>Precio: </label>
                    <input value="<%=product == null ? "" : product.getPrecio()%>" 
                           id="precio" name="precio" placeholder="Precio"
                           type="number" step="0.01" class="form-control"
                           required = "required" oninvalid="this.setCustomValidity('Este campo es obligatorio')"
                           oninput="this.setCustomValidity('')">
                </fieldset>
                <fieldset>
                    <% if (product != null) {%>
                    <input checked="<%=product.isProductoNacional()%>"
                           type="radio" name="isNacional" required="required"
                           oninvalid="this.setCustomValidity('Este campo es obligatorio')"
                           oninput="this.setCustomValidity('')"
                           value="<%=product.isProductoNacional()%>"> Nacional<br>
                    <input checked="<%=!product.isProductoNacional()%>"
                           type="radio" name="isNacional" 
                           value="<%=!product.isProductoNacional()%>"> No nacional<br>
                    <%} else {%>
                    <input type="radio" name="isNacional" value="True" required="required"> Nacional<br>
                    <input type="radio" name="isNacional" value="False"> No nacional<br>
                    <%}%>
                </fieldset>
                <fieldset>
                    <% if (product != null) {%>
                    <input checked="<%=product.isDescontinuado()%>"
                           type="checkbox" name="isDescontinuado" value="descontinuado"> Descontinuado<br>
                    <%} else {%>
                    <input type="checkbox" name="isDescontinuado" value="descontinuado"> Descontinuado<br>
                    <%}%>
                </fieldset>

                <fieldset>
                    <button id="aceptar" name="aceptar" type="submit" class="btn btn-success btn-block"
                            data-toggle="modal" data-target="#ModalGuardar">
                        Guardar
                    </button>
                    <a class="btn btn-danger btn-block" data-toggle="modal" data-target="#ModalCancelar"
                       type="button">Cancelar</a>

                    
                    <!--<div class="modal fade" id="ModalGuardar" role="dialog">
                        <div class="modal-dialog">
                            
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Confimación</h4>
                                </div>
                                <div class="modal-body">
                                    <p>¿Estás seguro de <%= product != null ? "editar el " : "agregar el nuevo "%>producto?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary btn-block">Sí</button>
                                    <button type="button" class="btn btn-default btn-block" data-dismiss="modal">No</button>
                                </div>
                            </div>
                        </div>
                    </div>-->
                    
                    <div class="modal fade" id="ModalCancelar" role="dialog">
                        <div class="modal-dialog">
                            
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Confimación</h4>
                                </div>
                                <div class="modal-body">
                                    <p>¿Estás seguro de cancelar la operación?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary btn-block">Sí</button>
                                    <button type="button" class="btn btn-default btn-block" data-dismiss="modal">No</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </fieldset>
                <p class="copyright">Designed by <a target="_blank" title="Colorlib">Luminous</a></p>
            </form>
        </div>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>