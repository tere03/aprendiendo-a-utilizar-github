<%-- 
    Document   : logear.jsp
    Created on : 12-10-2018, 18:53:56
    Author     : rockn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clases.usuario"%>
<%@page import="clases.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            conexion cn = new conexion();

            String user = request.getParameter("txtUsername");
            String pass = request.getParameter("txtPassword");
    
             HttpSession misesion=request.getSession(true); //crea una sesion
                
            if (cn.Verificarlogeo(user, pass)) {
                misesion.setAttribute("username", user);
                String usuarioSesion = (String) misesion.getAttribute("username");

                out.print(usuarioSesion);
                out.print("<a href=\".\\cerrar.jsp\"> Cerrar sesión</a>");

                response.sendRedirect("listausuario.jsp");

            } else {
                response.sendRedirect("index.jsp");
            }


        %>
    </body>
</html>
