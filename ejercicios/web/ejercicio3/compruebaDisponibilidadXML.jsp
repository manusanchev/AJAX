<%@page import="Controlador.BD"%>
<%@page contentType="text/xml" pageEncoding="ISO-8859-1"%>

<%
    String usuario = request.getParameter("usuario");
    BD conexion = new BD();
    
  
    String noDisponible = "<respuesta><disponible>no</disponible><alternativas><login>"+usuario+"100</login><login>123"+usuario+"</login><login>"+usuario+"otro</login><login>"+usuario+"a</login></alternativas></respuesta>";
    String respuesta = conexion.comprobarUsuario(usuario) ? noDisponible : "<respuesta><disponible>si</disponible></respuesta>" ;
    out.print(respuesta);
   
%>
