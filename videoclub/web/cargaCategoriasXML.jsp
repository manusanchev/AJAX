<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="controlador.BD"%>
<%@page contentType="text/xml" pageEncoding="ISO-8859-1"%>

<%
    BD conexion = new BD();
    
    List<Categoria> categorias = conexion.getCategorias();
    String xml = "<categorias>";
    for(int i=0; i<categorias.size(); i++){
       
             xml += "<categoria><codigo>"+categorias.get(i).getId()+"</codigo><nombre>"+categorias.get(i).getNombre()+"</nombre></categoria>";
        
        
    }
    xml += "</categorias>";
    out.print(xml);



%>