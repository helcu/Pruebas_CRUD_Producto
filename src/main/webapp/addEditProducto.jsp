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
        </style>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    </head>
    <body>
        <% Producto product = (Producto) request.getAttribute("producto");%>
        <div class="container">  
            <form id="contact" action="" method="post">
                <input type="hidden" value="" name="id"/> 
                <h3>Colorlib Contact Form</h3>
                <h4>Contact us for custom quote</h4>
                <fieldset>
                    <input  value="<%=product == null ? "" : product.getCodigo()%>"
                            readonly id="codigo" name="codigo" 
                            type="text" 
                            maxlength="15" minlength="3" placeholder="ID">
                </fieldset>
                <fieldset>
                    <input placeholder="Nombre"value="<%=product == null ? "" : product.getNombre()%>" 
                           id="nombre" name="nombre" type="text" 
                           required = "required" maxlength="100" minlength="10">
                </fieldset>
                <fieldset>
                    <textarea value="<%=product == null ? "" : product.getDescripcion()%>" 
                              id="desc" name="desc" placeholder="Descripcion" type="text" 
                              required = "required" maxlength="100" minlength="10"></textarea>
                </fieldset>
                <fieldset>
                    <label>Categoria: </label>
                    <select name="categoria" class="form-control">
                        <option value="1">café</option>
                        <option value="2">batería</option>
                        <option value="3">lapicero</option>
                        <option value="4">USB</option>
                        <option value="5">celular</option>
                    </select>
                </fieldset>
                <fieldset>
                    <label>Precio: </label>
                    <input value="<%=product == null ? "" : product.getPrecio()%>" 
                           id="precio" name="precio" placeholder="Precio" type="number" step="0.01"
                           required = "required" maxlength="10" minlength="2">
                </fieldset>
                <fieldset>
                    <label>Precio: </label>
                    <% if (product != null) {%>

                    <input checked="<%=product.isProductoNacional() ? "true" : "false"%>"
                           type="radio" name="isNacional" value="nacional"> Nacional<br>
                    <input checked="<%=!product.isProductoNacional() ? "true" : "false"%>"
                           type="radio" name="isNacional" value="noNacional"> No nacional<br>
                    <%} else {%>
                    <input type="radio" name="isNacional" value="nacional"> Nacional<br>
                    <input type="radio" name="isNacional" value="noNacional"> No nacional<br>

                    <%}%>
                </fieldset>
                <fieldset>
                    <% if (product != null) {%>
                    <input checked="<%=product.isDescontinuado() ? "true" : "false"%>"
                           type="checkbox" name="isDescontinuado" value="descontinuado"> Descontinuado<br>
                    <%} else {%>
                    <input type="checkbox" name="isDescontinuado" value="descontinuado"> Descontinuado<br>
                    <%}%>
                </fieldset>

                <fieldset>

                    <button id="aceptar" name="aceptar" type="submit" class="btn btn-success">
                        <i class="fa fa-save"/> Aceptar
                    </button>
      
                    <button class="btn btn-danger btn-block" type="button" href="ServletLogin">
                        Cancelar
                    <%--<a class="btn btn-default" href="ServletLogin"><i class="fa fa-close"></i> Cancelar</a --%>
                     </button>
                    
                </fieldset>
                <p class="copyright">Designed by <a target="_blank" title="Colorlib">Luminous</a></p>
            </form>
        </div>
       
        
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>