
function initMap(pos) {
  // Create a map object and specify the DOM element for display.
  var map = new google.maps.Map(document.getElementsByClassName('location_map')[0], {
    center: pos,
    scrollwheel: false,
    zoom: 14
  });


  var marker = new google.maps.Marker({
    position: pos,
    map: map,
    title: 'Hello World!'
  });


  var bikeLayer = new google.maps.BicyclingLayer();
  bikeLayer.setMap(map);
}


var service = new google.maps.DistanceMatrixService();

function callback(response, status) {
  // debugger
  // console.log(response, status);
  var distance = response.rows[0].elements[0].distance.text;
  var duration = response.rows[0].elements[0].duration.text;
  $('#distance').val(distance);
  $('#duration').val(duration);

}

document.addEventListener('DOMContentLoaded', function(){

  var lat = Number($('#lat').text());
  var lng = Number($('#lng').text());
  var currentLat = Number($('#current_lat').text())
  var currentLng = Number($('#current_lng').text())

  var myLatLng = {lat: Number(lat), lng: Number(lng)};

  var googleOrig = new google.maps.LatLng(currentLat, currentLng);
  var googleDest = new google.maps.LatLng(lat, lng);

  initMap(myLatLng);

  service.getDistanceMatrix(
    {
      origins: [googleOrig],
      destinations: [googleDest],
      travelMode: google.maps.TravelMode.BICYCLING,
      unitSystem: google.maps.UnitSystem.IMPERIAL,
  }, callback);
})