<%@page import="java.util.List"%>
<%@page import="modelo.Libro"%>
<%@page import="controlador.BD"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%
    BD conexion = new BD();
   
    String consulta = request.getParameter("consulta");
   
    List<Libro> libros = conexion.getLibros(consulta);
    
    String xml = "[";
    for(int i=0; i<libros.size()-1; i++){
        String escape = libros.get(i).getDescripcion().replace("\"", "\'");
        xml += "{\"isbn\":\""+libros.get(i).getIsbn()+"\",\"titulo\":\""+libros.get(i).getTitulo() +"\",\"autor\":\""+libros.get(i).getAutor() +"\",\"descripcion\":\""+escape+"\",\"editorial\":\""+libros.get(i).getEditorial()+"\"},";
    }
 String escape = libros.get(libros.size()-1).getDescripcion().replace("\"", "\'");
   xml += "{\"isbn\":\""+libros.get(libros.size()-1).getIsbn()+"\",\"titulo\":\""+libros.get(libros.size()-1).getTitulo() +"\",\"autor\":\""+libros.get(libros.size()-1).getAutor() +"\",\"descripcion\":\""+escape+"\",\"editorial\":\""+libros.get(libros.size()-1).getEditorial()+"\"}]";

out.print(xml);
%>