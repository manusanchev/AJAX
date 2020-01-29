/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Ciudad;
import modelo.Poblacion;


/**
 *
 * @author Alumno_2DAW
 */
public class BD {
     private  String driver = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/andalucia";
    private Connection conn = null;
    private ResultSet rs = null;
    
    public BD() throws ClassNotFoundException, SQLException{
        Class.forName(driver);
        conn =  DriverManager.getConnection(url,"root","");
    }
    
    public List<Ciudad> getCiudades() throws SQLException{
        List<Ciudad> ciudades = new ArrayList<Ciudad>();
        String sql = "SELECT codpro,nombre FROM `provincias`";
        Statement st = conn.createStatement();
        rs = st.executeQuery(sql);
        
        while(rs.next()){
            int id = rs.getInt(1);
            String nombre = rs.getString(2);
            Ciudad ciudad = new Ciudad(id, nombre);
            ciudades.add(ciudad);
        }
        
        return ciudades;
    }
     public List<Poblacion> getPoblacion(int id) throws SQLException{
        List<Poblacion> poblaciones = new ArrayList<Poblacion>();
        String sql = "SELECT cod,nombre FROM `municipios` where codprov ="+id;
        Statement st = conn.createStatement();
        rs = st.executeQuery(sql);
        
        while(rs.next()){
            int idCod = rs.getInt(1);
            String nombre = rs.getString(2);
            Poblacion poblacion = new Poblacion(idCod, nombre);
            poblaciones.add(poblacion);
        }
        
        return poblaciones;
    }
   
}
