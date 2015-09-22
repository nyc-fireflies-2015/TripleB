function newAlertMap(pos) {
  // Create a map object and specify the DOM element for display.
  var map = new google.maps.Map(document.getElementsByClassName('user_position_map')[0], {
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

document.addEventListener('DOMContentLoaded', function(){
  var lat = Number($('#current_user_lat').text());
  var lng = Number($('#current_user_lng').text());
  var myLatLng = {lat: Number(lat), lng: Number(lng)};
  newAlertMap(myLatLng);
})