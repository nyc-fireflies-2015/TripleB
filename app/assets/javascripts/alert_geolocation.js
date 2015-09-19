$(document).ready(function(){
  <p id="lat_long"></p>

  <button onclick= "getLocation()">get location</button>
  var x = document.getElementById("lat_long");
  var latitutde;
  var longitude;

  $('#alert_form').load(function(){
    function getLocation(){
      if (navigator.geolocation){
        navigator.geolocation.getCurrentPosition(showPosition)
      }
      else {
        x.innerHTML = "geolocation not supported"
      }
    }

    function showPosition(position){
      latitude = position.coords.latitude;
      longitude = position.coords.longitude;
    }
    getLocation();


  })

});