<%@page import="java.util.List"%>
<%@page import="modelo.Libro"%>
<%@page import="controlador.BD"%>
<%@page contentType="text/xml" pageEncoding="UTF-8"%>
<%
    BD conexion = new BD();
    String consulta = request.getParameter("consulta");
    List<Libro> libros = conexion.getLibros(consulta);
    
    String xml = "<libros>";
    for(int i=0; i<libros.size(); i++){
        xml += "<libro><isbn>"+libros.get(i).getIsbn()+"</isbn><titulo>"+libros.get(i).getTitulo() +"</titulo><autor>"+libros.get(i).getAutor() +"</autor><descripcion>"+libros.get(i).getDescripcion() +"</descripcion><editorial>"+libros.get(i).getEditorial()+"</editorial></libro>";
    }

xml += "</libros>";
out.print(xml);
%>