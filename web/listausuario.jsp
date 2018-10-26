<%-- 
    Document   : listausuario
    Created on : 11-10-2018, 0:47:41
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
            
            HttpSession misesion = request.getSession(true);

                String usuarioSesion = (String) misesion.getAttribute("username");
            if(usuarioSesion==null){
            out.print("Acceso Denegado");
            }else{
                out.print(usuarioSesion);
                out.print("<a href=\".\\cerrar.jsp\"> Cerrar sesión</a>");
            
            
            ArrayList<usuario> tipos = cn.verTipoUsuario();
            out.print("<a href='index.jsp'>Volver</a>");
            out.print("<table border='4px'>");
            out.print("<tr>");
            out.print("<td>");
            out.print("Usuario");
            out.print("</td>");
            out.print("<td>");
            out.print("Nombre");
            out.print("</td>");
            out.print("<td>");
            out.print("Apellido");
            out.print("</td>");
            out.print("<td>");
            out.print("Direccion");
            out.print("</td>");
            out.print("<td>");
            out.print("Email");
            out.print("</td>");
            ;
            out.print("<td>");
            out.print("Acciones");
            out.print("</td>");

            out.print("</tr>");
            for (int x = 0; x < tipos.size(); x++) {
                usuario t = tipos.get(x);

                out.print("<tr>");
                out.print("<td>");
                out.print(t.getUser());
                out.print("</td>");

                out.print("<td>");
                out.print(t.getNom());
                out.print("</td>");

                out.print("<td>");
                out.print(t.getApe());
                out.print("</td>");

                out.print("<td>");
                out.print(t.getDir());
                out.print("</td>");

                out.print("<td>");
                out.print(t.getEmail());
                out.print("</td>");

                out.print("<td>");
                out.print("<a href=\"editar.jsp?id=" + tipos.get(x).getId() + "\">Editar</a>");
                out.print("</td>");
                out.print("</tr>");
            }
            out.print("</table>");
}
        %>
    </body>
</html>
