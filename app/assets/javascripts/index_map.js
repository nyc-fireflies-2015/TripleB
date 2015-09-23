var AlertMap = function(position, domElmForMap){
  this.userPosition = position;
  this.map = new google.maps.Map(domElmForMap, {center: this.userPosition, scrollwheel: false, zoom: 14 });
  this.userMarker = this.createMarker(this.userPosition, 'this is you');
  this.toggleBikeLayer();
}

AlertMap.prototype.createMarker = function(position, label){
  return new google.maps.Marker( {position: position, map: this.map, title: label });
};

AlertMap.prototype.toggleBikeLayer = function(){
  var bikeLayer = new google.maps.BicyclingLayer();
  bikeLayer.setMap(this.map);
}

AlertMap.prototype.addAlerts = function(alertCoordinates){
  for(var i = 0; i <= alertCoordinates.length; i++){
    this.addAlert(alertCoordinates[i]);
  }
}

AlertMap.prototype.addAlert = function(alertCoordinate){
  var marker = this.createMarker(alertCoordinate, 'Needs Help')
  marker.setMap(this.map)
}

var createCoordinate = function(latitude,longitude){
  return { lat: Number(latitude), lng: Number(longitude) };
};

document.addEventListener('DOMContentLoaded', function(){
  if( $('#alert-index-map').length > 0 ){
    var userPos = createCoordinate($('#current_user_lat').text(), $('#current_user_lng').text());
    var mapDomElm = $('#alert-index-map')[0];
    var alertMap = new AlertMap(userPos, mapDomElm);

    var latitudes = $('.latitude').map(function(index,item){ return Number($(item).text());})
    var longitudes = $('.longitude').map(function(index,item){ return Number($(item).text());})

    var alertCoordinates = latitudes.map(function(index, item){
      return createCoordinate(item, longitudes[index]);
    });

    alertMap.addAlerts(alertCoordinates);
  }
})