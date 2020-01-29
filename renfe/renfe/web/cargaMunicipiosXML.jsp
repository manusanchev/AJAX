<%@page import="java.util.List"%>
<%@page import="modelo.Poblacion"%>
<%@page import="controlador.BD"%>
<%@page contentType="text/xml" pageEncoding="UTF-8"%>

<%

    BD conexion = new BD();
    
    int id = Integer.parseInt(request.getParameter("ciudad"));
    List<Poblacion> poblaciones = conexion.getPoblacion(id);
    String xml = "<municipios>";
    //{codigoprovincia: “-------“,nombreprovincia: “……..” }, 
    for(int i=0; i<poblaciones.size()-1; i++){
        
        xml += "<nombre>"+poblaciones.get(i).getNombre() +"</nombre>";
    }
      xml += "<nombre>"+poblaciones.get(poblaciones.size()-1).getNombre() +"</nombre></municipios>";
  
      out.print(xml);

%>

