<%@page import="java.util.List"%>
<%@page import="modelo.Ciudad"%>
<%@page import="controlador.BD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    BD conexion = new BD();
    List<Ciudad> ciudades = conexion.getCiudades();
    String json = "[";
    //{codigoprovincia: “-------“,nombreprovincia: “……..” }, 
    for(int i=0; i<ciudades.size()-1; i++){
        
        json += "{\"codigoprovincia\":"+ciudades.get(i).getId() +",\"nombreprovincia\":\""+ciudades.get(i).getNombre() +"\"},";
    }
      json += "{\"codigoprovincia\":"+ciudades.get(ciudades.size()-1).getId() +",\"nombreprovincia\":\""+ciudades.get(ciudades.size()-1).getNombre() +"\"}]";
  
      out.print(json);

%>