/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author rockn
 */
public class conexion {

    private static Connection cnx = null;

    public static Connection obtener() throws ClassNotFoundException, SQLException {
        if (cnx == null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");//(Services-Nueva conexion-Mysql Driver)click derecho en la conexion de mysql-> propiedades -> Driver class
                cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/epe1", "root", "root"); //si sale error, agregar (Connection)

            } catch (SQLException ex) {
                throw new SQLException(ex);
            } catch (ClassNotFoundException ex) {
                throw new ClassCastException(ex.getMessage());
            }
        }

        return cnx;
    }

    public static void cerrar() throws SQLException {

        if (cnx != null) {
            cnx.close();
        }
    }

    public void GuardarUsuario(String user, String pass, String nom, String ape, String sexo, String dir, String email) throws ClassNotFoundException, SQLException {
        obtener();
        String query = "INSERT INTO Usuario(usuario,password,nombres,apellidos,sexo,direccion,email) values('" + user + "','" + pass + "','" + nom + "','" + ape + "','" + sexo + "','" + dir + "','" + email + "')";
        Statement st = (Statement) obtener().createStatement();
        st.executeUpdate(query);
        cerrar();
    }

    public ResultSet verUsuario() throws ClassNotFoundException, SQLException {
        obtener();
        String query = "SELECT * FROM usuario";
        Statement st = (Statement) obtener().createStatement();
        ResultSet rs = st.executeQuery(query);

        return rs;

    }

    public ArrayList<usuario> VerificarUsuario2() throws ClassNotFoundException, SQLException {
        obtener();
        ArrayList<usuario> usuario = new ArrayList<>();
        String query = "SELECT * FROM Usuario";
        Statement st = (Statement) obtener().createStatement();
        ResultSet rs = st.executeQuery(query); //ejecuta query con retorno
        while (rs.next()) {
            usuario u = new usuario();
            u.setUser(rs.getString("usuario"));
            u.setEmail(rs.getString("email"));
            usuario.add(u);
        }
        cerrar();
        cnx = null;
        return usuario;
    }

    public ArrayList<usuario> Login() throws ClassNotFoundException, SQLException {
        boolean result = false;
        obtener();
        ArrayList<usuario> usuario = new ArrayList<>();
        String query = "SELECT * FROM usuario";
        Statement st = (Statement) obtener().createStatement();
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            usuario u = new usuario();
            u.setUser(rs.getString("usuario"));
            u.setEmail(rs.getString("password"));
            usuario.add(u);
        }
        cerrar();
        cnx = null;
        return usuario;

    }
    public boolean Verificarlogeo(String usuario, String pass) throws SQLException, ClassNotFoundException {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String query = "SELECT * FROM usuario WHERE usuario=? and password=?";
            pst = obtener().prepareStatement(query);
            pst.setString(1, usuario);
            pst.setString(2, pass);
            rs = pst.executeQuery();
            if (rs.absolute(1)) {
                return true;
            }
        } catch (SQLException ex) {
            throw new SQLException(ex);
        }
        return false;
    }
public ArrayList<usuario> verTipoUsuario() throws ClassNotFoundException, SQLException{
    ArrayList<usuario> tipos = new ArrayList<>();
        String Query="SELECT * FROM usuario";
    Statement st=(Statement) obtener().createStatement();
    ResultSet rs=st.executeQuery(Query);
    
        while (rs.next()) {
            usuario t = new usuario();
            t.setNom(rs.getString("usuario"));//nombre campo tabla SQL
            t.setApe(rs.getString("apellidos"));//nombre campo tabla SQL
            t.setDir(rs.getString("Direccion"));
             t.setPass(rs.getString("password"));
             t.setEmail(rs.getString("Email"));
              t.setUser(rs.getString("usuario"));
           
            t.setId(rs.getString("idUsuario"));
           
            tipos.add(t);
        }
        cerrar();
        cnx=null;
        return tipos;
    }
        public void EditarUsuario(String id,String usuario, String pass, String nom, String ape,String direccion, String email) throws ClassNotFoundException, SQLException {
        obtener();
            String query = "UPDATE usuario SET usuario='"+usuario+"' , password='"+pass+"', Nombres='"+nom+"', Apellidos='"+ape+"', Direccion='"+direccion+"', Email='"+email+"' WHERE idUsuario="+id+"";
        Statement st = (Statement) obtener().createStatement();
        st.executeUpdate(query);
        cerrar();
        cnx = null;
    }
}
