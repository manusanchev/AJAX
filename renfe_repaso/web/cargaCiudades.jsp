
<%@page import="java.util.List"%>
<%@page import="modelo.Ciudad"%>
<%@page import="controlador.BD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    BD conexion = new BD();
    List<Ciudad> ciudades = conexion.getCiudades();
    
    String json = "[";
    
    for(int i=0; i<ciudades.size()-1; i++){
        json +="{\"codigoCiudad\":\""+ciudades.get(i).getCodPro() +"\",\"nombreCiudad\":\""+ciudades.get(i).getNombre() +"\"},";
    }
    json+= "{\"codigoCiudad\":\""+ciudades.get(ciudades.size()-1).getCodPro()+"\",\"nombreCiudad\":\""+ciudades.get(ciudades.size()-1).getNombre() +"\"}]";
   out.print(json); 
    
%>