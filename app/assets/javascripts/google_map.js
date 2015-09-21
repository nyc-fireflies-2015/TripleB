
function initMap() {
  var lat = $('#lat').text();
  var lng = $('#lng').text();
  var myLatLng = {lat: Number(lat), lng: Number(lng)};
  // Create a map object and specify the DOM element for display.
  var map = new google.maps.Map(document.getElementsByClassName('location_map')[0], {
    center: myLatLng,
    scrollwheel: false,
    zoom: 14
  });


  var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: 'Hello World!'
  });


  var bikeLayer = new google.maps.BicyclingLayer();
  bikeLayer.setMap(map);
}

document.addEventListener('DOMContentLoaded', function(){
  initMap();
})