<%-- 
    Document   : guardar
    Created on : 12-10-2018, 20:58:50
    Author     : rockn
--%>

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
            HttpSession misesion = request.getSession(true);

                String usuarioSesion = (String) misesion.getAttribute("username");
if(usuarioSesion==null){
            out.print("Acceso Denegado");
            }else{
                out.print(usuarioSesion);
                out.print("<a href=\".\\cerrar.jsp\"> Cerrar sesión</a>");
            String id = request.getParameter("id");
            String user = request.getParameter("txtUsuario");
            String pass = request.getParameter("txtPassword");
            String nom = request.getParameter("txtNombre");
            String ape = request.getParameter("txtApellidos");
            String dir = request.getParameter("txtDireccion");
            String email = request.getParameter("txtEmail");
            String sexo = request.getParameter("sexo");
            
            
            

            if (user.equals("") && pass.equals("") && nom.equals("") && ape.equals("") && dir.equals("") && email.equals("")) {
                out.print("No pueden quedar espacios en blancos");
            } else {
                cn.EditarUsuario(id,user, pass, nom,ape, dir, email);
                out.print("se cambio los datos");
                response.sendRedirect("listausuario.jsp");
                
            }}
        %>
    </body>
</html>
