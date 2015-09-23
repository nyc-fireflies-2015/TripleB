function newIndexMap(pos) {
  // Create a map object and specify the DOM element for display.
  var map = new google.maps.Map(document.getElementsByClassName('index_position_map')[0], {
    center: pos,
    scrollwheel: false,
    zoom: 14
  });


  var marker = new google.maps.Marker({
    position: pos,
    map: map,
    title: 'Hello World!'
  });

  var indexLat = $('#alert_coord_lat').text();
  var indexLng = $('#alert_coord_lng').text();

  function convertCoords(coordArray){
    var coords = coordArray;
    split = coords.split(',');
    arr = split.splice(1,split.length);
    return arr.map(function(coord){ return Number(coord)});
  }

  function markers(lats,lngs){

  }
  markers()
  var results = convertCoords(indexLat);
  debugger
  var bikeLayer = new google.maps.BicyclingLayer();
  bikeLayer.setMap(map);
}

document.addEventListener('DOMContentLoaded', function(){
  var lat = Number($('#current_user_lat').text());
  var lng = Number($('#current_user_lng').text());
  var myLatLng = {lat: Number(lat), lng: Number(lng)};
  newIndexMap(myLatLng);
})