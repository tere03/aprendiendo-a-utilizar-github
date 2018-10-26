<%-- 
    Document   : Respuesta2
    Created on : 11-10-2018, 0:19:27
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
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="estilos.css"/>
        <title>Respuesta</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-6">
                                    <a href="index.jsp" class="active" id="login-form-link">Volver</a>
                                </div>

                            </div>
                            <hr>
                            <%
                                conexion cn = new conexion();
                                ArrayList<usuario> u = cn.VerificarUsuario2();
                                String user = request.getParameter("txtUsername");
                                String pass = request.getParameter("txtPassword");
                                String pass2 = request.getParameter("txtRepPassword");
                                String nom = request.getParameter("txtNombre");
                                String ape = request.getParameter("txtApellidos");
                                String sexo = request.getParameter("Sexo");
                                String dir = request.getParameter("txtDireccion");
                                String email = request.getParameter("txtEmail");
                                boolean estado = false;
                                try {
                                    if (pass.equals(pass2)) {

                                        for (int i = 0; i < u.size(); i++) {
                                            if (user.equals(u.get(i).getUser()) || email.equals(u.get(i).getEmail())) {
                                                estado = true;
                                            }

                                        }
                                        if (estado == true) {
                                            out.print("<h1>Usuario o Email ya existe..</h1>");
                                        } else {
                                            cn.GuardarUsuario(user, pass, nom, ape, sexo, dir, email);
                                            out.print("<h1>Registro Exitoso</h1>");
                                        }
                                    } else {
                                        out.print("<h1>Contraseña deben ser iguales</h1>");
                                    }

                                } catch (Exception ex) {
                                    out.print("error " + ex);
                                }


                            %>
                        </div>

                    </div>
                </div>
            </div>

    </body>
</html>
