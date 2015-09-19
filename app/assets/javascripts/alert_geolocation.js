$(document).ready(function(){


  $(window).load(function(){
    function getLocation(){
      if (navigator.geolocation){
        navigator.geolocation.getCurrentPosition(showPosition)
      }
      else {

      }
    }

    function showPosition(position){
      latitude = position.coords.latitude);
      longitude = position.coords.longitude;
      $('#location').text(latitude);
    }
    getLocation();


  })

});