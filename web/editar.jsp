<%-- 
    Document   : newjspeditar
    Created on : 11-10-2018, 0:48:30
    Author     : rockn
--%>

<%@page import="clases.usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>Function cambiado(){
            alert('Datos Cambiados Exitosamente');
        }</script>
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
            String id = request.getParameter("id");
            
            int a = Integer.parseInt(id)-1;
                        out.print("<a href='listausuario.jsp'>Volver</a>");
            out.print("<form action='guardar.jsp' method='post'> ");
            out.print("Usuario :<input type='text' value='"+tipos.get(a).getUser()+"'name='txtUsuario'><br/>");
            out.print("Nombre:<input type='text' value='"+tipos.get(a).getPass()+"'name='txtPassword'><br/>");
            out.print("Nombre:<input type='text' value='"+tipos.get(a).getNom()+"'name='txtNombre'><br/>");
            out.print("Apellidos:<input type='text' value='"+tipos.get(a).getApe()+"'name='txtApellidos'><br/>");
            out.print("Direccion:<input type='text' value='"+tipos.get(a).getDir()+"'name='txtDireccion'><br/>");
            out.print("eMail:<input type='text' value='"+tipos.get(a).getEmail()+"'name='txtEmail'><br/>");
            out.print("<input type=\"hidden\" value='"+a+"' name='id'>");
            out.print("<br/><input type=\"submit\" name=\"register-submit\"value=\"Guardar Los Cambios\">");
            out.print("</form>");
            
}
        %>

    </body>
</html>
