<%@page import="java.util.List"%>
<%@page import="modelo.Ciudad"%>
<%@page import="controlador.BD"%>
<%@page contentType="text/xml" pageEncoding="UTF-8"%>

<%
    BD conexion = new BD();
    List<Ciudad> ciudades = conexion.getCiudades();
    String xml = "<provincias>";
    //{codigoprovincia: “-------“,nombreprovincia: “……..” }, 
    for(int i=0; i<ciudades.size()-1; i++){
        
        xml += "<provincia><codigo>"+ciudades.get(i).getId() +"</codigo><nombre>"+ciudades.get(i).getNombre() +"</nombre></provincia>";
    }
      xml += "<provincia><codigo>"+ciudades.get(ciudades.size()-1).getId() +"</codigo><nombre>"+ciudades.get(ciudades.size()-1).getNombre() +"</nombre></provincia></provincias>";
  
      out.print(xml);

%>


 