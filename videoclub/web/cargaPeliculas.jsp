<%@page import="java.util.List"%>
<%@page import="modelo.Pelicula"%>
<%@page import="controlador.BD"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    BD conexion = new BD();
    int categoria_id = Integer.parseInt(request.getParameter("categoria"));
    int videoclub_id = Integer.parseInt(request.getParameter("videoclub"));

    List<Pelicula> peliculas = conexion.getPeliculas(categoria_id, videoclub_id);
    String json = "[";
    for(int i=0; i<peliculas.size(); i++){
        if(i<peliculas.size()-1){
             json += "{\"codigoPelicula\":"+peliculas.get(i).getId()+",\"nombrePelicula\":\""+peliculas.get(i).getTitle()+"\"},";
        }else{
             json += "{\"codigoPelicula\":"+peliculas.get(i).getId()+",\"nombrePelicula\":\""+peliculas.get(i).getTitle()+"\"}";
        }
       
        
    }
    json += "]";
    out.print(json);



%>