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
import modelo.Categoria;
import modelo.Pelicula;
import modelo.Videoclub;

/**
 *
 * @author Alumno_2DAW
 */
public class BD {
    private  String driver = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/sakila";
    private Connection conn = null;
    private ResultSet rs = null;
    
    public BD() throws ClassNotFoundException, SQLException{
        Class.forName(driver);
        conn = DriverManager.getConnection(url,"root","");
    }
    
    public List<Categoria> getCategorias() throws SQLException{
        List<Categoria> categorias = new ArrayList<Categoria>();
        String sql = "SELECT category_id,name from category";
        Statement st = conn.createStatement();
        rs = st.executeQuery(sql);
        while(rs.next()){
            int id = rs.getInt(1);
            String nombre =rs.getString(2);
            Categoria categoria = new Categoria(id, nombre);
            categorias.add(categoria);
        }
        
        return categorias;
    }
    
    public List<Videoclub> getVideoclubs(int id) throws SQLException{
        List<Videoclub> videoclubs = new ArrayList<Videoclub>();
        String sql = "SELECT store.store_id, store.nombre from store where store.store_id in(SELECT DISTINCT(inventory.store_id) FROM inventory where inventory.film_id in(SELECT film_category.film_id from film_category where film_category.category_id =(SELECT category.category_id FROM category WHERE category_id="+id+")))";
        Statement st = conn.createStatement();
        rs = st.executeQuery(sql);
        while(rs.next()){
            int id_store = rs.getInt(1);
            String nombre =rs.getString(2);
            Videoclub videoclub = new Videoclub(id_store, nombre);
            videoclubs.add(videoclub);
        }
        
        return videoclubs;
    }
    public List<Pelicula> getPeliculas(int categoria_id, int videoclub_id) throws SQLException{
         List<Pelicula> peliculas = new ArrayList<Pelicula>();
         String sql = "SELECT film.film_id, film.title from film where film.film_id in ( SELECT film_category.film_id FROM film_category where film_category.category_id ="+categoria_id+" and film_category.film_id in ( SELECT inventory.film_id FROM inventory where inventory.store_id = ( SELECT store.store_id from store where store.store_id ="+videoclub_id+" ))) ";
         Statement st = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
         rs = st.executeQuery(sql);
         while(rs.next()){
            int id_film = rs.getInt(1);
            String nombre =rs.getString(2);
            Pelicula pelicula = new Pelicula(id_film, nombre);
            peliculas.add(pelicula);
        }
        
        return peliculas;
       
    }
}