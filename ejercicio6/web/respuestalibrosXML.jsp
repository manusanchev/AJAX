<%@page import="modelo.Libro"%>
<%@page import="java.util.List"%>
<%@page import="controlador.BD"%>
<%@page contentType="text/xml" pageEncoding="ISO-8859-1"%>

<%
    String tematica = request.getParameter("tematica");
    BD conexion = new BD();
   List<Libro> titulos = conexion.comprobarDisponibilidad(tematica);
    String salida ="<respuesta>";
    if(titulos.size()==0){
        salida += "<encontrado>no</encontrado>";
    }else{
        salida+= "<encontrado>si</encontrado><libros>";
        
        for(int i=0; i<titulos.size(); i++){
            salida+="<titulo>"+titulos.get(i).getTitulo()+"</titulo><autor>"+titulos.get(i).getAutor()+"</autor>";
        }
        salida+="</libros>";
    }
    salida+="</respuesta>";

    out.print(salida);

%>