$(document).ready(function(){


  $(window).load(function(){

    function updatePos(lat,longit){
      var userId = document.getElementById("user_id").innerHTML;
      $.ajax({
        url:"/users/" + userId,
        method:"PATCH",
        data:{ latitude: lat, longitude: longit }
        }).done(function(){
          alert("your update is finished")
        })
    }

    function showPosition(position){
      latitude = position.coords.latitude;
      longitude = position.coords.longitude;
      updatePos(latitude,longitude);
    }

    function getLocation(){
      if (navigator.geolocation){
        navigator.geolocation.getCurrentPosition(showPosition)
      }
    }
    getLocation();

  })


});