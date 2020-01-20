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
            Videoclub videoclub = new Videoclub(id, nombre);
            videoclubs.add(videoclub);
        }
        
        return videoclubs;
    }
}