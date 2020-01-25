

<%@page import="controlador.BD"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Poblacion"%>
<%@page import="modelo.Ciudad"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int ciudad = Integer.parseInt(request.getParameter("ciudad"));
    String poblacion = request.getParameter("poblacion");
    String fechaSalida = request.getParameter("fechaSalida");
    String horarioSalida = request.getParameter("horarioSalida");
    String fechaRegreso = request.getParameter("fechaRegreso");
    String horarioRegreso = request.getParameter("horarioRegreso");
    String adultos = request.getParameter("adultos");
    String ninos = request.getParameter("ninos");
    String bebes = request.getParameter("bebes");
    BD conexion  = new BD();
    List<Ciudad> ciudades = conexion.getCiudades();
    String ciudadSalida ="";
    

    for (int i = 0; i < ciudades.size(); i++) {
            if(ciudades.get(i).getId() == ciudad){
                ciudadSalida = ciudades.get(i).getNombre();
                break;
            }
         
     }
   
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <h1>Billete</h1>
    <p>ciudad de salida: <%= ciudadSalida %></p><br>
    <p>poblacion de salida: <%= poblacion %></p><br>
    <p>fecha de salida: <%= fechaSalida %></p><br>
    <p>fecha de llegada: <%= fechaRegreso %></p><br>
    <p>horario de salida: <%= horarioSalida %></p><br>
    <p>horario de llegada: <%= horarioRegreso %></p><br>
    <p>adultos: <%= adultos %></p><br>
    <%if(ninos.length() > 0){%>
    <p>Niños: <%= ninos %></p><br>
       <%}%>
    <%if(bebes.length() > 0){%>
    <p>niños < 4: <%= bebes %></p><br>
    <%}%>
</body>
</html>