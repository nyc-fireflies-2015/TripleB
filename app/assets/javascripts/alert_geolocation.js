$(document).ready(function(){


  $(window).load(function(){
    var latitude;
    var longitude;

    function getLocation(){
      if (navigator.geolocation){
        navigator.geolocation.getCurrentPosition(showPosition)
      }
      else {

      }
    }

    function showPosition(position){
      latitude = position.coords.latitude;
      longitude = position.coords.longitude;
      alert(latitude)
      $('#latitude').val(latitude);
      $('#longitude').val(longitude);
    }

    getLocation();
  })

});