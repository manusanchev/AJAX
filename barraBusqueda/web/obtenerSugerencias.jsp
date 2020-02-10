<%@page import="java.util.List"%>
<%@page import="controlador.BD"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>

<%
    BD conexion = new BD();
    String campo = request.getParameter("dato");
    List<String> libros = conexion.getTituloLibros(campo);
    String json = "[";
    for(int i=0; i<libros.size()-1; i++){
        json += "{\"titulo\":\""+libros.get(i)+"\"},";
    }
    json += "{\"titulo\":\""+libros.get(libros.size()-1)+"\"}]";
    out.print(json);
%>