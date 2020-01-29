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
    peticion.open("POST","cargaCiudadesJSON.jsp",true);
    peticion.send();
}

function cargarPoblacion(){
    var selectPoblacion = document.getElementById("poblacion");
    var peticion = new XMLHttpRequest();
    

    peticion.onreadystatechange = function(){
        if(this.status === 200 && this.readyState === 4){
            var respuesta = JSON.parse(this.responseText);
           for (const datos of respuesta) {
           
                selectPoblacion.innerHTML +="<option value='"+datos.nombrepoblacion+"'>"+datos.nombrepoblacion+"</option>";
            
           }
        }
    }
    var q = crear_query_string();

  
    peticion.open("POST","cargaMunicipiosJSON.jsp",true);
    peticion.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    peticion.send(q);
}

function crear_query_string(){
    var ciudad = document.getElementById("ciudad");
    return "ciudad="+encodeURIComponent(ciudad.value)+"&nCache="+Math.random();
}

var errores ="";
function validar(event){
    var ciudad = document.getElementById("ciudad");
    var poblacion = document.getElementById("poblacion");
    var fechaSalida = document.getElementById("fechaSalida");
    var horarioSalida= document.getElementById("horarioSalida");
    var fechaRegreso = document.getElementById("fechaRegreso");
    var horarioregreso = document.getElementById("horarioRegreso");
    var adultos = document.getElementById("adultos");
    var ninos = document.getElementById("ninos");
    var bebes = document.getElementById("bebes");
    errores = document.getElementById("errores");

    if(!validarFechas(fechaRegreso.value,fechaSalida.value) && !compruebaSelect(ciudad.value,poblacion.value)){
        alert("correcto");
    }else{
        event.preventDefault();
    }

}


function validarFechas(regreso,salida){
    var error1 = false;
    
    if(regreso<salida || (regreso.length ==0 && salida.length==0)){
        errores.innerText = "La fecha de salida debe ser anterior a la fecha de regreso";
        error1 = true;
    }
    return error1;

}
function compruebaSelect(ciudad,poblacion){
    var error = false;

    if(ciudad=="Elige una ciudad" || poblacion=="Elige una ciudad"){
       
        errores.innerText = "Debes elegir una ciudad y una poblacion";
        error = true;
    }
  
    return error;
   
}

