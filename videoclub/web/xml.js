function cargarCategoriasXML(){
   
    var peticion =  new XMLHttpRequest();
    
    var category = document.getElementById("categoriaXML");

    peticion.onreadystatechange = function(){
      
        if(this.status === 200 && this.readyState === 4){
            var categorias = peticion.responseXML;
            var codigo = categorias.getElementsByTagName("codigo");
            var nombre = categorias.getElementsByTagName("nombre");
            for (let i = 0; i < codigo.length; i++) {
                category.innerHTML += "<option value='"+codigo[i].firstChild.nodeValue+"' onchange='cargarVideoclubsXML(this)'>"+nombre[i].firstChild.nodeValue+"</option>";
            }
          
        }
    }

    peticion.open("GET","cargaCategoriasXML.jsp",true);
    peticion.send(null);

}
function cargarVideoclubsXML(id){
   
   
    var peticion =  new XMLHttpRequest();
  
    var videoclub = document.getElementById("videoclubXML");
    peticion.onreadystatechange = function(){
       
      if(this.status === 200 && this.readyState === 4){
          var videoclubRespuesta = peticion.responseXML;
          var codigo = videoclubRespuesta.getElementsByTagName("codigo");
          var nombre = videoclubRespuesta.getElementsByTagName("nombre");
          
          videoclub.innerHTML ="";
         for (let i = 0; i < codigo.length; i++) {
            videoclub.innerHTML +=  "<option value='"+codigo[i].firstChild.nodeValue+"'>"+nombre[i].firstChild.nodeValue+"</option>";
        }
        
         
          
      }
     }
    var mandar = "id="+encodeURIComponent(id)+"&ncache="+Math.random(); 
   
    peticion.open("POST","cargaVideoclubsXML.jsp",true);
    peticion.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    peticion.send(mandar);
  
   
}
function cargarPeliculasXML(){
    
    var peticion =  new XMLHttpRequest();
  
    var peliculasDiv = document.getElementById("peliculasXML");
    peticion.onreadystatechange = function(){
       console.log(this.status);
      if(this.status === 200 && this.readyState === 4){
          var peliculasRespuesta = peticion.responseXML;
          
          peliculasDiv.innerHTML ="<h1>Peliculas disponible</h1><br>";
          var nombre = peliculasRespuesta.getElementsByTagName("pelicula");
        
         for (const dato of nombre) {
        
            peliculasDiv.innerHTML += dato.firstChild.nodeValue+"<br><hr>";
          }
          
          
      }
     }
     
    var mandar = crear_stringXML();
   
    peticion.open("POST","cargaPeliculasXML.jsp",true);
    peticion.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    peticion.send(mandar);
  
}
function crear_stringXML(){
    var categoria = document.getElementById("categoriaXML");
    var videoclub = document.getElementById("videoclubXML");
    console.log(categoria.value);
    console.log(videoclub.value);
    return  "categoria="+encodeURIComponent(categoria.value)+"&videoclub="+encodeURIComponent(videoclub.value)+"&ncache="+Math.random(); 
}


