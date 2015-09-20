function initMap() {
  var lat = $('#lat').text();
  var lng = $('#lng').text();
  var latMech = $('#lat_mech').text();
  var lngMech = $('#lng_mech').text();
  var myLatLng = {lat: Number(lat), lng: Number(lng)};
  var mechLatLng = {lat: Number(latMech), lng: Number(lngMech)};
  // Create a map object and specify the DOM element for display.
  var map = new google.maps.Map(document.getElementsByClassName('map')[0], {
    center: myLatLng,
    scrollwheel: false,
    zoom: 14
  });

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

document.addEventListener('DOMContentLoaded', function(){
  initMap();
})