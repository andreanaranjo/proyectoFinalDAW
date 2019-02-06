function notificar(){
	var mensaje = "Se han enviado sus datos correctamente";
	window.confirm(mensaje);
	location.reload();
}

function myMap() {
var mapProp= {
    center:new google.maps.LatLng(-1.831239,-78.183403),
    zoom:5,
};
var map=new google.maps.Map(document.getElementById("map"),mapProp);
}