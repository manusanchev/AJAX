window.onload = cargarCiudades;

 

function cargarCiudades(){
    var selectCiudades = document.getElementById("ciudad");
    var peticion = new XMLHttpRequest();

    peticion.onreadystatechange = function(){
        if(this.status === 200 && this.readyState === 4){
            var respuesta = JSON.parse(this.responseText);
           for (const datos of respuesta) {
           
             selectCiudades.innerHTML +="<option value='"+datos.codigoprovincia+"'>"+datos.nombreprovincia+"</option>";
           
           }
        }
    }
    peticion.open("POST","cargaCiudades.jsp",true);
    peticion.send();
}

function cargarPoblacion(){
    var selectPoblacion = document.getElementById("poblacion");
    var peticion = new XMLHttpRequest();
    

    peticion.onreadystatechange = function(){
        if(this.status === 200 && this.readyState === 4){
            var respuesta = JSON.parse(this.responseText);
           for (const datos of respuesta) {
           
                selectPoblacion.innerHTML +="<option value='"+datos.codigopoblacion+"'>"+datos.nombrepoblacion+"</option>";
            
           }
        }
    }
    var q = crear_query_string();

  
    peticion.open("POST","cargaMunicipios.jsp",true);
    peticion.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    peticion.send(q);
}

function crear_query_string(){
    var ciudad = document.getElementById("ciudad");
    return "ciudad="+encodeURIComponent(ciudad.value)+"&nCache="+Math.random();
}


function enviar(){
    
}