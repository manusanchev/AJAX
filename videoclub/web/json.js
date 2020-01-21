
         
function cargarCategoriasJSON(){
   
    var peticion =  new XMLHttpRequest();
    
    var category = document.getElementById("categoriaJSON");

    peticion.onreadystatechange = function(){
      
        if(this.status === 200 && this.readyState === 4){
            var categorias = JSON.parse(peticion.responseText);
            
        
            for (const dato of categorias) {
                category.innerHTML += "<option value='"+dato.codigoCategoria+"' onchange='cargarVideoclubsJSON(this)'>"+dato.nombreCategoria+"</option>";
            }
            
        }
    }

    peticion.open("GET","cargaCategoriasJSON.jsp",true);
    peticion.send(null);

}
function cargarVideoclubsJSON(id){
   
    var  peticion =  new XMLHttpRequest();
  
    var videoclub = document.getElementById("videoclubJSON");
    peticion.onreadystatechange = function(){
       
      if(this.status === 200 && this.readyState === 4){
          var videoclubRespuesta = JSON.parse(peticion.responseText);
          videoclub.innerHTML ="";
       
         for (const dato of videoclubRespuesta) {
        
            videoclub.innerHTML += "<option value='"+dato.codigoVideoclub+"'>"+dato.nombreVideoclub+"</option>";
          }
          
          
      }
     }
    var mandar = "id="+encodeURIComponent(id)+"&ncache="+Math.random(); 
   
    peticion.open("POST","cargaVideoclubsJSON.jsp",true);
    peticion.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    peticion.send(mandar);
  
   
}
function cargarPeliculasJSON(){
    var peticion =  new XMLHttpRequest();
  
    var peliculasDiv = document.getElementById("peliculasJSON");
    peticion.onreadystatechange = function(){
       console.log(this.status);
      if(this.status === 200 && this.readyState === 4){
          var peliculasRespuesta = JSON.parse(peticion.responseText);
          
          peliculasDiv.innerHTML ="<h1>Peliculas disponible</h1><br>";
       
         for (const dato of peliculasRespuesta) {
        
            peliculasDiv.innerHTML += dato.nombrePelicula+"<br><hr>";
          }
          
          
      }
     }
     
    var mandar = crear_stringJSON();
   
    peticion.open("POST","cargaPeliculasJSON.jsp",true);
    peticion.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    peticion.send(mandar);
  
}
function crear_stringJSON(){
    var categoria = document.getElementById("categoriaJSON");
    var videoclub = document.getElementById("videoclubJSON");
    console.log(categoria.value);
    console.log(videoclub.value);
    return  "categoria="+encodeURIComponent(categoria.value)+"&videoclub="+encodeURIComponent(videoclub.value)+"&ncache="+Math.random(); 
}


