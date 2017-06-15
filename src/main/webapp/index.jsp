<%@page import="com.upc.edu.helpers.MessageHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html><!-- PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>FastShop</title>

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
       
    </head>
    <body>

        <% String message = (String) request.getAttribute("message"); %>
        <% String message2 = (String) request.getAttribute("message2");%>

        <div class="container">
            <h1>FastShop</h1>

            <div class="login-page">
                <div class="form">
                    <form class="login-form" method="POST" action="ServletLogin" autocomplete="off">
                        <p id="message"> <%= message == null ? "" : message%></p>
                        <input id="user" name="user" type="text" placeholder="Usuario"
                               required="required" autofocus="autofocus"
                               oninvalid="this.setCustomValidity('<%= MessageHelper.messageCampoObligatorio%>')"
                               oninput="this.setCustomValidity('')"/>
                        <p id="message2"> <%= message2 == null ? "" : message2%></p>
                        <input id="pass" name="pass"  type="password" placeholder="Contraseña"
                               required="required" 
                               oninvalid="this.setCustomValidity('<%= MessageHelper.messageCampoObligatorio%>')"
                               oninput="this.setCustomValidity('')" />
                        <button id="btnLogin">Iniciar sesión</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>