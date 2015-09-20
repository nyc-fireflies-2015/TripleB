
function initMap() {
  var lat = $('#lat').text();
  var lng = $('#lng').text();
  var latMech = $('#lat_mech').text();
  var lngMech = $('#lng_mech').text();
  var myLatLng = {lat: Number(lat), lng: Number(lng)};
  var mechLatLng = {lat: Number(latMech), lng: Number(lngMech)};
  // Create a map object and specify the DOM element for display.
  var directionsService = new google.maps.DirectionsService;
  var directionsDisplay = new google.maps.DirectionsRenderer;
  var map = new google.maps.Map(document.getElementsByClassName('map')[0], {
    center: myLatLng,
    scrollwheel: false,
    zoom: 14
  });

  directionsDisplay.setMap(map);

  calculateAndDisplayRoute(directionsService, directionsDisplay, mechLatLng, myLatLng);


  var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: 'Hello World!'
  });

  var mechMarker = new google.maps.Marker({
    position: mechLatLng,
    map: map,
    title: "sup"
  });

  var bikeLayer = new google.maps.BicyclingLayer();
  bikeLayer.setMap(map);
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
  initMap();
})