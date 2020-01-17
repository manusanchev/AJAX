/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Alumno_2DAW
 */
public class BD {
    private  String driver = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/usuarios";
    private Connection conn = null;
    private ResultSet rs = null;
    
    public BD() throws ClassNotFoundException, SQLException{
        Class.forName(driver);
        conn = DriverManager.getConnection(url,"root","");
    }
    
    public boolean comprobarUsuario(String usuario) throws SQLException{
        String sql = "Select usuario from usuarios where usuario like '"+usuario+"'";
        Statement st = conn.createStatement();
        rs = st.executeQuery(sql);
       
        return (rs.first()) ? true : false;
    }
}
