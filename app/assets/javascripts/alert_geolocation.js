$(document).ready(function(){
  <p id="lat_long"></p>

  <button onclick= "getLocation()">get location</button>
  var x = document.getElementById("lat_long");

  $('#alert_form').on("submit",function(){
    function getLocation(){
      if (navigator.geolocation){
        navigator.geolocation.getCurrentPosition(showPosition)
      }
      else {
        x.innerHTML = "geolocation not supported"
      }
    }

    function showPosition(position){
      x.innerHTML = "Latitude:" + position.coords.latitude +"<br>Longitude:" + position.coords.longitude;
    }

    getLocation();

  })

});