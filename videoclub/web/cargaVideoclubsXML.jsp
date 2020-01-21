<%@page import="java.util.List"%>
<%@page import="modelo.Videoclub"%>
<%@page import="controlador.BD"%>
<%@page contentType="text/xml" pageEncoding="ISO-8859-1"%>
<%
    BD conexion = new BD();
    int id = Integer.parseInt(request.getParameter("id"));
    List<Videoclub> videoclubs = conexion.getVideoclubs(id);
    String xml = "<tiendas>";
    for(int i=0; i<videoclubs.size(); i++){
        xml += "<tienda><codigo>"+videoclubs.get(i).getId()+"</codigo><nombre>"+videoclubs.get(i).getNombre()+"</nombre></tienda>";
       
        
    }
     xml += "</tiendas>";
    out.print(xml);



%>