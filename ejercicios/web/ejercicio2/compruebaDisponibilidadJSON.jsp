<%@page import="Controlador.BD"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    String usuario = request.getParameter("usuario");
    BD conexion = new BD();
    
  
    String noDisponible = "{disponible: 'no' , alternativas : ['123"+usuario+"','"+usuario+"otro','"+usuario+"a','"+usuario+"100']}";
    String respuesta = conexion.comprobarUsuario(usuario) ? noDisponible : "{disponible : 'si'}" ;
    out.print(respuesta);
   
%>
