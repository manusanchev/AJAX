<%@page contentType="text/xml" pageEncoding="ISO-8859-1"%>

<%
     String dato1 = request.getParameter("fecha");
     String dato2 = request.getParameter("codigo");
     String dato3 = request.getParameter("telefono");

     out.print("<respuesta><mensaje>Resultados...</mensaje><parametros><telefono>"+dato3+"</telefono><codigo_postal>"+dato2+"</codigo_postal><fecha_nacimiento>"+dato1+"</fecha_nacimiento></parametros></respuesta>");
%>