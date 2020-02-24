window.onload = inicializar;


function inicializar(){
      letras = document.getElementById("letras");
    
     cancion = [];
     colores = ["green","red","blue","black","grey"];

     x = 0;
     y = 0;

     iniciar();
}
function iniciar(){
   
    var request = new XMLHttpRequest();

    request.onreadystatechange = function () {
    if (this.readyState === 4) {
        letra = JSON.parse(this.responseText);
        cancion = letra.lyrics.split("\n");
      
        intervalo = setInterval(mostrarCancion,3000);
    }
        
    };
   request.open('GET', 'https://api.lyrics.ovh/v1/adele/hello');
    request.send();

}

function mostrarCancion(){
    letras.classList.add('animated', 'slideInDown','infinite','delay-3s')
    if(x<cancion.length-1){
        if(cancion[x] == "") x++;
        letras.innerText = cancion[x];

        letras.style.color = colores[y];
       
        x++;
        y++;
        if(y>colores.length-1){
            y=0;
        }
    }else{
        clearInterval(intervalo);
    }
   
}