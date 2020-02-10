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
import modelo.Libro;

/**
 *
 * @author Alumno_2DAW
 */
public class BD {
    private  String driver = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/books";
    private Connection conn = null;
    private ResultSet rs = null;
    
    public BD() throws ClassNotFoundException, SQLException{
        Class.forName(driver);
        conn = DriverManager.getConnection(url,"root","");
    }
    public List<String> getTituloLibros(String libro) throws SQLException{
        List<String> libros = new ArrayList<String>();
        String sql = "select distinct(Titulo) from titulos where Titulo like '"+libro+"%'";
        Statement st = conn.createStatement();
        rs = st.executeQuery(sql);
        while(rs.next()){
            String titulo = rs.getString(1);
            libros.add(titulo);
        }
        return libros;
        
    }
    public List<Libro> getLibros(String libro) throws SQLException{
         List<Libro> libros = new ArrayList<Libro>();
        String sql = "SELECT titulos.ISBN,titulos.Titulo,autor.Nombre,titulos.Descripcion,editorial.NameEditorial FROM `titulos` INNER JOIN autor INNER JOIN editorial on titulos.IDautor = autor.IDAutor and titulos.IDeditorial = editorial.IDEditorial where titulos.Titulo like '"+libro+"'";
        Statement st = conn.createStatement();
        rs = st.executeQuery(sql);
        while(rs.next()){
            String isbn = rs.getString(1);
            String titulo = rs.getString(2);
            String autor = rs.getString(3);
            String descripcion = rs.getString(4);
            String editorial = rs.getString(5);
            Libro libro1 = new Libro(titulo, isbn, descripcion, editorial, autor);
            libros.add(libro1);
        }
        return libros;
    }
}  