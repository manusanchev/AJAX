
package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Libro;


public class BD {
    private  String driver = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/books";
    private Connection conn = null;
    private ResultSet rs = null;
    
    public BD() throws ClassNotFoundException, SQLException{
        Class.forName(driver);
        conn = DriverManager.getConnection(url,"root","");
    }
    
    public List<Libro> comprobarDisponibilidad(String tematica) throws SQLException{
        String sql = "SELECT Titulo, autor.Nombre FROM titulos INNER JOIN autor on autor.IDAutor = titulos.IDautor where Titulo like '%"+tematica+"%'";
        Statement st = conn.createStatement();
        rs = st.executeQuery(sql);
        List<Libro> titulos = new ArrayList<Libro>();
        while(rs.next()){
            String titulo = rs.getString(1);
            String autor = rs.getString(2);
            Libro libro = new Libro(titulo, autor);
            titulos.add(libro);
        }
        return titulos;
    }
}
