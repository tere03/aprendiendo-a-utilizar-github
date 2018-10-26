<%-- 
    Document   : registro
    Created on : 09-oct-2018, 15:07:11
    Author     : Verónica Escobar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="estilos.css"/>

        <title>Registro</title>
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
                                <div class="col-xs-6">
                                    <a href="#" id="register-form-link">Register</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">

                                    <form id="register-form" action="Respuesta2.jsp" method="post" role="form" style="display: block;">
                                        <div class="form-group">
                                            <input type="text" name="txtUsername" id="Username" tabindex="1" class="form-control" placeholder="Username" value="" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="txtPassword" id="Password" tabindex="2" class="form-control" placeholder="Password" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="txtRepPassword" id="RepPassword" tabindex="2" class="form-control" placeholder="Repetir Password" required="">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="txtNombre" id="Nombre" tabindex="2" class="form-control" placeholder="Nombres" required="">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="txtApellidos" id="Apellidos" tabindex="2" class="form-control" placeholder="Apellidos" required="">
                                        </div>
                                        <div class="form-group">
                                            <h4> Ingrese Sexo</h4>
                                            <input name="Sexo" type="radio" value="Femenino" required/>Femenino

                                            <br />

                                            <input name="Sexo" type="radio" value="Masculino" required/>Masculino

                                            <br />

                                            <input name="Sexo" type="radio" value="Otro" checked="checked" required/>Otro
                                        </div>

                                        <div class="form-group">
                                            <input type="text" name="txtDireccion" id="Direccion" tabindex="2" class="form-control" placeholder="Direccion">
                                        </div>
                                        <div class="form-group">
                                            <input type="email" name="txtEmail" id="Email" tabindex="1" class="form-control" placeholder="Email Address" value="" required>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
                                                </div>
                                            </div>
                                        </div>

                                    </form> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
