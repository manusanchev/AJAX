<%@page import="java.util.List"%>
<%@page import="modelo.Poblacion"%>
<%@page import="controlador.BD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    BD conexion = new BD();
    
    int id = Integer.parseInt(request.getParameter("ciudad"));
    List<Poblacion> poblaciones = conexion.getPoblacion(id);
    String json = "[";
    //{codigoprovincia: “-------“,nombreprovincia: “……..” }, 
    for(int i=0; i<poblaciones.size()-1; i++){
        
        json += "{\"codigopoblacion\":"+poblaciones.get(i).getId() +",\"nombrepoblacion\":\""+poblaciones.get(i).getNombre() +"\"},";
    }
      json += "{\"codigopoblacion\":"+poblaciones.get(poblaciones.size()-1).getId() +",\"nombrepoblacion\":\""+poblaciones.get(poblaciones.size()-1).getNombre() +"\"}]";
  
      out.print(json);

%>