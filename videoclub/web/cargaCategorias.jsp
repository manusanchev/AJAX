<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="controlador.BD"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    BD conexion = new BD();
    
    List<Categoria> categorias = conexion.getCategorias();
    String json = "[";
    for(int i=0; i<categorias.size(); i++){
        if(i<categorias.size()-1){
             json += "{\"codigoCategoria\":"+categorias.get(i).getId()+",\"nombreCategoria\":\""+categorias.get(i).getNombre()+"\"},";
        }else{
             json += "{\"codigoCategoria\":"+categorias.get(i).getId()+",\"nombreCategoria\":\""+categorias.get(i).getNombre()+"\"}";
        }
       
        
    }
    json += "]";
    out.print(json);



%>