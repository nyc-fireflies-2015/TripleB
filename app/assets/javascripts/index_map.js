function newIndexMap(pos, map) {
  var marker = new google.maps.Marker({
    position: pos,
    map: map,
    title: 'Hello World!'
  });

  var bikeLayer = new google.maps.BicyclingLayer();
  bikeLayer.setMap(map);
}

var markers = function(lats,lngs,map){
  var latitudes = lats
  var longitudes = lngs
  for (var i=0; i < lats.length; i++){
    var coord = new google.maps.LatLng(lats[i],lngs[i]);
    var marker = new google.maps.Marker({
      position: coord,
      map: map,
      title: 'Hello World!'
    })
    marker.setMap(map);
  }
}

document.addEventListener('DOMContentLoaded', function(){
  var lat = Number($('#current_user_lat').text());
  var lng = Number($('#current_user_lng').text());
  var myPosition = {lat: Number(lat), lng: Number(lng)};


  var map = new google.maps.Map(document.getElementsByClassName('index_position_map')[0], {
    center: myPosition,
    scrollwheel: false,
    zoom: 14
  });


  newIndexMap(myPosition, map);

  var latitudes = $('.latitude').map(function(index,item){ return Number($(item).text());})
  var longitudes = $('.longitude').map(function(index,item){ return Number($(item).text());})

  markers(latitudes,longitudes,map)
})