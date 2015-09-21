function initDirMap() {
  var lat = $('#lat').text();
  var lng = $('#lng').text();
  var latMech = $('#lat_mech').text();
  var lngMech = $('#lng_mech').text();
  var myLatLng = {lat: Number(lat), lng: Number(lng)};
  var mechLatLng = {lat: Number(latMech), lng: Number(lngMech)};
  // Create a map object and specify the DOM element for display.
  var directionsService = new google.maps.DirectionsService;
  var directionsDisplay = new google.maps.DirectionsRenderer;
  var directionMap = new google.maps.Map(document.getElementsByClassName('direction_map')[0], {
    center: myLatLng,
    scrollwheel: false,
    zoom: 14
  });

  directionsDisplay.setMap(directionMap);

  calculateAndDisplayRoute(directionsService, directionsDisplay, mechLatLng, myLatLng);


  var bikeLayer = new google.maps.BicyclingLayer();
  bikeLayer.setMap(directionMap);
}

function calculateAndDisplayRoute(directionsService, directionsDisplay, origin, destination) {
  directionsService.route({
    origin: origin,
    destination: destination,
    travelMode: google.maps.TravelMode.BICYCLING
  }, function(response, status) {
    if (status === google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });
};

document.addEventListener('DOMContentLoaded', function(){
  initDirMap();
})