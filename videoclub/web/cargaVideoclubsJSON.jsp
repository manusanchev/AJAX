<%@page import="java.util.List"%>
<%@page import="modelo.Videoclub"%>
<%@page import="controlador.BD"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    BD conexion = new BD();
    int id = Integer.parseInt(request.getParameter("id"));
    List<Videoclub> videoclubs = conexion.getVideoclubs(id);
    String json = "[";
    for(int i=0; i<videoclubs.size(); i++){
        if(i<videoclubs.size()-1){
             json += "{\"codigoVideoclub\":"+videoclubs.get(i).getId()+",\"nombreVideoclub\":\""+videoclubs.get(i).getNombre()+"\"},";
        }else{
             json += "{\"codigoVideoclub\":"+videoclubs.get(i).getId()+",\"nombreVideoclub\":\""+videoclubs.get(i).getNombre()+"\"}";
        }
       
        
    }
    json += "]";
    out.print(json);



%>