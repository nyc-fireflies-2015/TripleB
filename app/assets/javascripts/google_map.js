function initMap(lat, lng) {
  // Create a map object and specify the DOM element for display.
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: lat, lng: lng},
    scrollwheel: false,
    zoom: 15
  });

  var bikeLayer = new google.maps.BicyclingLayer();
  bikeLayer.setMap(map);
}

document.addEventListener('DOMContentLoaded', function(){
  navigator.geolocation.getCurrentPosition(function(position){
    console.log(position);
    initMap(position.coords.latitude, position.coords.longitude);
  });

})