$(document).ready(function(){


  $('#send_help_form').on("submit",function(){
    var userId = document.getElementById("user_id").innerHTML;
    console.log(userId)

    function getLocation(){
      if (navigator.geolocation){
        navigator.geolocation.getCurrentPosition(showPosition)
      }
    }

    function updatePos(lat,longit){
      $.ajax({
        url:"/users/" + userId,
        method:"PATCH",
        data:{ latitude: lat, longitude: longit }
        }).done(function(response){
          console.log(response)
        })

    }

    function showPosition(position){
      latitude = position.coords.latitude;
      longitude = position.coords.longitude;
      updatePos(latitude,longitude);
    }

    getLocation();
  })

});