<%@page import="java.util.List"%>
<%@page import="modelo.Pelicula"%>
<%@page import="controlador.BD"%>
<%@page contentType="text/xml" pageEncoding="ISO-8859-1"%>
<%
    BD conexion = new BD();
    int categoria_id = Integer.parseInt(request.getParameter("categoria"));
    int videoclub_id = Integer.parseInt(request.getParameter("videoclub"));

    List<Pelicula> peliculas = conexion.getPeliculas(categoria_id, videoclub_id);
    String xml = "<categorias><tienda>";
    for(int i=0; i<peliculas.size(); i++){
      
           xml += "<pelicula>"+peliculas.get(i).getTitle()+"</pelicula>";
      
        
    }
   xml += "</tienda></categorias>";
    out.print(xml);



%>